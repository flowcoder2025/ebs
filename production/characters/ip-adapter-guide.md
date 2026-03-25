# 마이크로 보이저 — IP-Adapter 캐릭터 일관성 가이드

> 본 문서는 `comfyui-ip-adapter-consistency.json` 워크플로우의 실제 사용 시나리오별 상세 가이드이다.
> generation-guide.md의 IP-Adapter Weight 가이드(기본)를 보강하며, 캐릭터별/상황별 구체적 파라미터를 정의한다.

---

## 1. 워크플로우 구조 개요

`comfyui-ip-adapter-consistency.json`의 노드 흐름:

```
CheckpointLoader (노드 1)
  └→ LoraLoader (노드 3) — watercolor 또는 prismatic 교체
       └→ IPAdapterApply (노드 8) — weight, noise, weight_type 조절
            └→ KSampler (노드 13) — steps, cfg, sampler 조절
                 └→ VAEDecode → SaveImage

LoadImage (노드 5) — 레퍼런스 이미지 (ref01 정면)
IPAdapterModelLoader (노드 6) — ip-adapter-plus_sdxl_vit-h
CLIPVisionLoader (노드 7) — CLIP-ViT-H-14-laion2B-s32B-b79K
```

### IP-Adapter 모델 선택 근거

본 워크플로우는 `ip-adapter-plus_sdxl_vit-h` (범용)를 사용한다. `ip-adapter-plus-face_sdxl_vit-h` (얼굴 특화)를 선택하지 않은 이유:

| 기준 | ip-adapter-plus (범용) | ip-adapter-plus-face (얼굴 특화) |
|------|----------------------|-------------------------------|
| 전신 일관성 | 의상, 소품, 체형 전체 반영 | 얼굴 중심, 의상/소품 반영 약함 |
| 비인간 캐릭터 | 뭉이(타디그레이드) 호환 | 얼굴 구조 전제이므로 뭉이에 부적합 |
| 앵글 변환 | 후면/탑다운 등 얼굴 없는 앵글 지원 | 얼굴이 보이지 않는 앵글에서 효과 급감 |
| 스타일 전환 | 현실→미시 전환 시 전체적 일관성 유지 | 얼굴만 유지되고 스타일 전환이 어색 |

결론: 3명의 캐릭터(인간 2명 + 비인간 1명) 모두에 범용으로 적용해야 하고, 전신/후면/탑다운 등 다양한 앵글이 필요하므로 `ip-adapter-plus` 선택이 적합하다. 얼굴 일관성이 부족할 경우 weight를 올리거나 ControlNet OpenPose를 보조로 사용한다.

### 수정 가능 파라미터 위치

| 수정 대상 | 노드 ID | 필드 | 기본값 |
|-----------|---------|------|--------|
| LoRA 종류 | 3 | `lora_name` | ral-wtrclr-sdxl.safetensors |
| LoRA 강도 | 3 | `strength_model`, `strength_clip` | 0.75 |
| 레퍼런스 이미지 | 5 | `image` | reference_image.png |
| IP-Adapter Weight | 8 | `weight` | 0.7 |
| IP-Adapter Noise | 8 | `noise` | 0.0 |
| Weight Type | 8 | `weight_type` | linear |
| 시작/종료 | 8 | `start_at`, `end_at` | 0.0, 1.0 |
| Positive 프롬프트 | 10 | `text` | (교체 필요) |
| Negative 프롬프트 | 11 | `text` | (교체 필요) |
| 해상도 | 12 | `width`, `height` | 896, 1152 |
| Seed | 13 | `seed` | 0 |
| Steps | 13 | `steps` | 35 |
| CFG | 13 | `cfg` | 7.0 |
| Sampler | 13 | `sampler_name` | dpmpp_2m |

---

## 2. 캐릭터별 Weight 매트릭스

### 2.1 초은이 (`choeun_girl`)

기준 이미지: `choeun/ref01-front-watercolor.png` (정면 전신 현실세계)

| 생성 대상 | Weight | Noise | LoRA | Steps | CFG | 해상도 | 비고 |
|-----------|--------|-------|------|-------|-----|--------|------|
| Ref02 측면 (현실) | 0.7 | 0.0 | watercolor 0.75 | 35 | 7.0 | 896x1152 | 같은 스타일, 다른 앵글 |
| Ref03 후면 (현실) | 0.7 | 0.0 | watercolor 0.75 | 35 | 7.0 | 896x1152 | 얼굴 안 보이므로 의상 일관성 중점 |
| Ref04 표정-호기심 | 0.6 | 0.0 | watercolor 0.75 | 35 | 7.0 | 1024x1024 | 표정 자유도 확보 |
| Ref05 정면 (미시) | 0.5 | 0.05 | prismatic 0.75 | 40 | 6.5 | 896x1152 | 스타일 전환 허용 |
| 추가: 3/4 뷰 | 0.7 | 0.0 | watercolor 0.75 | 35 | 7.0 | 896x1152 | LoRA 학습 데이터용 |
| 추가: 놀람 표정 | 0.55 | 0.0 | watercolor 0.75 | 35 | 7.0 | 1024x1024 | 극적 표정 변화 허용 |
| 추가: 기쁨 표정 | 0.55 | 0.0 | watercolor 0.75 | 35 | 7.0 | 1024x1024 | 극적 표정 변화 허용 |
| 추가: 서핑 액션 (미시) | 0.45 | 0.05 | prismatic 0.75 | 40 | 7.0 | 1152x896 | 동적 포즈 자유도 필요 |
| 투샷 (초은이+뭉이) | 0.5 | 0.05 | prismatic 0.75 | 40 | 6.5 | 1152x896 | 두 캐릭터 공존, 과도한 일관성은 뭉이 표현 방해 |

### 2.2 할아버지 (`grandpa_scientist`)

기준 이미지: `grandpa/ref01-front-watercolor.png` (정면 전신 현실세계)

| 생성 대상 | Weight | Noise | LoRA | Steps | CFG | 해상도 | 비고 |
|-----------|--------|-------|------|-------|-----|--------|------|
| Ref02 측면 (현실) | 0.7 | 0.0 | watercolor 0.75 | 35 | 7.0 | 896x1152 | 같은 스타일, 다른 앵글 |
| Ref03 표정-미소 | 0.6 | 0.0 | watercolor 0.75 | 35 | 7.0 | 1024x1024 | 표정 자유도 확보 |
| 추가: 놀람 표정 | 0.55 | 0.0 | watercolor 0.75 | 35 | 7.0 | 1024x1024 | 안경 유지가 핵심 |
| 추가: 다락방 장면 | 0.65 | 0.0 | watercolor 0.75 | 35 | 7.0 | 1152x896 | 환경 변화이므로 약간 낮춤 |
| 물방울 표면 반사상 | 0.4 | 0.1 | prismatic 0.75 | 40 | 6.5 | 1024x1024 | 왜곡된 반사 — 낮은 weight + noise 추가 |

### 2.3 뭉이 (`mungyi_tardigrade`)

기준 이미지: `mungyi/ref01-front-surreal.png` (정면 전신 미시세계)

| 생성 대상 | Weight | Noise | LoRA | Steps | CFG | 해상도 | 비고 |
|-----------|--------|-------|------|-------|-----|--------|------|
| Ref02 측면 | 0.6 | 0.0 | prismatic 0.75 | 40 | 6.0 | 896x1152 | 투명체라서 weight 낮게 |
| Ref03 탑다운 | 0.5 | 0.0 | prismatic 0.75 | 40 | 6.0 | 1024x1024 | 극단적 앵글 — 자유도 필요 |
| Ref04 걷기 | 0.6 | 0.0 | prismatic 0.75 | 40 | 6.5 | 1152x896 | 동작 포즈 |
| Ref05 턴어라운드 | — | — | prismatic 0.75 | 45 | 6.0 | 1536x640 | IP-Adapter 미사용 (배치 4뷰) |
| 추가: 서핑 동작 | 0.5 | 0.05 | prismatic 0.75 | 40 | 6.5 | 1152x896 | 물 표면 위 동적 포즈 |
| 추가: 인사 동작 | 0.6 | 0.0 | prismatic 0.75 | 40 | 6.0 | 896x1152 | 앞다리 흔들기 |

> 뭉이는 전체적으로 weight를 0.5~0.6으로 유지. 투명체 특성상 IP-Adapter가 과하면 불투명해지는 경향이 있다.

---

## 3. 스타일 전환 시나리오 (현실 -> 미시)

캐릭터가 현실 세계에서 미시 세계로 전환될 때, 동일 IP-Adapter 기준 이미지를 사용하면서 비주얼 톤을 변경해야 한다.

### 3.1 전환에 필요한 수정 사항

| 항목 | 현실 세계 | 미시 세계 | 수정 노드 |
|------|----------|----------|----------|
| LoRA | ral-wtrclr-sdxl | ral-crztlgls-sdxl | 노드 3 `lora_name` |
| IP-Adapter Weight | 0.6~0.7 | 0.4~0.5 | 노드 8 `weight` |
| IP-Adapter Noise | 0.0 | 0.05 | 노드 8 `noise` |
| CFG | 7.0 | 6.5 | 노드 13 `cfg` |
| Steps | 35 | 40 | 노드 13 `steps` |
| Sampler | dpmpp_2m/karras | dpmpp_sde/karras | 노드 13 `sampler_name` |
| 프롬프트 키워드 추가 | — | `prismatic rainbow light, surreal microscopic world, volumetric prismatic lighting` | 노드 10 `text` |
| 네거티브 추가 | — | `watercolor style, paper texture` | 노드 11 `text` |

### 3.2 전환 시 주의점

1. **기준 이미지는 교체하지 않는다**: 현실 세계 정면(ref01)을 계속 사용. 미시 세계용 별도 기준 이미지를 만들면 캐릭터 동일성이 깨진다.
2. **IP-Adapter Weight를 낮추는 이유**: 미시 세계에서는 환경 프리즘 효과가 캐릭터 표면에 반영되어야 하므로, IP-Adapter가 원본 스타일을 너무 강하게 강제하면 프리즘 효과가 묻힌다.
3. **Noise 추가 이유**: 미세한 noise(0.05)는 투명 환경의 빛 반사가 자연스럽게 캐릭터에 영향을 주는 효과를 준다. 0.1 이상은 캐릭터 구조가 흐트러질 수 있으므로 주의.

### 3.3 단계적 전환 예시 (초은이)

현실에서 미시로 점진적으로 전환하는 중간 이미지가 필요할 경우:

| 전환 단계 | Weight | LoRA | 프롬프트 변형 |
|-----------|--------|------|-------------|
| 100% 현실 | 0.7 | watercolor 0.75 | 수채화 키워드 |
| 전환 시작 (빛 입자 분해) | 0.65 | watercolor 0.5 + prismatic 0.3 | `light particles dissolving, warm to cool transition` |
| 전환 중간 | 0.6 | watercolor 0.3 + prismatic 0.5 | `half watercolor half prismatic, transition between worlds` |
| 전환 완료 (미시) | 0.5 | prismatic 0.75 | 프리즘 키워드 전체 |

> 이중 LoRA 적용 시 ComfyUI에서 LoraLoader 노드를 2개 직렬로 연결. strength 합계가 1.0~1.1 사이 유지.

---

## 4. weight_type 옵션 활용

IP-Adapter의 `weight_type` 파라미터로 일관성 적용 방식을 조절할 수 있다.

| weight_type | 효과 | 사용 시나리오 |
|-------------|------|-------------|
| `linear` (기본) | 전체 생성 과정에 균일하게 적용 | 일반적인 앵글 변환, 대부분의 경우 |
| `ease in` | 초반에 약하게, 후반에 강하게 | 배경은 자유롭게, 캐릭터 디테일은 강하게 할 때 |
| `ease out` | 초반에 강하게, 후반에 약하게 | 전체 구도/포즈는 유지하되 디테일은 자유롭게 |
| `weak input` | 입력 이미지의 영향을 전체적으로 약화 | 뭉이 투명체처럼 원본에서 크게 벗어나야 할 때 |
| `style transfer` | 스타일만 전이, 구조는 프롬프트 따름 | 스타일 전환(현실→미시)에 유용 |

### 캐릭터별 권장 weight_type

| 캐릭터 | 같은 스타일 내 | 스타일 전환 시 |
|--------|--------------|---------------|
| 초은이 | `linear` | `style transfer` |
| 할아버지 | `linear` | `ease out` (반사상은 구조 변형 필요) |
| 뭉이 | `weak input` | `weak input` (항상 약하게) |

---

## 5. start_at / end_at 파라미터 활용

IP-Adapter의 영향을 생성 과정의 특정 구간에만 적용할 수 있다.

| 파라미터 | 의미 | 기본값 |
|----------|------|--------|
| `start_at` | IP-Adapter 적용 시작 시점 (0.0 = 처음부터) | 0.0 |
| `end_at` | IP-Adapter 적용 종료 시점 (1.0 = 끝까지) | 1.0 |

### 활용 시나리오

| 시나리오 | start_at | end_at | 효과 |
|----------|----------|--------|------|
| 기본 (전체 적용) | 0.0 | 1.0 | 처음부터 끝까지 일관성 유지 |
| 구도만 참조 | 0.0 | 0.4 | 초반에 구도/포즈를 잡고, 후반은 자유 생성 |
| 디테일만 참조 | 0.3 | 1.0 | 구도는 프롬프트 기반, 디테일에서 캐릭터 일관성 적용 |
| 미시 세계 전환 | 0.0 | 0.6 | 캐릭터 형태만 잡고 프리즘 환경은 자유 생성 |

### 캐릭터별 권장

| 상황 | 초은이 | 할아버지 | 뭉이 |
|------|--------|---------|------|
| 같은 스타일 앵글 변환 | 0.0~1.0 | 0.0~1.0 | 0.0~0.8 |
| 표정 변환 | 0.0~0.7 | 0.0~0.7 | 0.0~0.6 |
| 스타일 전환 | 0.0~0.6 | 0.0~0.5 | 0.0~0.5 |
| 액션 포즈 | 0.0~0.5 | — | 0.0~0.5 |

> 뭉이는 end_at를 일찍 끊어 투명체 디테일이 자유롭게 생성되도록 한다.

---

## 6. 배치 생성 팁

### 6.1 시드 배치

같은 설정에서 여러 시드로 생성하여 최적 결과를 선별하는 방법.

```json
// 노드 12의 batch_size를 변경
"12": {
  "class_type": "EmptyLatentImage",
  "inputs": { "width": 896, "height": 1152, "batch_size": 4 }
}
```

- batch_size 4~8로 설정하면 한 번에 여러 이미지 생성
- VRAM 8GB: batch 2, 12GB: batch 4, 24GB: batch 8 권장
- 결과 중 가장 좋은 것을 선별하여 저장

### 6.2 시드 고정 + 파라미터 변형

특정 시드에서 IP-Adapter weight만 변형하며 최적값을 찾는 방법.

```
시드 고정: 12345
Weight 변형: 0.5 → 0.6 → 0.7 → 0.8
→ 가장 캐릭터 유사도가 높으면서 목표 포즈/표정이 잘 나온 weight 선택
```

### 6.3 캐릭터별 일괄 생성 순서

효율적인 배치 생성을 위한 권장 순서:

```
[Step 1] 초은이 ref01 (정면, IP-Adapter 미사용)
  → seed 100001~100010 중 최적 선별
  → 선택한 이미지를 choeun-ref01-best.png로 저장

[Step 2] 초은이 나머지 (ref02~05, IP-Adapter 적용)
  → reference_image = choeun-ref01-best.png
  → 각 ref에 대해 seed 200001~200004 배치 생성
  → 각 ref별 최적 선별

[Step 3] 할아버지 ref01 (정면, IP-Adapter 미사용)
  → seed 300001~300010 중 최적 선별

[Step 4] 할아버지 나머지 (ref02~03, IP-Adapter 적용)
  → reference_image = grandpa-ref01-best.png

[Step 5] 뭉이 ref01 (정면, IP-Adapter 미사용)
  → seed 400001~400010 중 최적 선별

[Step 6] 뭉이 나머지 (ref02~04, IP-Adapter 적용)
  → reference_image = mungyi-ref01-best.png

[Step 7] 뭉이 ref05 턴어라운드 (IP-Adapter 미사용, 배치 4뷰)
  → 개별 워크플로우(comfyui-mungyi-5ref.json) 사용
```

### 6.4 LoRA 교체 시 워크플로우 변경 체크리스트

LoRA를 watercolor에서 prismatic으로 교체할 때 반드시 함께 변경해야 하는 항목:

- [ ] 노드 3: `lora_name` → `ral-crztlgls-sdxl.safetensors`
- [ ] 노드 8: `weight` → 0.5 이하로 낮춤
- [ ] 노드 8: `noise` → 0.05 추가
- [ ] 노드 13: `steps` → 40
- [ ] 노드 13: `cfg` → 6.5
- [ ] 노드 13: `sampler_name` → `dpmpp_sde`
- [ ] 노드 10: positive에 프리즘 키워드 추가
- [ ] 노드 11: negative에 `watercolor style, paper texture` 추가

---

## 7. 트러블슈팅

### 캐릭터가 기준 이미지와 너무 다르게 생성될 때

| 시도 순서 | 조치 | 효과 |
|-----------|------|------|
| 1 | weight를 0.1 올림 (최대 0.85) | 일관성 강화 |
| 2 | end_at을 1.0으로 설정 | 전 과정에서 참조 |
| 3 | weight_type을 `linear`로 변경 | 균일한 영향 |
| 4 | noise를 0.0으로 설정 | 변형 최소화 |
| 5 | ControlNet OpenPose 추가 | 포즈 고정 + IP-Adapter 얼굴/의상 일관성 |

### 캐릭터가 기준 이미지를 그대로 복사할 때

| 시도 순서 | 조치 | 효과 |
|-----------|------|------|
| 1 | weight를 0.1 낮춤 (최소 0.3) | 자유도 증가 |
| 2 | end_at을 0.7로 설정 | 후반 자유 생성 |
| 3 | noise를 0.05~0.1로 올림 | 변형 유도 |
| 4 | 프롬프트를 더 구체적으로 작성 | 텍스트 가이드 강화 |

### 뭉이 투명도가 사라질 때

| 시도 순서 | 조치 |
|-----------|------|
| 1 | weight를 0.5 이하로 낮춤 |
| 2 | weight_type을 `weak input`으로 변경 |
| 3 | CFG를 6.0으로 낮춤 |
| 4 | 네거티브에 `opaque solid body, non-transparent` 추가 |
| 5 | end_at을 0.6으로 설정하여 후반 투명 디테일을 자유 생성 |

### 스타일 전환 시 캐릭터가 어색할 때

| 시도 순서 | 조치 |
|-----------|------|
| 1 | weight_type을 `style transfer`로 변경 |
| 2 | weight를 0.45로 낮춤 |
| 3 | 이중 LoRA 적용: watercolor 0.3 + prismatic 0.5 (중간 전환) |
| 4 | start_at을 0.1로 설정 (극초반 자유 생성으로 환경 분위기 형성) |

---

## 8. 참조 문서

| 문서 | 용도 |
|------|------|
| `production/prompts/workflows/comfyui-ip-adapter-consistency.json` | IP-Adapter 워크플로우 원본 |
| `production/prompts/workflows/generation-guide.md` | 전체 생성 순서 + 기본 weight 가이드 |
| `production/characters/style-guide.md` | 현실/미시 스타일 정의 |
| `production/characters/color-palette.md` | 색상 팔레트 |
| `production/characters/lora-training-spec.md` | LoRA 학습 데이터 사양 |
| `production/prompts/characters/*.md` | 캐릭터별 프롬프트 원본 |
