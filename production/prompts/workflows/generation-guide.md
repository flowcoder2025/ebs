# Phase 2 생성 가이드 — ComfyUI 워크플로우 사용법

> 본 문서는 Phase 2 (WI-004~007) 캐릭터 레퍼런스 및 컨셉아트 생성을 위한 실행 가이드입니다.

---

## 사전 준비

### 필수 모델 파일

| 파일명 | 위치 | 용도 |
|--------|------|------|
| `dreamshaperXL_v21TurboDPMSDE.safetensors` | `models/checkpoints/` | 기본 SDXL 체크포인트 |
| `sdxl_vae.safetensors` | `models/vae/` | SDXL VAE |
| `watercolor_style_sdxl.safetensors` | `models/loras/` | 현실세계 수채화풍 LoRA |
| `prismatic_surreal_sdxl.safetensors` | `models/loras/` | 미시세계 초현실 LoRA |
| `ip-adapter-plus_sdxl_vit-h.safetensors` | `models/ipadapter/` | IP-Adapter (캐릭터 일관성) |
| `CLIP-ViT-H-14-laion2B-s32B-b79K.safetensors` | `models/clip_vision/` | CLIP Vision (IP-Adapter용) |

### 대체 체크포인트
- `juggernautXL_v9.safetensors` — dreamshaperXL이 없을 경우 사용 가능

### LoRA 준비 안내
- `watercolor_style_sdxl`과 `prismatic_surreal_sdxl`은 Civitai 등에서 유사 LoRA를 다운로드하여 사용
- 정확한 파일명이 다를 경우 워크플로우 JSON의 `lora_name` 값을 수정

---

## 생성 순서 (권장)

### Step 1: 초은이 정면 기준 이미지 (최우선)

**워크플로우**: `comfyui-choeun-5ref.json`
**타겟**: Ref01 (정면 전신 현실세계)

1. ComfyUI에서 `comfyui-choeun-5ref.json` 로드
2. Ref01 노드만 연결 (노드 10~15)
3. seed 100001로 첫 생성 실행
4. 결과가 불만족스러우면 seed를 변경하며 3~5회 반복
5. **가장 만족스러운 정면 이미지를 `choeun-ref01-best.png`로 저장** (IP-Adapter 기준)

### Step 2: 초은이 나머지 4종 (IP-Adapter 적용)

**워크플로우**: `comfyui-ip-adapter-consistency.json`

1. Step 1에서 선정한 `choeun-ref01-best.png`를 `reference_image.png`로 설정
2. 각 프롬프트별 설정:

| Ref | 프롬프트 출처 | IP-Adapter Weight | 해상도 |
|-----|-------------|-------------------|--------|
| Ref02 측면 | `choeun-prompts.md` Prompt 02 | 0.7 | 896x1152 |
| Ref03 후면 | `choeun-prompts.md` Prompt 03 | 0.7 | 896x1152 |
| Ref04 표정(호기심) | `choeun-prompts.md` Prompt 04 | 0.6 | 1024x1024 |
| Ref05 미시세계 정면 | `choeun-prompts.md` Prompt 07 | 0.5 | 896x1152 |

> Ref05(미시세계)는 LoRA를 `prismatic_surreal_sdxl`로 교체, IP-Adapter weight를 0.5로 낮추어 스타일 전환 허용

### Step 3: 할아버지 3종

**워크플로우**: `comfyui-grandpa-3ref.json` → IP-Adapter

1. `comfyui-grandpa-3ref.json`에서 Ref01(정면) 먼저 생성
2. 기준 이미지 선정 후 IP-Adapter로 Ref02, Ref03 생성

| Ref | 프롬프트 출처 | IP-Adapter Weight | 해상도 |
|-----|-------------|-------------------|--------|
| Ref01 정면 | 워크플로우 직접 사용 | - | 896x1152 |
| Ref02 측면 | IP-Adapter + `grandpa-prompts.md` Prompt 02 | 0.7 | 896x1152 |
| Ref03 표정(미소) | IP-Adapter + `grandpa-prompts.md` Prompt 03 | 0.6 | 1024x1024 |

### Step 4: 뭉이 5종

**워크플로우**: `comfyui-mungyi-5ref.json` → IP-Adapter

1. `comfyui-mungyi-5ref.json`에서 Ref01(정면) 먼저 생성
2. 기준 이미지 선정 후 IP-Adapter로 나머지 생성

| Ref | 프롬프트 출처 | IP-Adapter Weight | 해상도 |
|-----|-------------|-------------------|--------|
| Ref01 정면 | 워크플로우 직접 사용 | - | 896x1152 |
| Ref02 측면 | IP-Adapter + `mungyi-prompts.md` Prompt 02 | 0.6 | 896x1152 |
| Ref03 탑다운 | IP-Adapter + `mungyi-prompts.md` Prompt 03 | 0.5 | 1024x1024 |
| Ref04 걷기 | IP-Adapter + `mungyi-prompts.md` Prompt 04 | 0.6 | 1152x896 |
| Ref05 턴어라운드 | 워크플로우 직접 사용 (batch) | - | 1536x640 |

> 뭉이는 투명체이므로 IP-Adapter weight를 0.5~0.6으로 낮게 유지

### Step 5: EP01 컨셉아트 2종

**워크플로우**: `comfyui-conceptart-ep01.json`

1. Concept01(정원)과 Concept02(프리즘 세계) 각각 생성
2. 캐릭터 포함 컨셉아트이므로, 만족스러운 캐릭터 레퍼런스 확보 후 실행 권장
3. 16:9 비율 (1920x1080) — 영상 프레임 기준

---

## IP-Adapter Weight 가이드

| 상황 | Weight | 이유 |
|------|--------|------|
| 같은 스타일, 다른 앵글 | 0.7~0.8 | 강한 일관성 유지 |
| 표정 변화 | 0.5~0.6 | 표정 자유도 확보 |
| 스타일 전환 (현실→미시) | 0.4~0.5 | 스타일 변화 허용 |
| 반사/왜곡 (물방울 표면) | 0.3~0.4 | 변형 자유도 극대화 |

---

## 생성 후 정리

### 결과물 저장 위치

```
production/characters/choeun/
  ref01-front-watercolor.png       (정면 전신 현실)
  ref02-side-watercolor.png        (측면 전신 현실)
  ref03-back-watercolor.png        (후면 전신 현실)
  ref04-expression-curiosity.png   (표정 호기심)
  ref05-front-surreal.png          (정면 미시세계)

production/characters/grandpa/
  ref01-front-watercolor.png       (정면 전신 현실)
  ref02-side-watercolor.png        (측면 전신 현실)
  ref03-expression-smile.png       (표정 미소)

production/characters/mungyi/
  ref01-front-surreal.png          (정면 전신 미시)
  ref02-side-surreal.png           (측면 전신 미시)
  ref03-topdown-surreal.png        (탑다운 뷰 미시)
  ref04-walking-surreal.png        (뒤뚱걷기)
  ref05-turnaround-surreal.png     (턴어라운드 시트)

production/episodes/ep01/concept-art/
  concept01-garden-watercolor.png  (정원 전경)
  concept02-prism-world-surreal.png (프리즘 세계 내부)
```

### LoRA 학습 데이터 준비

레퍼런스 이미지 확정 후:

| 캐릭터 | trigger word | 학습 장수 | LoRA weight |
|--------|-------------|----------|-------------|
| 초은이 | `choeun_girl` | 20~30장 | 0.7~0.9 |
| 할아버지 | `grandpa_scientist` | 15~20장 | 0.7~0.9 |
| 뭉이 | `mungyi_tardigrade` | 15~20장 | 0.6~0.8 |

---

## 트러블슈팅

### 투명체(뭉이) 생성 문제
- CFG를 6.0~6.5로 낮추면 투명도 향상
- Steps를 40~45로 올리면 내부 디테일 개선
- 불투명하게 나오면 네거티브에 `opaque solid body` 강조

### 다리 개수 오류 (뭉이)
- "8 legs" 대신 "4 pairs of stubby legs arranged symmetrically" 사용
- ControlNet Scribble로 다리 위치 수동 가이드 가능
- 6개나 10개로 나오면 seed 변경 후 재생성

### 캐릭터 일관성 부족
- IP-Adapter weight를 0.8까지 올려 시도
- 그래도 부족하면 ControlNet OpenPose를 함께 사용
- 최종 수단: Inpaint로 불일치 부분 수정
