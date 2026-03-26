# 제작 파이프라인 상태

> AI 애니메이션 제작 도구별 진행 상태 및 워크플로우 참조.
> **2026-03-26 전면 재기획**: animagine 폐기, DreamShaperXL + Wan I2V 확정.

## 확정 파이프라인 (v3 — 2026-03-26)

```
[1] 프롬프트 작성 ──→ [2] ComfyUI 이미지 생성 ──→ [3] Wan I2V 영상 생성
        |                      |                           |
   (자연어 프롬프트)   (DreamShaperXL Turbo)       (Wan 2.1 I2V GGUF)
        |              + LoRA (수채화/프리즘)        480x704, 33프레임
      재작업 중              재작업 중                  검증됨
                                                           |
                               ┌───────────────────────────┘
                               v
                    [4] 보조 영상 생성 ──→ [5] 합성/편집 ──→ [6] 최종 출력
                      (Kling API 보조)    (AE/DaVinci)    (MP4 16fps h264)
                      카메라/고품질 시        미착수           미착수
```

### 핵심 변경 사항 (v2 → v3)
- **animagineXL31 폐기** — 일본 애니 화풍은 EBS 공모에 부적합
- **DreamShaperXL_Turbo_v2_1 주력** — 수채화 일러스트레이션 스타일
- **LoRA 활성화**: ral-wtrclr-sdxl (수채화, trigger: ral-wtrclr), ral-crztlgls-sdxl (프리즘, trigger: ral-crztlgls)
- **Wan 2.1 I2V GGUF 로컬** — AnimateDiff 대신 채택 (이미 설치됨, 12GB VRAM 검증)
- **Danbooru 태그 폐기** → 자연어 프롬프트 전환
- **"특정 작품/브랜드 프롬프트 금지"** — 공모 요건 준수

## 실제 ComfyUI 환경 (2026-03-26 확인)

- **ComfyUI**: v0.18.2, 포트 8000 (`http://127.0.0.1:8000`)
- **GPU**: NVIDIA RTX 4070 (VRAM 12GB)
- **노드 수**: 1,226개 (WanVideo 117개 포함)
- **MCP**: comfyui-mcp@0.3.2 전역 설치됨 (포트 8000)

### 사용 모델 (확정)

| 유형 | 파일명 | 크기 | 역할 |
|------|--------|------|------|
| **체크포인트 (주력)** | `DreamShaperXL_Turbo_v2_1.safetensors` | 6.5GB | 이미지 생성 (수채화 일러스트) |
| VAE | `sdxl_vae.safetensors` (fp16-fix) | 320MB | SDXL VAE |
| **LoRA (수채화)** | `ral-wtrclr-sdxl.safetensors` | 218MB | 현실세계 씬 (trigger: ral-wtrclr) |
| **LoRA (프리즘)** | `ral-crztlgls-sdxl.safetensors` | 218MB | 미시세계 씬 (trigger: ral-crztlgls) |
| IP-Adapter | `ip-adapter-plus_sdxl_vit-h.safetensors` | — | 캐릭터 일관성 |
| CLIP Vision | `CLIP-ViT-H-14-laion2B-s32B-b79K.safetensors` | — | IP-Adapter 입력 |
| **Wan I2V (GGUF)** | `wan2.1-i2v-14b-480p-Q4_K_S.gguf` | 9.9GB | 로컬 영상 생성 (주력) |
| Wan VAE | `wan_2.1_vae.safetensors` | 242MB | Wan 영상 디코딩 |
| Wan T5 encoder | `umt5-xxl-encoder-Q5_K_M.gguf` | 3.9GB | Wan 텍스트 인코딩 |

### 폐기 모델 (사용 금지)

| 파일명 | 사유 |
|--------|------|
| `animagineXL31_v31.safetensors` | 일본 애니 화풍, EBS 부적합 |

### 스타일 제어 (자연어 프롬프트 + LoRA)

| 스타일 | LoRA | 프롬프트 키워드 | 용도 |
|--------|------|----------------|------|
| 현실세계 수채화 | ral-wtrclr-sdxl | `ral-wtrclr, watercolor illustration, warm colors, soft lighting` | 정원/현실 씬 |
| 미시세계 프리즘 | ral-crztlgls-sdxl | `ral-crztlgls, crystal glass, prismatic, iridescent, transparent` | 프리즘/미시 씬 |

## Wan I2V 워크플로우 (확정)

```
UnetLoaderGGUF (wan2.1-i2v-14b-480p-Q4_K_S.gguf)
  → WanImageToVideo (480x704, 33프레임)
    → KSampler (steps 20, cfg 5, uni_pc_bh2/simple)
      → VAEDecode → VHS_VideoCombine (16fps, h264)
```

- **해상도**: 480x704 (Wan GGUF 제약)
- **프레임**: 33프레임 (~2초 @16fps)
- **VRAM**: RTX 4070 12GB에서 실행 가능 (BlockSwap 불필요)
- **가속**: LightX2V 4step LoRA 적용 시 4배 속도 향상 가능

## 도구별 상태

### ComfyUI (SDXL) — 이미지 생성
- **용도**: 캐릭터 레퍼런스 + 배경 이미지 생성
- **상태**: DreamShaperXL 기반 재작업 필요 (기존 animagine 워크플로우 폐기)
- **기존 워크플로우**: `production/prompts/workflows/comfyui-*.json` — 모델명 교체 필요

### IP-Adapter + LoRA
- **용도**: 에피소드 간 캐릭터 동일성 유지
- **상태**: 가이드 작성 완료, DreamShaperXL 기반 재검증 필요
- **가이드**: `production/characters/ip-adapter-guide.md`, `production/characters/lora-training-spec.md`
- **IP-Adapter weight**: 현실 0.6~0.8, 미시 0.5
- **LoRA trigger**: choeun_girl, grandpa_scientist, mungyi_tardigrade

### Wan Video I2V (로컬) — 영상 생성 주력
- **용도**: 이미지 → 영상 변환 (캐릭터 모션 + 배경 움직임)
- **상태**: 모델 설치 완료, 워크플로우 검증됨 (2026-03-26)
- **모델**: `wan2.1-i2v-14b-480p-Q4_K_S.gguf` (GGUF, 12GB VRAM OK)
- **제약**: 480x704, 33프레임 고정

### Kling API (보조)
- **용도**: 카메라 제어, 고품질 필요 시 보조
- **상태**: ComfyUI 노드 설치됨, API 기반 (VRAM 무관)
- **노드**: KlingCameraControlI2VNode, KlingImage2VideoNode

### After Effects / DaVinci Resolve
- **용도**: 레이어 합성, 색보정, 최종 편집
- **상태**: 미착수

## 워크플로우 파일 위치
- 프롬프트: `production/prompts/`
- 캐릭터 레퍼런스: `production/characters/` (재생성 필요)
- 에피소드 에셋: `production/episodes/ep01/` (재생성 필요)
- ComfyUI 워크플로우 JSON: `production/prompts/workflows/` (DreamShaperXL 기반 재작업 필요)
- LoRA 사양서: `production/characters/lora-training-spec.md`
- IP-Adapter 가이드: `production/characters/ip-adapter-guide.md`
