# 뭉이 — 물곰 타디그레이드 (에피소드 1 친구 캐릭터) — 캐릭터 프롬프트 세트

> ComfyUI SDXL 즉시 사용 가능 프롬프트. 뭉이는 미시 세계 캐릭터이므로 대부분 초현실 스타일.
> 현실 세계 엔딩(뭉이 인사 장면)용 수채화풍 1종 포함.

---

## 공통 캐릭터 기술 (Character Description Token)

```
# 모든 프롬프트 앞에 붙여 사용하는 캐릭터 기본 토큰
mungyi_base = "cute tardigrade character (water bear), round plump barrel-shaped translucent body with a soft internal glow visible through semi-transparent skin, body has a faint prismatic iridescence like a soap bubble, 8 short stubby legs arranged in 4 pairs along the body (each leg ending in tiny rounded claws), large round friendly dark eyes with a gentle upward curve suggesting a perpetual calm smile, small round mouth, no visible nose, the head blends smoothly into the body without a distinct neck, overall size relative to the microscopic world: about the height of a human knee when standing next to miniaturized Choeun, body color: translucent pale blue-green with rainbow light refracting through the semi-transparent skin revealing soft internal structures like a living jewel"
```

<!-- 캐릭터 정체성 메모:
- 실제 타디그레이드의 형태를 기반으로 하되 의인화 → 귀엽고 친근하게
- 핵심 차별점: 투명한 몸체 → 내부가 은은하게 빛나는 '살아있는 보석' 컨셉
- 비누방울 같은 프리즘 무지개빛이 피부 표면에 감돌며 → 물방울 세계관과 시각적 통일
- 8개 다리는 뭉뚝하고 짧게 → 뒤뚱뒤뚱 걸음걸이의 귀여움 극대화
- 얼굴은 큰 눈 + 작은 입 + 코 없음 → 단순하지만 표정이 풍부한 디자인
- 성격: 느긋하고 듬직한 안내자 → 천천히 움직이지만 믿음직한 존재감
- "cute anime mascot" 탈피: 실제 타디그레이드의 통통한 배럴 형태 유지, 과도한 의인화 지양
-->

---

## 권장 기본 파라미터

| 항목 | 권장 값 |
|------|--------|
| **Checkpoint** | DreamShaperXL_Turbo_v2_1.safetensors 또는 juggernautXL_v9.safetensors |
| **Sampler** | DPM++ SDE Karras (초현실 기본) / DPM++ 2M Karras (수채화풍) |
| **Steps** | 35~45 (투명체 표현에 높은 스텝 권장) |
| **CFG Scale** | 6.0~7.0 (투명도/반투명 표현을 위해 약간 낮게) |
| **Resolution** | 1024x1024 (정사각) 또는 896x1152 (세로 캐릭터 시트) |
| **Seed** | 캐릭터 일관성용 고정 시드 사용 권장 |
| **VAE** | sdxl_vae.safetensors |
| **LoRA** | ral-crztlgls-sdxl (미시 세계, trigger: `ral-crztlgls`) / ral-wtrclr-sdxl (수채화 인서트, trigger: `ral-wtrclr`) |

---

## Prompt 01: 정면 전신 — 미시 세계 (초현실 스타일)

<!-- 의도: 뭉이 캐릭터의 기준 정면 레퍼런스. 8개 다리, 투명 몸체, 큰 눈 등 핵심 특징 확립.
     Scene 3-1 뭉이 등장 시 기본 형태 -->

**Positive Prompt:**
```
masterpiece, best quality, character reference sheet, front view, full body,
cute tardigrade character (water bear), round plump barrel-shaped body with semi-transparent translucent skin, soft internal bioluminescent glow visible through the body like light through frosted glass, body surface has prismatic soap-bubble iridescence with subtle rainbow refractions shifting across the skin,
8 short stubby legs arranged symmetrically in 4 pairs along the barrel body, each leg ending in tiny rounded translucent claws, the front pair of legs slightly raised in a friendly greeting gesture,
large round friendly dark eyes with gentle upward curve suggesting a calm perpetual smile, a subtle sparkle highlight in each eye reflecting the prismatic world, small round mouth in a content expression, smooth head blending into body without neck,
body color: translucent pale blue-green base with rainbow prismatic light playing across the surface, internal structures faintly visible as soft warm glowing shapes,
standing on a prismatic rainbow surface inside a water droplet, floating light particles and water molecules around,
surreal microscopic world, iridescent volumetric lighting, prismatic color palette with dominant transparent blues and rainbow accents,
character design emphasis, clean composition with subtle microscopic world background, creature design reference sheet
```

**Negative Prompt:**
```
photorealistic microscope photo, realistic tardigrade, scary bug, insect horror, dark creepy creature, too many eyes, hairy body, slimy gross texture, opaque solid body with no translucency, human face on animal body, bipedal standing upright, wearing clothes, anthropomorphic with human proportions, chibi anime mascot with hair bow, generic cartoon blob, dark atmosphere, horror, extra limbs beyond 8 legs, deformed, blurry, low quality, watermark, signature, text, logo, oversaturated neon, monochrome, flat coloring with no transparency effect
```

**Parameters:** Steps 40, CFG 6.5, Sampler DPM++ SDE Karras, 896x1152

---

## Prompt 02: 측면 전신 — 미시 세계 (초현실 스타일)

<!-- 의도: 측면에서 본 뭉이. 4쌍의 다리 배치, 배럴 형태의 몸체 비율, 걸음 실루엣 확인용 -->

**Positive Prompt:**
```
masterpiece, best quality, character reference sheet, side view, full body, profile view,
cute tardigrade character seen from the side, round plump barrel-shaped semi-transparent body clearly showing the elongated oval profile, translucent skin with prismatic iridescence and soft internal glow,
8 stubby legs visible from the side: 4 legs on the near side arranged in evenly spaced pairs from front to back, each short and rounded, the walking pair showing a mid-stride waddle position with alternating legs lifted,
large round eye visible in profile with gentle curve and sparkle, small round mouth, smooth rounded head profile blending into barrel body,
body color from the side: translucent pale blue-green with light passing through and creating prismatic rainbow caustic patterns on the ground beneath,
waddling gait frozen mid-step on a prismatic surface inside a water droplet,
surreal microscopic world, iridescent volumetric side lighting showing the translucency of the body beautifully, prismatic color palette,
character design emphasis, clean composition, side profile reference
```

**Negative Prompt:**
```
photorealistic, realistic tardigrade, scary bug, insect horror, dark creepy creature, hairy body, opaque solid body, human proportions, wearing clothes, chibi anime, generic cartoon, dark atmosphere, horror, extra limbs, deformed, blurry, low quality, watermark, signature, text, logo, facing camera, front view, monochrome, flat coloring
```

**Parameters:** Steps 40, CFG 6.5, Sampler DPM++ SDE Karras, 896x1152

---

## Prompt 03: 위에서 본 전신 — 미시 세계 (초현실 스타일)

<!-- 의도: 탑다운 뷰. 8개 다리의 대칭 배치를 명확히 보여주는 뷰.
     타디그레이드의 실제 형태를 반영하면서 캐릭터화된 비율 확인 -->

**Positive Prompt:**
```
masterpiece, best quality, character reference sheet, top-down view, bird's eye view, looking straight down,
cute tardigrade character seen from directly above, round plump barrel-shaped semi-transparent body viewed from top showing the oval dorsal outline, translucent skin with prismatic soap-bubble iridescence viewed from above creating concentric rainbow rings on the body surface,
8 stubby legs splayed outward symmetrically: 4 pairs visible from above, left and right sides mirroring each other perfectly, each leg ending in tiny rounded claws, legs spread in a relaxed standing position like a starfish-meets-barrel shape,
the top of the round head visible at one end of the barrel shape, large round eyes partially visible peeking from the front edge,
internal structures visible through the translucent body from above: soft glowing warm shapes arranged symmetrically inside, like looking into a living lantern,
resting on a translucent prismatic surface, the creature's body casting rainbow caustic light patterns on the surface below it due to its translucency,
surreal microscopic world, top-down lighting creating beautiful translucency effects, iridescent color palette,
character design emphasis, anatomical reference from above
```

**Negative Prompt:**
```
photorealistic, realistic tardigrade, scanning electron microscope image, scary bug, dark creepy, hairy body, opaque solid body, human proportions, chibi anime, dark atmosphere, horror, extra limbs, deformed, blurry, low quality, watermark, signature, text, logo, side view, front view, monochrome, flat coloring, no translucency
```

**Parameters:** Steps 40, CFG 6.0, Sampler DPM++ SDE Karras, 1024x1024

---

## Prompt 04: 동작 — 뒤뚱뒤뚱 걷기 (Waddling Walk)

<!-- 의도: Scene 3-1 "8개 다리로 뒤뚱뒤뚱 다가옴". 뭉이의 대표 동작.
     느긋하고 듬직한 성격이 걸음걸이에서 드러나도록 -->

**Positive Prompt:**
```
masterpiece, best quality, character action pose, full body, three-quarter view,
cute tardigrade character waddling forward in an adorable clumsy walk, round plump barrel-shaped semi-transparent body tilting slightly side to side with each step, prismatic iridescence rippling across the translucent skin with each movement,
8 stubby legs in an alternating walking pattern: the front-right and back-left pairs lifted mid-step while front-left and back-right pairs planted firmly, creating a characteristic slow wobbling gait, tiny rounded claws gripping the surface,
large round friendly eyes looking ahead with a calm welcoming expression, small round mouth curved in a gentle content smile, overall body language: unhurried and confident, a reliable guide taking its time,
slight motion blur on the lifted legs suggesting gentle movement, small prismatic light particles kicked up with each step,
walking across a rainbow prismatic light path inside a water droplet, floating water molecules in the background,
surreal microscopic world, warm iridescent volumetric lighting, the translucent body catching and scattering light beautifully with each wobble,
dynamic but gentle movement, character personality through locomotion
```

**Negative Prompt:**
```
photorealistic, realistic tardigrade, scary bug, running fast, aggressive charge, static standing still, dark creepy, opaque solid body, human bipedal walk, chibi anime, dark atmosphere, horror, extra limbs, deformed, blurry, low quality, watermark, signature, text, logo, monochrome, flat coloring, rigid stiff pose
```

**Parameters:** Steps 40, CFG 6.5, Sampler DPM++ SDE Karras, 1152x896 (가로 - 이동 방향 강조)

---

## Prompt 05: 동작 — 표면장력 서핑 (Surface Tension Surfing)

<!-- 의도: Scene 3-3 표면장력 서핑. 뭉이가 초은이와 함께 물 표면에서 서핑하는 장면.
     뭉이의 8개 다리가 표면장력 위에서 균형 잡는 독특한 자세 -->

**Positive Prompt:**
```
masterpiece, best quality, dynamic action pose, full body,
cute tardigrade character surfing on the elastic surface tension of water inside a water droplet, round plump barrel-shaped semi-transparent body leaning forward with momentum, prismatic iridescence intensified by speed creating streaking rainbow trails behind,
8 stubby legs spread wide for balance on the bouncy transparent water surface: front 4 legs gripping the surface membrane, back 4 legs lifted slightly as if riding a wave, the elastic water surface visibly bending and dimpling under the creature's weight like a trampoline,
visible water molecule chains (small connected spheres holding hands) forming the surface tension layer beneath, the molecules stretching but holding together,
large round eyes wide with exhilarated joy, small mouth open in a gleeful expression, body language radiating pure fun,
dynamic motion lines, prismatic spray of light particles from the sliding movement, rainbow light refracting through the curved water droplet walls in background,
surreal microscopic world, dynamic volumetric prismatic lighting, action scene with scientific accuracy (surface tension visualization),
joyful adventure, sense of speed on a microscopic scale
```

**Negative Prompt:**
```
photorealistic, realistic tardigrade, scary bug, static pose, standing still, ocean surfing with surfboard, beach waves, dark creepy, opaque solid body, chibi anime, dark atmosphere, horror, extra limbs, deformed, blurry, low quality, watermark, signature, text, logo, monochrome, flat coloring, slow movement, sad expression
```

**Parameters:** Steps 40, CFG 7.0, Sampler DPM++ SDE Karras, 1152x896 (가로 - 서핑 역동성)

---

## Prompt 06: 동작 — 인사/이별 (Farewell Wave)

<!-- 의도: Scene 5-1 "뭉이에게 인사". 초은이가 떠나기 전 뭉이가 앞다리를 들어 인사하는 장면.
     감정적 순간 — 작지만 듬직한 친구의 이별 인사 -->

**Positive Prompt:**
```
masterpiece, best quality, emotional character pose, full body, front-facing three-quarter view,
cute tardigrade character waving farewell, round plump barrel-shaped semi-transparent body standing upright with a slight backward lean to raise front legs, prismatic iridescence on translucent skin glowing warmly,
front pair of 2 stubby legs raised and waving gently in a farewell gesture, remaining 6 legs planted firmly on the ground supporting the slightly tilted-back posture, tiny rounded claws on the waving legs spread open in a friendly wave,
large round eyes glistening with a bittersweet but warm emotion, a gentle brave smile on the small round mouth, overall expression: "see you next time" — not sad but hopeful,
the translucent body glowing slightly brighter from within as if radiating warmth and affection, internal bioluminescence intensified by emotion,
standing in a water droplet world flooded with brilliant warm sunlight making everything glow like jewels, prismatic rainbow light surrounding the scene,
surreal microscopic world, warm golden-prismatic lighting, emotional farewell scene,
the small creature's gesture carrying enormous warmth and meaning
```

**Negative Prompt:**
```
photorealistic, realistic tardigrade, scary bug, crying tears, devastated sadness, dark gloomy, depressing, opaque solid body, human hand waving, chibi anime with accessories, dark atmosphere, horror, extra limbs, deformed, blurry, low quality, watermark, signature, text, logo, monochrome, flat coloring, cold lighting, indifferent expression
```

**Parameters:** Steps 40, CFG 6.5, Sampler DPM++ SDE Karras, 896x1152

---

## Prompt 07: 수채화풍 뭉이 — 현실 세계 인서트

<!-- 의도: 결말부에서 초은이가 현실로 돌아온 후 회상하거나, 차기 에피소드 예고에서
     수채화풍으로 뭉이를 보여주는 인서트 컷. 미시 세계와 다른 스타일로 같은 캐릭터 표현 -->

**Positive Prompt:**
```
masterpiece, best quality, watercolor illustration insert, full body,
cute tardigrade character reimagined in warm watercolor illustration style, the same round plump barrel-shaped body but rendered with soft watercolor washes instead of translucent CG, body painted in gentle robin-egg blue with soft watercolor edges bleeding into the paper, subtle hint of rainbow in the watercolor pigment suggesting its prismatic nature,
8 short stubby legs painted with confident brushstrokes, large round friendly dark eyes rendered with careful watercolor detail, small content smile,
sitting calmly on a watercolor-painted leaf with a water droplet nearby reflecting rainbow light,
warm watercolor illustration style matching the real-world segments, soft diffused natural lighting, traditional watercolor texture with visible paper grain and gentle pigment granulation, hand-painted quality, Studio Ghibli-inspired creature design,
children's book illustration quality, the microscopic creature rendered approachable and lovable in traditional art style
```

**Negative Prompt:**
```
photorealistic, 3d render, realistic tardigrade, scanning electron microscope, scary bug, digital art look, glossy CG render, dark atmosphere, horror, extra limbs, deformed, blurry, low quality, watermark, signature, text, logo, oversaturated neon, monochrome, prismatic surreal lighting, microscopic world background, complex detailed background
```

**Parameters:** Steps 35, CFG 7.0, Sampler DPM++ 2M Karras, 1024x1024

---

## Prompt 08: 뭉이 다각도 턴어라운드 시트

<!-- 의도: 정면/좌측면/후면/우측면을 한 장에 배치하는 턴어라운드 시트.
     LoRA 학습 및 AnimateDiff 입력용 종합 레퍼런스 -->

**Positive Prompt:**
```
masterpiece, best quality, character turnaround sheet, multiple views on single image, model sheet,
cute tardigrade character shown in 4 angles arranged horizontally: front view, right side view, back view, left side view,
consistent design across all views: round plump barrel-shaped semi-transparent body with prismatic iridescence, 8 short stubby legs in 4 symmetrical pairs, large round friendly dark eyes (visible in front and side views), small round mouth, smooth head blending into barrel body,
translucent pale blue-green body color consistent across all angles, soft internal glow visible from every direction, prismatic rainbow light playing across the surface,
each view clearly showing the leg arrangement from that angle: front view (4 legs visible - 2 left 2 right), side view (4 legs visible on near side), back view (4 legs visible - 2 left 2 right, no face), left side view (4 legs on near side),
neutral standing pose consistent across all 4 views, on a simple reflective prismatic surface,
clean white background with subtle prismatic light effects, character design turnaround reference sheet, consistent proportions across all views,
technical reference quality, suitable for LoRA training and animation reference
```

**Negative Prompt:**
```
photorealistic, realistic tardigrade, scary bug, inconsistent design between views, different sizes, different colors between views, dark atmosphere, horror, opaque solid body, human proportions, chibi anime, extra limbs, deformed, blurry, low quality, watermark, signature, text, logo, complex background, single view only, monochrome, flat coloring, action pose
```

**Parameters:** Steps 45, CFG 7.0, Sampler DPM++ SDE Karras, 1536x640 (초와이드 - 4뷰 가로 배치) 또는 1152x896

---

## 사용 가이드

### 투명 몸체 표현 팁
1. **CFG를 낮게 유지 (6.0~6.5)**: 높은 CFG는 몸체를 불투명하게 만드는 경향이 있음
2. **Steps를 높게 (40~45)**: 투명체 내부 디테일이 충분히 렌더링되려면 높은 스텝 필요
3. **ControlNet Depth 활용**: 뭉이의 둥근 형태를 유지하면서 투명도를 확보하려면 Depth Map 가이드 권장
4. **후처리**: 투명도가 부족한 결과물은 ComfyUI의 Opacity/Blend 노드로 보정 가능

### IP-Adapter 연동
1. Prompt 01(정면)을 기준 생성 → IP-Adapter 레퍼런스로 등록
2. 모든 뭉이 프롬프트에 IP-Adapter weight 0.5~0.7 (투명 캐릭터 특성상 약간 낮게)
3. Prompt 07(수채화풍)은 IP-Adapter weight 0.4로 스타일 전환 허용

### LoRA 학습 계획
- Prompt 08(턴어라운드)로 기본 4뷰 확보 후 추가 앵글/동작으로 15~20장 수집
- trigger word: `mungyi_tardigrade`
- LoRA weight: 0.6~0.8 (투명체이므로 과도한 weight는 디테일 손실 유발)

### 씬별 프롬프트 선택 가이드
| 씬 | 사용 프롬프트 |
|----|-------------|
| Scene 3-1 (뭉이 등장) | Prompt 01 (정면) + 04 (걷기) |
| Scene 3-2 (프리즘 탐험) | Prompt 04 (걷기) — 초은이 투샷은 choeun-prompts Prompt 10 참조 |
| Scene 3-3 (표면장력 서핑) | Prompt 05 (서핑) |
| Scene 4-3 (협력 해결) | Prompt 01 변형 (분자 결합 강화 장면 추가) |
| Scene 5-1 (이별 인사) | Prompt 06 (인사) |
| Scene 5-2 (현실 복귀 회상) | Prompt 07 (수채화풍) |
| AnimateDiff 입력용 | Prompt 08 (턴어라운드 시트) |

### 뭉이의 8개 다리 생성 안정화
SDXL은 다리 수를 정확히 생성하는 데 어려움이 있을 수 있으므로:
1. "8 legs" 대신 "4 pairs of stubby legs arranged symmetrically"로 기술
2. ControlNet의 OpenPose 또는 Scribble을 사용해 다리 위치를 수동 가이드
3. 생성 후 Inpaint로 다리 수 보정 (ComfyUI Inpaint 노드 활용)
4. 다리가 6개 또는 10개로 나올 경우 시드를 변경하며 재생성 후 최적 결과 선별
