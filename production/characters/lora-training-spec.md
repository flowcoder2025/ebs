# 마이크로 보이저 — 캐릭터 LoRA 학습 데이터 사양서

> 본 문서는 초은이/할아버지/뭉이 각 캐릭터 전용 LoRA 학습에 필요한 데이터셋 사양을 정의한다.
> ComfyUI 레퍼런스 이미지 생성(WI-004~006) 완료 후, LoRA 학습 준비 단계에서 참조한다.

---

## 1. 공통 학습 환경

### 1.1 기본 모델

| 항목 | 값 |
|------|-----|
| Base Model | SDXL 1.0 (DreamShaperXL_Turbo_v2_1 또는 juggernautXL_v9) |
| VAE | sdxl_vae.safetensors |
| 학습 프레임워크 | kohya_ss (sd-scripts) 권장 |
| 학습 해상도 | 1024x1024 (버킷 리사이즈 활성화) |

### 1.2 공통 학습 파라미터

| 파라미터 | 권장 값 | 비고 |
|----------|---------|------|
| Network Type | LoRA (LoCon도 가능) |  |
| Network Rank (dim) | 32 | 캐릭터 디테일 보존 |
| Network Alpha | 16 | rank의 절반 |
| Learning Rate | 1e-4 | unet lr |
| Text Encoder LR | 5e-5 | unet의 절반 |
| Optimizer | AdamW8bit |  |
| LR Scheduler | cosine_with_restarts |  |
| Epochs | 15~25 | 과적합 감시하며 조정 |
| Batch Size | 1~2 | VRAM 8GB 기준 1, 12GB+ 기준 2 |
| Mixed Precision | fp16 |  |
| Clip Skip | 2 | SDXL 표준 |
| Gradient Checkpointing | 활성화 | VRAM 절약 |
| Seed | 42 | 재현성 |

### 1.3 디렉토리 구조

```
lora-training/
  choeun/
    img/
      20_choeun_girl/          # 반복 횟수_트리거워드
        choeun_ref01.png
        choeun_ref01.txt       # 캡션 파일
        choeun_ref02.png
        choeun_ref02.txt
        ...
    model/                     # 학습 완료 LoRA 저장
    log/                       # TensorBoard 로그
  grandpa/
    img/
      20_grandpa_scientist/
        ...
    model/
    log/
  mungyi/
    img/
      25_mungyi_tardigrade/    # 투명체 특성상 반복 횟수 높임
        ...
    model/
    log/
```

> 반복 횟수(`20_`, `25_`)는 디렉토리 이름 접두사로 지정. kohya_ss가 자동 인식.

### 1.4 캡션 규칙

- 캡션 파일 형식: `.txt` (이미지와 동일 파일명)
- 인코딩: UTF-8 (BOM 없음)
- 첫 토큰: 반드시 trigger word로 시작
- 캡션 구조: `{trigger_word}, {자세/앵글}, {의상 디테일}, {표정}, {배경/환경}, {스타일 키워드}`
- **금지**: 캡션에 캐릭터 이름(초은이, 박초은 등 한글) 포함 금지 — trigger word만 사용
- **금지**: "masterpiece, best quality" 등 품질 태그 — 학습 데이터 캡션에는 불필요

### 1.5 이미지 품질 기준

| 항목 | 기준 |
|------|------|
| 최소 해상도 | 768x768 (SDXL 기준) |
| 권장 해상도 | 1024x1024 이상 |
| 포맷 | PNG (무손실) |
| 배경 | 단색 또는 심플 배경 권장 (캐릭터 학습 집중) |
| 캐릭터 비율 | 프레임 내 60% 이상 차지 |
| 잘림 | 전신 이미지는 손발 잘림 없어야 함 |
| 아티팩트 | SDXL 생성 아티팩트(손가락 기형 등)는 Inpaint로 보정 후 사용 |

---

## 2. 초은이 (박초은) LoRA 사양

### 2.1 기본 정보

| 항목 | 값 |
|------|-----|
| Trigger Word | `choeun_girl` |
| 목표 학습 장수 | 30~40장 |
| LoRA Weight (추론 시) | 0.7~0.8 (현실), 0.6~0.7 (미시 — 환경 반사 허용) |
| 정규화 이미지 | 수채화 스타일 다른 아동 캐릭터 20장 |
| 스타일 범위 | 현실 세계(수채화풍) + 미시 세계(초현실) |

### 2.2 필수 학습 이미지 구성

#### A. 앵글 다양성 (최소 8장)

| # | 앵글/자세 | 출처 프롬프트 | 비고 |
|---|----------|-------------|------|
| 1 | 정면 전신 | Prompt 01 | IP-Adapter 기준 이미지 |
| 2 | 측면 전신 (좌) | Prompt 02 | 프로필 뷰 |
| 3 | 후면 전신 | Prompt 03 | 조끼 뒷면 디테일 |
| 4 | 정면 전신 (미시세계) | Prompt 07 | 프리즘 환경 스타일 |
| 5 | 3/4 뷰 (좌) | Prompt 01 변형 | 앵글을 "three-quarter view"로 수정 |
| 6 | 3/4 뷰 (우) | Prompt 01 변형 | 반대 방향 |
| 7 | 측면 전신 (우) | Prompt 02 변형 | "from right side"로 수정 |
| 8 | 약간 위에서 본 뷰 | Prompt 01 변형 | "slight high angle view"로 수정 |

#### B. 표정 다양성 (최소 4장)

| # | 표정 | 출처 프롬프트 | 비고 |
|---|------|-------------|------|
| 9 | 호기심 | Prompt 04 | 돋보기 들고 있는 포즈 |
| 10 | 놀람 | Prompt 05 | 눈 크게 뜨고 입 벌림 |
| 11 | 기쁨 | Prompt 06 | 활짝 웃는 표정 |
| 12 | 중립/관찰 | Prompt 01 변형 | "neutral observing expression" |

#### C. 동작 다양성 (최소 4장)

| # | 동작 | 출처 프롬프트 | 비고 |
|---|------|-------------|------|
| 13 | 걷기 | Prompt 02 변형 | walking pose 강조 |
| 14 | 달리기 | Prompt 01 변형 | "running with excitement" |
| 15 | 앉기 | Prompt 01 변형 | "sitting cross-legged on ground" |
| 16 | 돋보기 들기 | Prompt 04 변형 | 전신 포함 |

#### D. 의상/소품 디테일 (최소 4장)

| # | 포커스 | 비고 |
|---|--------|------|
| 17 | 상반신 클로즈업 (조끼 + 돋보기) | 의상 디테일 학습 |
| 18 | 하반신 클로즈업 (반바지 + 짝짝이 양말 + 부츠) | 양말 패턴 학습 |
| 19 | 돋보기 소품 (Prompt 09) | 소품 단독 — 학습에 포함 여부 선택적 |
| 20 | 머리 클로즈업 (하늘색 구슬 땋은머리) | 식별 포인트 강화 |

### 2.3 캡션 예시

```
choeun_ref01.txt:
choeun_girl, front view, full body, standing pose, pastel mint field-explorer vest, cream long-sleeve shirt, khaki cargo shorts, mismatched socks one striped blue one dotted green, worn brown lace-up boots, brass magnifying glass on leather cord around neck, short bobbed black hair with sky-blue bead braid on right side, round face, large dark brown eyes, warm watercolor illustration style, sunlit garden background

choeun_ref05.txt:
choeun_girl, front view, full body, standing pose, pastel mint vest with iridescent light particles, cream shirt, khaki shorts, mismatched socks, brown boots, brass magnifying glass glowing faintly, short bobbed black hair with prismatic light reflections on sky-blue bead braid, inside water droplet, prismatic rainbow refractions, surreal microscopic world, volumetric prismatic lighting

choeun_expr_curiosity.txt:
choeun_girl, close-up portrait, head and shoulders, curious expression, eyes sparkling with wonder, eyebrows raised, mouth slightly open, holding brass magnifying glass near face, short bobbed black hair with sky-blue bead braid, round face with natural blush, warm watercolor illustration style
```

### 2.4 색상 앵커 (캡션에 포함 권장)

style-guide.md 및 color-palette.md 기준. 캡션에 색상 키워드를 넣어 색상 일관성을 학습시킨다.

| 부위 | 캡션 키워드 | HEX 참조 |
|------|-----------|----------|
| 조끼 | `pastel mint vest` | `#98FB98` |
| 셔츠 | `cream-colored shirt` | `#FFFEF2` |
| 반바지 | `khaki cargo shorts` | `#C3B091` |
| 양말 (줄무늬) | `striped blue sock` | `#4D96FF` |
| 양말 (점무늬) | `dotted green sock` | `#6BCB77` |
| 부츠 | `worn brown boots` | `#8B6914` |
| 머리 구슬 | `sky-blue bead` | `#87CEEB` |
| 돋보기 | `brass magnifying glass` | `#B8860B` |
| 피부 | `warm peach skin tone` | `#FFDAB9` |

---

## 3. 할아버지 (박 박사) LoRA 사양

### 3.1 기본 정보

| 항목 | 값 |
|------|-----|
| Trigger Word | `grandpa_scientist` |
| 목표 학습 장수 | 20~25장 |
| LoRA Weight (추론 시) | 0.7~0.8 (현실 전용) |
| 정규화 이미지 | 수채화 스타일 노인 캐릭터 15장 |
| 스타일 범위 | 현실 세계(수채화풍) 전용 |

### 3.2 필수 학습 이미지 구성

#### A. 앵글 다양성 (최소 6장)

| # | 앵글/자세 | 출처 프롬프트 | 비고 |
|---|----------|-------------|------|
| 1 | 정면 전신 | Prompt 01 | IP-Adapter 기준 이미지 |
| 2 | 측면 전신 | Prompt 02 | 프로필 뷰 |
| 3 | 3/4 뷰 (좌) | Prompt 01 변형 | "three-quarter view" |
| 4 | 3/4 뷰 (우) | Prompt 01 변형 | 반대 방향 |
| 5 | 후면 전신 | Prompt 01 변형 | "back view" |
| 6 | 상반신 | Prompt 03 변형 | "upper body, medium shot" |

#### B. 표정 다양성 (최소 3장)

| # | 표정 | 출처 프롬프트 | 비고 |
|---|------|-------------|------|
| 7 | 미소 | Prompt 03 | 따뜻한 눈 미소 |
| 8 | 놀람 | Prompt 04 | 안경 너머 걱정 표정 |
| 9 | 설명 중 | Prompt 05 변형 | "explaining with raised finger" |

#### C. 동작/상황 다양성 (최소 4장)

| # | 동작/상황 | 출처 프롬프트 | 비고 |
|---|----------|-------------|------|
| 10 | 다락방에서 작업 | Prompt 06 | 실험실 환경 |
| 11 | 걷기 | Prompt 01 변형 | "walking with hands behind back" |
| 12 | 앉아서 설명 | Prompt 01 변형 | "sitting in chair, explaining" |
| 13 | 돋보기 건네기 | Prompt 01 변형 | "handing over brass magnifying glass" |

#### D. 의상/소품 디테일 (최소 2장)

| # | 포커스 | 비고 |
|---|--------|------|
| 14 | 상반신 클로즈업 (체크 셔츠 + 카디건) | 의상 디테일 |
| 15 | 안경 + 얼굴 클로즈업 | 안경 프레임, 눈썹, 주름 학습 |

### 3.3 캡션 예시

```
grandpa_ref01.txt:
grandpa_scientist, front view, full body, standing pose, 68-year-old Korean man, silver-white fluffy hair thin on top, round wire-rimmed glasses, warm gentle smile, faded red-cream check flannel shirt, camel brown corduroy cardigan with dark brown leather elbow patches, dark brown wool trousers, brown leather slippers, warm watercolor illustration style, cozy study background

grandpa_expr_smile.txt:
grandpa_scientist, close-up portrait, head and shoulders, warm gentle smile with deep smile lines and crow's feet, kind eyes behind round wire-rimmed glasses, silver-white fluffy hair, bushy silver eyebrows, warm wheat-toned skin, warm watercolor illustration style
```

### 3.4 색상 앵커

| 부위 | 캡션 키워드 | HEX 참조 |
|------|-----------|----------|
| 머리카락 | `silver-white fluffy hair` | `#C0C0C0` |
| 안경테 | `round wire-rimmed glasses` | `#A9A9A9` |
| 셔츠 | `faded red-cream check flannel shirt` | `#D2C4B0` |
| 카디건 | `camel brown corduroy cardigan` | `#C19A6B` |
| 팔꿈치 패치 | `dark brown leather elbow patches` | `#654321` |
| 바지 | `dark brown wool trousers` | `#5C4033` |
| 피부 | `warm wheat-toned skin` | `#F5DEB3` |

---

## 4. 뭉이 (물곰/타디그레이드) LoRA 사양

### 4.1 기본 정보

| 항목 | 값 |
|------|-----|
| Trigger Word | `mungyi_tardigrade` |
| 목표 학습 장수 | 30~40장 |
| LoRA Weight (추론 시) | 0.8~0.9 (미시 전용 — style-guide 기준) |
| 정규화 이미지 | 초현실 스타일 귀여운 미생물 캐릭터 20장 |
| 스타일 범위 | 미시 세계(초현실) 전용 |

### 4.2 특수 고려사항 (투명체)

뭉이는 반투명 몸체를 가진 캐릭터이므로 LoRA 학습 시 다음을 주의한다.

| 항목 | 사양 | 이유 |
|------|------|------|
| 반복 횟수 | 25회 (다른 캐릭터보다 높음) | 투명체 표면 디테일을 충분히 학습 |
| LoRA Weight (추론) | 0.8~0.9 (style-guide 기준) | 투명체 형태를 정확히 재현하기 위해 높은 weight 필요. 투명도 손실 시 CFG를 6.0으로 낮추고 네거티브에 `opaque solid body` 추가로 대응 |
| 배경 다양성 | 다양한 프리즘 환경 | 투명체가 환경에 따라 색이 변하므로 다양한 배경 필요 |
| 네거티브 강조 | `opaque solid body` | 학습 시 불투명 결과 방지 |

### 4.3 필수 학습 이미지 구성

#### A. 앵글 다양성 (최소 6장)

| # | 앵글/자세 | 출처 프롬프트 | 비고 |
|---|----------|-------------|------|
| 1 | 정면 전신 | Prompt 01 | IP-Adapter 기준 이미지 |
| 2 | 측면 전신 | Prompt 02 | 프로필 뷰 |
| 3 | 탑다운 뷰 | Prompt 03 | 위에서 본 모습 |
| 4 | 3/4 뷰 | Prompt 01 변형 | "three-quarter view" |
| 5 | 후면 | Prompt 01 변형 | "back view" |
| 6 | 턴어라운드 4뷰 | Prompt 08 | 정면/측면/후면/3/4 동시 (1536x640) |

#### B. 동작 다양성 (최소 4장)

| # | 동작 | 출처 프롬프트 | 비고 |
|---|------|-------------|------|
| 7 | 뒤뚱걷기 | Prompt 04 | 특유의 보행 |
| 8 | 서핑 | Prompt 05 | 물 표면 위 탑승 |
| 9 | 인사 | Prompt 06 | 앞다리 흔들기 |
| 10 | 정지 (관찰) | Prompt 01 변형 | "sitting still, observing" |

#### C. 표정/감정 (최소 3장)

| # | 표정 | 비고 |
|---|------|------|
| 11 | 호기심 (눈 반짝) | 큰 눈에 하이라이트 강조 |
| 12 | 기쁨 (볼 홍조 강화) | 체리블로섬 볼 터치 강화 |
| 13 | 걱정 (눈 약간 처짐) | 눈매 살짝 아래로 |

#### D. 투명도/발광 변형 (최소 3장)

| # | 변형 | 비고 |
|---|------|------|
| 14 | 높은 투명도 (80%) | 내부 장기 잘 보이는 상태 |
| 15 | 기본 투명도 (60~70%) | 표준 상태 |
| 16 | 바이오 글로우 강화 | 민트 글로우 테두리 밝게 |

### 4.4 캡션 예시

```
mungyi_ref01.txt:
mungyi_tardigrade, front view, full body, cute cartoon tardigrade, round translucent ice-blue body at 60-70 percent opacity, 4 pairs of stubby legs arranged symmetrically, big round dark eyes with white highlights, cherry blossom pink blush on cheeks, soft mint-green bioluminescent glow along body edges, pastel mint internal organs faintly visible through translucent body, prismatic rainbow light environment, surreal microscopic world

mungyi_walking.txt:
mungyi_tardigrade, side view, full body, waddling walk pose, cute cartoon tardigrade, round translucent ice-blue body, 4 pairs of stubby legs in walking motion alternating pairs, big round dark eyes looking forward with curiosity, cherry blossom blush, mint bioluminescent edge glow, translucent body showing internal structure, prismatic light tunnel background, surreal microscopic world

mungyi_turnaround.txt:
mungyi_tardigrade, character turnaround sheet, four views front side back three-quarter, cute cartoon tardigrade, round translucent ice-blue body, 4 pairs of stubby legs, big dark eyes, cherry blossom blush, mint bioluminescent glow, consistent design across all angles, white background with faint prismatic highlights
```

### 4.5 색상 앵커

| 부위 | 캡션 키워드 | HEX 참조 |
|------|-----------|----------|
| 몸체 | `translucent ice-blue body` | `#D4EEFF` |
| 그림자 | `soft sky-blue shadow` | `#A8D8EA` |
| 내부 장기 | `pastel mint internal organs` | `#A8E6CF` |
| 눈 | `big round dark eyes` | `#2B2B2B` |
| 볼 | `cherry blossom blush` | `#FFB7C5` |
| 다리 | `translucent blue legs` | `#C8E6FF` |
| 바이오 글로우 | `mint bioluminescent glow` | `#7FFFD4` |

### 4.6 다리 수 안정화 전략

LoRA 학습 데이터에서 다리 수를 정확히 반영해야 후속 생성의 안정성이 높아진다.

1. 학습 이미지 선별 시 다리가 정확히 8개(4쌍)인 이미지만 사용
2. 캡션에 항상 `4 pairs of stubby legs arranged symmetrically` 기술
3. 다리 수가 잘못된 이미지는 Inpaint로 보정 후 학습 데이터에 포함
4. 턴어라운드 시트(Prompt 08)에서 모든 뷰의 다리 수 일관성 확인

---

## 5. 정규화 이미지 (Regularization Images)

정규화 이미지는 LoRA 학습 시 과적합을 방지하고 베이스 모델의 일반적 생성 능력을 보존하기 위해 사용한다. 학습 대상 캐릭터와 같은 "클래스"에 해당하지만 다른 개체의 이미지를 사용한다.

### 5.1 디렉토리 구조

```
lora-training/
  choeun/
    img/
      20_choeun_girl/           # 학습 이미지
    reg/
      1_girl/                   # 정규화 이미지 (클래스: girl)
        reg_girl_001.png
        reg_girl_002.png
        ...
  grandpa/
    img/
      20_grandpa_scientist/
    reg/
      1_man/                    # 정규화 이미지 (클래스: man)
  mungyi/
    img/
      25_mungyi_tardigrade/
    reg/
      1_creature/               # 정규화 이미지 (클래스: creature)
```

> 정규화 이미지의 반복 횟수는 `1_`로 설정. kohya_ss에서 학습/정규화 비율을 자동 조정.

### 5.2 캐릭터별 정규화 전략

| 캐릭터 | 정규화 클래스 | 장수 | 소스 | 주의사항 |
|--------|-------------|------|------|---------|
| 초은이 | `girl` | 20장 | 수채화 스타일 아동 캐릭터 (베이스 모델로 생성) | 아동 비율(1:3~4), 수채화 톤. 민트 조끼 없는 다양한 의상 |
| 할아버지 | `man` | 15장 | 수채화 스타일 노인 캐릭터 (베이스 모델로 생성) | 수채화 톤, 다양한 의상, 안경 유무 혼합 |
| 뭉이 | `creature` | 20장 | 초현실 스타일 귀여운 미생물/판타지 생물 (베이스 모델로 생성) | 투명/반투명 질감, 다양한 형태의 작은 생물 |

### 5.3 정규화 이미지 생성 방법

1. 베이스 모델(DreamShaperXL)로 해당 클래스의 이미지를 배치 생성
2. 프롬프트 예시 (초은이용): `watercolor illustration, young girl, children's book character, full body, white background`
3. 해상도: 1024x1024 (학습 해상도와 동일)
4. 캡션 파일 불필요 (정규화 이미지는 클래스명만 사용)
5. 학습 대상 캐릭터의 특징(민트 조끼, 돋보기 등)이 포함되지 않은 이미지만 사용

---

## 6. 학습 후 검증 체크리스트

### 6.1 단계별 검증

| 단계 | 검증 항목 | 방법 |
|------|----------|------|
| 학습 중 | 과적합 여부 | TensorBoard에서 loss 그래프 모니터링 — loss가 0에 수렴하면 과적합 |
| 학습 중 | 샘플 이미지 | 5 epoch 간격 샘플 이미지 생성 — 캐릭터 유사도 확인 |
| 학습 후 | trigger word 반응 | trigger word만으로 캐릭터가 생성되는지 확인 |
| 학습 후 | 의상 일관성 | 조끼/셔츠/반바지 등 의상 요소가 정확한지 확인 |
| 학습 후 | 색상 일관성 | color-palette.md의 HEX 값과 생성 결과 비교 |
| 학습 후 | 스타일 호환성 | watercolor LoRA / prismatic LoRA와 동시 적용 테스트 |
| 학습 후 | weight 범위 | 0.5 / 0.7 / 0.9에서 각각 생성하여 최적 범위 확인 |

### 6.2 캐릭터별 합격 기준

| 캐릭터 | 합격 기준 |
|--------|----------|
| 초은이 | trigger word + 앵글 지정으로 의상(민트 조끼 + 카키 반바지 + 짝짝이 양말) 정확 재현. 돋보기 목걸이 포함. 하늘색 구슬 땋은머리 표현 |
| 할아버지 | trigger word + 앵글 지정으로 안경 + 체크 셔츠 + 카디건(팔꿈치 패치) 정확 재현. 은백색 머리 + 따뜻한 표정 |
| 뭉이 | trigger word + 앵글 지정으로 반투명 몸체 + 8개 다리 + 큰 눈 + 민트 글로우 재현. 투명도 60~70% 유지 |

### 6.3 LoRA 파일 저장

```
models/loras/
  choeun_girl_v1.safetensors        # 초은이 LoRA
  grandpa_scientist_v1.safetensors  # 할아버지 LoRA
  mungyi_tardigrade_v1.safetensors  # 뭉이 LoRA
  ral-wtrclr-sdxl.safetensors       # 수채화 스타일 LoRA (trigger: ral-wtrclr)
  ral-crztlgls-sdxl.safetensors     # 크리스탈/프리즘 스타일 LoRA (trigger: ral-crztlgls)
```

> 캐릭터 LoRA와 스타일 LoRA는 동시 적용 가능. 캐릭터 LoRA weight + 스타일 LoRA weight 합계가 1.5를 넘지 않도록 주의.

---

## 7. 에피소드별 바이오 글로우 변형 (뭉이 전용)

뭉이는 에피소드마다 바이오 글로우 색상이 변한다. LoRA 학습 시 기본 글로우(`#7FFFD4`)로 학습하고, 추론 시 프롬프트에서 글로우 색상을 변경하여 에피소드별 변형을 적용한다.

| 에피소드 | 글로우 캡션 키워드 | HEX |
|----------|------------------|-----|
| EP01 물방울 | `mint blue bioluminescent glow` | `#7FFFD4` |
| EP02 꽃잎 | `lavender pink bioluminescent glow` | `#DDA0DD` |
| EP03 나비 날개 | `iridescent green bioluminescent glow` | `#98FB98` |
| EP04 흙 속 | `warm amber bioluminescent glow` | `#FFBF00` |
| EP05 눈 결정 | `ice white bioluminescent glow` | `#F0FFFF` |
| EP06 산호 왕국 | `neon cyan bioluminescent glow` | `#00FFFF` |
| EP07 과일 세포 | `lime green bioluminescent glow` | `#ADFF2F` |
| EP08 나뭇잎 | `emerald bioluminescent glow` | `#50C878` |
| EP09 거미줄 | `silver bioluminescent glow` | `#E8E8E8` |
| EP10 빗방울 | `sky blue bioluminescent glow` | `#87CEEB` |

---

## 8. 참조 문서

| 문서 | 용도 |
|------|------|
| `production/prompts/characters/choeun-prompts.md` | 초은이 프롬프트 원본 |
| `production/prompts/characters/grandpa-prompts.md` | 할아버지 프롬프트 원본 |
| `production/prompts/characters/mungyi-prompts.md` | 뭉이 프롬프트 원본 |
| `production/characters/style-guide.md` | 비주얼 스타일 규칙 |
| `production/characters/color-palette.md` | 캐릭터 + 에피소드 색상 팔레트 |
| `production/prompts/workflows/generation-guide.md` | ComfyUI 생성 순서 가이드 |
| `production/prompts/workflows/comfyui-*-ref.json` | 캐릭터별 ComfyUI 워크플로우 |
