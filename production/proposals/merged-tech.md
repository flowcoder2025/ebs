# AI 기술 증빙 초안 (양식 5) — 그려줘 뚝딱

> infra 팀 작성 | 2026-03-26

## 1. 생성형 AI 기술 정보

| 구분 | 원산지 | 서비스명 | 핵심기술 |
|------|--------|----------|----------|
| 이미지 생성 | 오픈소스 (Stability AI 기반) | ComfyUI + DreamShaperXL Turbo v2.1 | Stable Diffusion XL, Latent Diffusion Model |
| 스타일 제어 | 오픈소스 | LoRA (ral-wtrclr-sdxl / ral-crztlgls-sdxl) | Low-Rank Adaptation, 스타일별 미세조정 |
| 구도 제어 | 오픈소스 (ControlNet) | ControlNet Scribble SDXL | 낙서 입력 → 구도/형태 가이드 |
| 캐릭터 일관성 | 오픈소스 (IP-Adapter) | IP-Adapter Plus SDXL | 이미지 프롬프트 기반 캐릭터 동일성 유지 |
| 영상 생성 (주력) | 중국 (Alibaba/Wan) | Wan 2.1 Image-to-Video 14B GGUF | 정지 이미지 → 모션 영상 변환, DiT 아키텍처 |
| 영상 생성 (보조) | 중국 (Kuaishou) | Kling v2.5 (ComfyUI API 노드) | 카메라 제어, 고품질 보조 클립 |
| 영상 편집 | 호주 (Blackmagic) | DaVinci Resolve | 타임라인 편집, 색보정 |
| 워크플로우 관리 | 오픈소스 | ComfyUI v0.18.2 | 노드 기반 AI 파이프라인 통합 |

## 2. 프로덕션 단계별 AI 활용

### 프리 프로덕션 (컨셉 아트 / 캐릭터 디자인)

**작업 설명 (100자 이내):**
아이의 낙서를 ControlNet scribble로 입력하고, DreamShaperXL + 화풍별 LoRA로 수채화/크리스탈 세계 컨셉아트를 생성. IP-Adapter로 캐릭터 일관성 확보.

**사용 도구:**
- ComfyUI + DreamShaperXL_Turbo_v2_1
- ControlNet Scribble SDXL (`controlnet-scribble-sdxl-1.0.safetensors`)
- LoRA: `ral-wtrclr-sdxl` (수채화), `ral-crztlgls-sdxl` (크리스탈/글리터)
- IP-Adapter Plus SDXL + CLIP-ViT-H-14

**증빙 항목:**
- 스크린샷: ComfyUI 워크플로우 캔버스 (노드 연결 전체)
- 프롬프트: 자연어 프롬프트 텍스트 + LoRA trigger 포함
- Before/After: 낙서 입력 이미지 → AI 변환 결과물

### 메인 프로덕션 (영상 생성)

**작업 설명 (100자 이내):**
프리 단계에서 생성한 스틸 이미지를 Wan 2.1 I2V에 입력하여 2초 모션 클립 생성. 카메라 무브먼트가 필요한 핵심 장면은 Kling API로 보조.

**사용 도구:**
- Wan 2.1 I2V 14B GGUF (`wan2.1-i2v-14b-480p-Q4_K_S.gguf`)
- Wan VAE (`wan_2.1_vae.safetensors`)
- Wan T5 encoder (`umt5-xxl-encoder-Q5_K_M.gguf`)
- Kling API (`KlingImage2VideoNode`, `KlingCameraControlI2VNode`)
- VHS_VideoCombine (16fps h264 MP4 출력)

**증빙 항목:**
- 스크린샷: Wan I2V 워크플로우 + Kling 노드 설정
- 프롬프트: 영상 모션 프롬프트 텍스트
- Before/After: 스틸 이미지 → 영상 클립 (프레임 스냅샷)

### 포스트 프로덕션 (편집 / 합성)

**작업 설명 (100자 이내):**
생성된 2초 클립들을 DaVinci Resolve에서 타임라인 편집. 장면 전환, 색보정, 내레이션 싱크 작업. 최종 MP4 FHD 16:9 출력.

**사용 도구:**
- DaVinci Resolve (편집/색보정/최종 출력)
- ComfyUI RealESRGAN x4 (필요 시 업스케일)

**증빙 항목:**
- 스크린샷: DaVinci Resolve 타임라인 편집 화면
- Before/After: 개별 클립 → 최종 편집본 비교

## 3. 통합 파이프라인 설계

### 전체 흐름도

```
[Phase 1: 낙서 준비]
  아이 낙서 스캔/촬영 (종이에 직접 그린 것)
    ↓
[Phase 2: AI 이미지 생성 — ComfyUI]
  ┌─────────────────────────────────────────────┐
  │ CheckpointLoaderSimple                       │
  │   → DreamShaperXL_Turbo_v2_1                │
  │                                              │
  │ ControlNetLoader                             │
  │   → controlnet-scribble-sdxl-1.0            │
  │                                              │
  │ LoRALoader (에피소드별 선택)                   │
  │   → ral-wtrclr-sdxl (수채화 화)              │
  │   → ral-crztlgls-sdxl (크리스탈 화)          │
  │   → 없음 (크레파스/연필 화)                    │
  │                                              │
  │ LoadImage (낙서 스캔)                         │
  │   → ControlNetApply (scribble)              │
  │     → CLIPTextEncode (자연어 프롬프트)        │
  │       → KSampler                             │
  │         (steps: 6, cfg: 2, dpmpp_sde/karras)│
  │           → VAEDecode → SaveImage            │
  │                                              │
  │ [캐릭터 일관성 분기]                           │
  │ IPAdapterPlus                                │
  │   + CLIPVisionEncode (레퍼런스 이미지)        │
  │   → KSampler → 캐릭터 포함 이미지             │
  └─────────────────────────────────────────────┘
    ↓ (생성된 스틸 이미지)
[Phase 3: AI 영상 생성 — ComfyUI]
  ┌─────────────────────────────────────────────┐
  │ [주력: Wan I2V 로컬]                          │
  │ UnetLoaderGGUF                               │
  │   → wan2.1-i2v-14b-480p-Q4_K_S.gguf        │
  │ WanImageToVideo (480x704, 33프레임)          │
  │   → KSampler                                 │
  │     (steps: 20, cfg: 5, uni_pc_bh2/simple)  │
  │     → VAEDecode → VHS_VideoCombine           │
  │       (16fps, h264, MP4)                     │
  │                                              │
  │ [보조: Kling API — 카메라 제어 장면]           │
  │ KlingCameraControlI2VNode                    │
  │   + KlingCameraControls (pan/zoom/orbit)     │
  │   → VIDEO 출력                                │
  └─────────────────────────────────────────────┘
    ↓ (2초 모션 클립 × N개)
[Phase 4: 편집 — DaVinci Resolve]
  타임라인 배치 → 장면 전환 → 색보정
    → 내레이션/효과음 싱크
      → 최종 출력: MP4 FHD 16:9 (업스케일 필요 시 RealESRGAN x4)
```

### 에피소드별 LoRA/프롬프트 매핑

| EP | 제목 | 화풍 | LoRA | 프롬프트 스타일 키워드 |
|----|------|------|------|----------------------|
| 01 | 크레파스 숲의 초대 | 크레파스 | 없음 | `crayon texture, thick strokes, vivid colors, waxy surface, bumpy` |
| 02 | 수채화 비의 정원 | 수채화 | ral-wtrclr-sdxl (0.8) | `ral-wtrclr, watercolor garden, wet-on-wet, bleeding edges, rain, soft wash` |
| 03 | 색종이 마을 축제 | 종이 콜라주 | 없음 | `paper craft, origami, folded paper, cut-out collage, colorful geometric` |
| 04 | 먹물 용의 눈물 | 수묵화 | 없음 | `ink wash painting, sumi-e, black ink dragon, monochrome, brush strokes, wet ink` |
| 05 | 반짝이 사막의 별 (전편) | 크리스탈/글리터 | ral-crztlgls-sdxl (0.8) | `ral-crztlgls, crystal glass desert, sparkling, iridescent, starlit sky` |
| 06 | 반짝이 사막의 별 (후편) | 크리스탈/글리터 | ral-crztlgls-sdxl (0.8) | `ral-crztlgls, crystal constellation, glowing stars, prism refraction` |
| 07 | 파스텔 구름 위의 산책 | 파스텔/분필 | ral-wtrclr-sdxl (0.4) | `pastel colors, soft chalk, dreamy clouds, gentle gradient, powdery texture` |
| 08 | 실뜨기 세계의 미로 | 실/자수 | 없음 | `thread and yarn texture, embroidery, woven fabric, tangled string maze` |
| 09 | 검은 얼룩의 세계 | 흑백/음화 반전 | 없음 | `monochrome negative, inverted colors, stark black and white, no color, void` |
| 10 | 모든 색이 하나로 | 전 화풍 혼합 | 장면별 전환 | EP01~09 키워드 혼합, `rainbow, all textures merging, celebration` |

### 하드웨어 제약 및 대응

| 항목 | 사양 | 제약 | 대응 |
|------|------|------|------|
| GPU | RTX 4070 12GB | VRAM 12GB | DreamShaperXL Turbo (6step) + Wan GGUF Q4 = 12GB 이내 |
| 이미지 해상도 | SDXL 기본 | 1024x1024 최대 | 기본 해상도 사용, 필요 시 RealESRGAN x4 업스케일 |
| 영상 해상도 | 480x704 | Wan GGUF 제약 | 최종 편집 시 업스케일로 FHD 도달 |
| 영상 길이 | 33프레임 (~2초 @16fps) | 클립 단위 제작 | 2초 클립 이어붙이기 → 장면 전환으로 자연스럽게 연결 |
| 3분 영상 | ~90개 클립 필요 | 생성 시간 | Wan I2V 1클립 ~3분 → 90클립 = ~4.5시간 (풀가동) |

## 4. 낙서 입력 → 결과물 Before/After 예시 설계

> **서사 연결**: 작품 속에서 하늘이가 할머니의 화구 상자 '뚝딱' 위에 낙서를 그리면 그림이 세계로 변한다. 이 과정이 기술적으로는 아이의 낙서를 스캔하여 ControlNet scribble에 입력하고, DreamShaperXL + LoRA로 화풍 세계를 생성하는 파이프라인과 정확히 대응된다. 즉, "화구 상자에 낙서 → 세계가 열린다"는 서사가 곧 "scribble 입력 → AI 이미지 생성"이라는 기술 플로우다.

### 예시 A: 크레파스 숲 (EP01)

**Before (입력):**
- 하늘이가 화구 상자 '뚝딱' 위에 초록색/갈색 크레파스로 대충 그린 나무 3그루 + 주황색 하늘
- 종이에 직접 그린 낙서를 스캔 (300dpi)

**AI 처리:**
1. 스캔 이미지 → ControlNet scribble 입력 (구도 가이드)
2. 프롬프트: `a magical forest with thick crayon texture trees, waxy surface on bark, smudged orange sky, a small girl standing at the entrance looking up in wonder, children's book illustration style`
3. LoRA: 없음 (기본 DreamShaperXL)
4. KSampler: steps 6, cfg 2, dpmpp_sde/karras

**After (결과물):**
- 크레파스 질감이 살아있는 거대한 숲 — 나무 표면에 크레파스 결 텍스처
- 주황색 하늘에 번진 크레파스 색감
- 낙서의 구도(나무 3그루 배치)가 그대로 유지된 채 디테일 추가

**증빙 포인트:** 아이의 낙서 구도가 AI 결과물에 정확히 반영됨을 좌우 배치로 시연

### 예시 B: 수채화 비의 정원 (EP02)

**Before (입력):**
- 비 오는 날, 하늘이가 수채화 물감으로 그린 정원 — 꽃 3송이 + 빗줄기 + 웅덩이
- 물감이 아래로 흘러내린 번짐 흔적 그대로 스캔

**AI 처리:**
1. 스캔 이미지 → ControlNet scribble 입력
2. 프롬프트: `ral-wtrclr, a magical garden in the rain painted in watercolor, flowers blooming through bleeding watercolor puddles, raindrops mixing colors on petals, soft pastel tones, visible wet brushstrokes, children's watercolor illustration come to life`
3. LoRA: ral-wtrclr-sdxl (weight 0.8)
4. KSampler: steps 6, cfg 2, dpmpp_sde/karras

**After (결과물):**
- 수채화 번짐 효과가 극대화된 비 내리는 정원 — 물감이 흘러내리듯 색이 섞이는 꽃밭
- 빗방울이 물감 방울처럼 떨어지며 웅덩이에 무지개색 파문
- 원본 낙서의 물감 번짐이 세계의 "비" 질감으로 변환 — 흘러내린 물감 자국이 빗줄기가 됨

**증빙 포인트:** LoRA가 낙서의 수채화 번짐을 "비 오는 정원"이라는 세계관 질감으로 승화시킴을 시연

### 예시 C: 반짝이 사막의 별 (EP05)

**Before (입력):**
- 아이가 반짝이 풀과 색연필로 그린 사막 + 별
- 반짝이 질감이 포함된 스캔

**AI 처리:**
1. 스캔 이미지 → ControlNet scribble 입력
2. 프롬프트: `ral-crztlgls, a vast desert made of crystal glass, sparkling sand dunes under a starlit sky, iridescent light refracting through transparent crystal formations, magical and ethereal atmosphere`
3. LoRA: ral-crztlgls-sdxl (weight 0.8)
4. KSampler: steps 6, cfg 2, dpmpp_sde/karras

**After (결과물):**
- 크리스탈/유리 질감의 사막 — 투명하게 빛나는 모래 언덕
- 프리즘 효과로 무지개빛 굴절
- 아이가 그린 별이 크리스탈 형태로 변환

**증빙 포인트:** 동일 scribble 입력이 LoRA에 따라 완전히 다른 세계로 변환됨을 시연 (A vs C 비교)

## 5. 증빙 스크린샷 촬영 계획

| 번호 | 스크린샷 내용 | 단계 | 용도 |
|------|-------------|------|------|
| 1 | ComfyUI 이미지 생성 워크플로우 전체 (scribble + DreamShaperXL + LoRA) | 프리 | 파이프라인 구조 증빙 |
| 2 | 낙서 입력 → 결과물 Before/After 나란히 배치 | 프리 | 핵심 AI 활용 증빙 |
| 3 | LoRA 전환에 따른 동일 입력 → 다른 화풍 결과 비교 | 프리 | 기술 차별점 증빙 |
| 4 | IP-Adapter 캐릭터 일관성 (다른 화풍에서 동일 캐릭터) | 프리 | 캐릭터 기술 증빙 |
| 5 | Wan I2V 영상 생성 워크플로우 (GGUF 로더 + 샘플러) | 메인 | 영상 생성 파이프라인 증빙 |
| 6 | 스틸 이미지 → 영상 클립 프레임 스냅샷 비교 | 메인 | 모션 생성 증빙 |
| 7 | Kling 카메라 제어 노드 설정 | 메인 | 보조 기술 증빙 |
| 8 | DaVinci Resolve 타임라인 편집 화면 | 포스트 | 편집 과정 증빙 |
