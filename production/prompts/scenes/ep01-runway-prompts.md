# EP01 "물방울 속 우주" — Runway/Kling 전용 img2video 프롬프트

<!--
  각 씬의 정적 이미지(ComfyUI 생성)를 Runway Gen-3 Alpha 또는 Kling AI에 입력하여
  동적 영상(img2video)으로 변환할 때 사용하는 모션 지시 프롬프트 모음.
  카메라 무브먼트, 피사체 모션, 분위기 전환 등 영상 고유의 동적 요소를 지시합니다.
-->

> **용도**: ComfyUI 생성 이미지 → Runway Gen-3 Alpha / Kling AI img2video 변환
> **형식**: 각 프롬프트에 (1) 입력 이미지 설명, (2) 모션 지시, (3) 분위기/타이밍 포함
> **주의**: 이 프롬프트는 정적 이미지 생성용이 아님. 반드시 ComfyUI 결과물과 함께 사용

---

## 공통 설정

### Runway Gen-3 Alpha 권장 설정

| 항목 | 권장값 |
|------|--------|
| Duration | 4s (기본) / 10s (확장 — 긴 씬용) |
| Resolution | 1920 x 1080 (16:9) |
| Motion Amount | Medium (기본) / High (액션 씬) |
| Style Preset | None (ComfyUI 소스 이미지 스타일 유지) |
| Seed | 각 씬별 고정 시드 사용 (재현성 확보) |

### Kling AI 권장 설정

| 항목 | 권장값 |
|------|--------|
| Mode | Professional (고품질) |
| Duration | 5s / 10s |
| Resolution | 1920 x 1080 |
| Creativity | 0.5 (소스 이미지 충실도 유지) |
| Relevance | 0.7 (프롬프트 반영도) |

### 네거티브 프롬프트 (전체 공통)

```
sudden jump cuts, flickering, strobing, frame drops,
morphing faces, melting features, distorted anatomy during motion,
text appearing, watermarks, UI overlays,
static image with no motion, slideshow effect,
jarring abrupt camera movements, nauseating shake,
color banding, compression artifacts, blocky motion,
unnatural physics, floating objects defying gravity without reason,
lip sync or talking (dialogue is added in post-production)
```

---

## Scene 1: 정원의 발견 (0:00~0:30)

### 1-1. 정원 전경 — 와이드 줌인 (0:00~0:10)

**입력 이미지**: ComfyUI 생성 수채화풍 정원 와이드 샷 (ep01-scene01-garden.md 1-1 기준)

**Runway 프롬프트**:
```
Slow gentle camera zoom-in from wide establishing shot to medium shot of a watercolor-style garden after rain.
Subtle motion: leaves swaying gently in light breeze, water droplets sparkling intermittently on foliage,
soft cloud shadows drifting across the garden, sunbeams slowly intensifying as clouds part.
Atmosphere: peaceful, warm, inviting. Speed: very slow dolly-in, approximately 10 seconds.
Style: maintain watercolor hand-painted texture throughout, do not shift to photorealism.
Light: golden afternoon sunlight gradually growing stronger.
```

**Kling 프롬프트**:
```
A serene watercolor garden after rain. Camera slowly zooms in from wide shot.
Leaves sway softly, water drops glitter on petals. Warm golden sunlight intensifies gradually.
Maintain hand-painted watercolor animation style. Gentle peaceful motion only.
```

| 항목 | 값 |
|------|---|
| Motion Amount | Low |
| Duration | 10s |
| 핵심 모션 | 줌인 + 나뭇잎 흔들림 + 물방울 반짝임 |

---

### 1-2. 초은이 등장 — 미디엄→클로즈업 (0:10~0:20)

**입력 이미지**: ComfyUI 생성 초은이 미디엄 샷 (ep01-scene01-garden.md 1-2 기준)

**Runway 프롬프트**:
```
Camera slowly pushes in from medium shot to close-up of a 7-year-old girl examining a water drop on a leaf.
Character motion: girl slowly raises a magnifying glass to her eye level, head tilts slightly with curiosity.
Subtle eye movement: eyes widen with wonder as she looks through the magnifying glass.
Hair: light breeze moves a few strands. Background: soft garden bokeh with gentle leaf sway.
Style: watercolor animation, warm soft tones, hand-painted feel.
Expression arc: neutral curiosity → wide-eyed discovery.
```

**Kling 프롬프트**:
```
A curious girl in a watercolor garden raises a magnifying glass to examine a water drop.
Camera pushes from medium to close-up. Her eyes widen with wonder. Hair sways in light breeze.
Warm watercolor animation style. Gentle deliberate character motion.
```

| 항목 | 값 |
|------|---|
| Motion Amount | Low-Medium |
| Duration | 10s |
| 핵심 모션 | 돋보기 올리기 + 표정 변화 + 카메라 줌인 |

---

### 1-3. 물방울 클로즈업 — 매크로 줌인 (0:20~0:30)

**입력 이미지**: ComfyUI 생성 물방울 매크로 샷 (ep01-scene01-garden.md 1-3 기준)

**Runway 프롬프트**:
```
Extreme close-up of a water drop on a green leaf, camera slowly zooming deeper into the drop.
The water drop shimmers and subtly vibrates with surface tension.
Rainbow light refraction inside the drop slowly intensifies, prismatic colors shifting and dancing.
The distorted garden reflection inside the drop moves slightly as perspective shifts.
An elderly hand slowly enters frame from the right, offering a futuristic lens device.
Camera continues pushing into the water drop surface, approaching the boundary between worlds.
Style transition beginning: watercolor edges start dissolving into sharper crystalline detail.
```

**Kling 프롬프트**:
```
Macro shot of a water drop on a leaf. Camera zooms deeper into the drop. Rainbow refraction intensifies inside.
An elderly hand offers a lens device from the side. The drop shimmers with surface tension.
Watercolor style begins transitioning to crystalline detail as camera approaches the drop surface.
```

| 항목 | 값 |
|------|---|
| Motion Amount | Medium |
| Duration | 10s |
| 핵심 모션 | 줌인 + 물방울 내부 프리즘 변화 + 할아버지 손 진입 |

---

## Scene 2: 미시 세계 진입 (0:30~0:45)

### 2-1. 마이크로 렌즈 전환 — 축소 트랜지션 (0:30~0:40)

**입력 이미지**: ComfyUI 생성 키프레임 3장 (A: 수채화 초은이, B: 파티클 분해, C: 프리즘 입구)

**Runway 프롬프트**:
```
Dramatic rapid zoom-in transformation sequence. A girl puts on futuristic goggles and her body
dissolves into thousands of luminous golden particles. Camera spirals clockwise 180 degrees
while zooming at high speed through layers of reality.
Particle stream: warm gold particles at start, transitioning to rainbow prismatic particles.
Background morphs from soft watercolor garden to geometric crystalline prismatic structures.
Speed: very fast with motion blur streaks. Light trails follow the zoom direction.
Kaleidoscopic tunnel effect as scale shifts. Final frame: arriving at water drop boundary,
prismatic rainbow colors dominate the entire frame. Exhilarating, magical, breathtaking speed.
```

**Kling 프롬프트**:
```
A girl dissolves into golden light particles after putting on goggles. Rapid spiraling zoom-in.
Watercolor style transforms to prismatic crystal world. Gold particles become rainbow spectrum.
Kaleidoscopic tunnel of light. Very fast dynamic camera spiral. Magical transformation.
```

| 항목 | 값 |
|------|---|
| Motion Amount | High |
| Duration | 10s |
| 핵심 모션 | 180도 스파이럴 줌인 + 파티클 분해 + 스타일 전환 |
| 참고 | 키프레임 A→C를 시작/끝 이미지로 입력. 중간 보간은 AI가 처리 |

---

### 2-2. 물방울 내부 첫 시야 — 360도 파노라마 (0:40~0:45)

**입력 이미지**: ComfyUI 생성 물방울 내부 파노라마 (ep01-scene02-transition.md 2-2 기준)

**Runway 프롬프트**:
```
Slow awe-inspiring 360-degree camera pan inside a prismatic microscopic world within a water drop.
Camera rotates smoothly, revealing: rainbow light spectrum bands flowing like aurora borealis,
transparent curved water walls showing distorted outside world, floating molecular structures,
crystalline light pillars, bioluminescent glow from water molecules.
Tiny figure of a girl slowly appears in frame, looking around in wonder.
Floating particles drift lazily through prismatic light beams.
Atmosphere: ethereal, vast, cathedral-like space. Speed: slow majestic rotation.
Color: transparent blue base with full rainbow spectrum overlay.
```

**Kling 프롬프트**:
```
Inside a microscopic water drop. Slow 360-degree camera rotation reveals a prismatic rainbow world.
Transparent water walls, aurora-like light bands, floating molecular structures.
A tiny girl appears, looking around in wonder. Ethereal and majestic atmosphere.
Transparent blue with rainbow spectrum. Slow smooth rotation.
```

| 항목 | 값 |
|------|---|
| Motion Amount | Low-Medium |
| Duration | 5s |
| 핵심 모션 | 360도 패닝 회전 + 부유 파티클 + 캐릭터 출현 |

---

## Scene 3: 뭉이와의 만남 (0:45~1:30)

### 3-1. 뭉이 등장 — 로우앵글 접근 (0:45~1:00)

**입력 이미지**: ComfyUI 생성 뭉이 로우앵글 샷 (ep01-scene03-prism-world.md 3-1 기준)

**Runway 프롬프트**:
```
Low angle shot of a cute translucent tardigrade character waddling toward camera on a molecular surface.
8 stubby legs moving in alternating pairs, creating an adorable waddling gait.
The creature's translucent body catches and refracts prismatic light as it moves.
Camera angle transitions from low angle looking up to eye-level frontal close-up.
Background: prismatic rainbow world with floating light particles drifting slowly.
The tardigrade stops in front of camera, blinks its big friendly eyes, and tilts head curiously.
Bioluminescent glow pulses gently inside its translucent body. Warm, friendly introduction.
```

**Kling 프롬프트**:
```
A cute translucent tardigrade waddles toward camera with 8 stubby legs on a molecular surface.
Low angle rising to eye-level close-up. Prismatic rainbow background. The creature blinks
its big eyes and tilts head. Light refracts through its translucent body. Warm friendly mood.
```

| 항목 | 값 |
|------|---|
| Motion Amount | Medium |
| Duration | 10s (15초 분량이므로 클립 2개 이어붙이기) |
| 핵심 모션 | 뭉이 보행 (8다리 교차 움직임) + 카메라 앵글 전환 + 눈 깜빡임 |

---

### 3-2. 프리즘 세계 탐험 — 트래킹 샷 (1:00~1:15)

**입력 이미지**: ComfyUI 생성 두 캐릭터 나란히 걷는 원거리 샷 (ep01-scene03-prism-world.md 3-2 기준)

**Runway 프롬프트**:
```
Side-view tracking shot following two small figures walking through a rainbow light tunnel.
A tiny girl and a round tardigrade walk side by side on a prismatic spectrum path.
Camera moves parallel to their walking direction, maintaining consistent framing.
The girl points at floating molecular structures, the tardigrade nods along.
Rainbow light bands flow around them like a living tunnel. Photon particles drift like fireflies.
Water molecule clusters (blue and white spheres) slowly rotate in the background.
Pace: leisurely stroll, sense of exploration and wonder. Light: prismatic spectrum throughout.
```

**Kling 프롬프트**:
```
Two small figures walk through a rainbow light tunnel inside a water drop. Side tracking shot.
A girl and a round tardigrade walk together on a spectrum path. Floating light particles and
molecular structures surround them. Leisurely exploring pace. Prismatic rainbow lighting.
```

| 항목 | 값 |
|------|---|
| Motion Amount | Medium |
| Duration | 10s |
| 핵심 모션 | 횡이동 트래킹 + 캐릭터 걸음걸이 + 배경 분자 구조 회전 |

---

### 3-3. 표면장력 서핑 — 액션 트래킹 (1:15~1:30)

**입력 이미지**: ComfyUI 생성 서핑 액션 샷 (ep01-scene03-prism-world.md 3-3 기준)

**Runway 프롬프트**:
```
Dynamic action tracking shot of a girl and tardigrade surfing on a transparent elastic water surface.
The girl stands with arms spread wide, hair flowing backward from speed. Joyful exhilarated expression.
The tardigrade slides alongside on its belly, all 8 legs spread for balance, happy face.
The transparent membrane bounces and ripples beneath them like a trampoline.
Prismatic light ripples spread outward from their movement path.
Camera tracks alongside with slight slow-motion effect on splash ripples.
Small round water molecule characters visible along the surface, holding hands in a chain.
Speed: fast forward motion with slow-motion highlight on ripple effects.
Energy: joyful, free, exhilarating ride across the microscopic world.
```

**Kling 프롬프트**:
```
A girl and tardigrade surf on a bouncy transparent water surface. Dynamic side tracking.
Girl stands arms wide with hair flowing. Tardigrade slides on belly with legs spread.
Prismatic light ripples from their path. Slow-motion on splash effects.
Water molecule characters hold hands along the surface. Joyful energetic action.
```

| 항목 | 값 |
|------|---|
| Motion Amount | High |
| Duration | 10s |
| 핵심 모션 | 서핑 이동 + 표면 출렁임 + 프리즘 파문 확산 + 슬로모션 리플 |

---

## Scene 4: 위기와 해결 (1:30~2:15)

### 4-1. 물방울 흔들림 — 위기 진동 (1:30~1:50)

**입력 이미지**: ComfyUI 생성 프리즘 세계 왜곡 샷 (ep01-scene04-crisis.md 4-1 기준)

**Runway 프롬프트**:
```
Dramatic shaking of a prismatic microscopic world. The entire frame vibrates and distorts.
Transparent water walls bulge and deform dangerously, as if the sphere is about to burst.
Rainbow light spectrum becomes unstable — colors fragment, flicker, and streak chaotically.
Camera: handheld shake effect, then rapid zoom-out revealing the water drop's deformed shape.
Two small figures (girl and tardigrade) struggle to keep balance, stumbling.
Crystalline structures crack and tilt. Molecular chains along the surface snap apart.
Color grading shifts from warm prismatic to anxious cool blue-violet.
Tension: escalating danger, the world feels like it could collapse at any moment.
Motion: violent trembling punctuated by sudden lurches in random directions.
```

**Kling 프롬프트**:
```
A prismatic world inside a water drop shakes violently. Walls deform and bulge.
Rainbow colors fragment and flicker. Camera shakes then zooms out rapidly.
Two small figures stumble and struggle for balance. Molecular chains snap.
Colors shift to anxious blue-violet. Intense dangerous trembling.
```

| 항목 | 값 |
|------|---|
| Motion Amount | High |
| Duration | 10s (20초이므로 클립 2개 이어붙이기) |
| 핵심 모션 | 격렬한 진동 + 벽 변형 + 색감 불안정화 + 캐릭터 비틀거림 |
| 참고 | 카메라 쉐이크 강도를 점진적으로 높여 긴장감 상승 곡선 표현 |

---

### 4-2. 할아버지 무전 — 빛 파동 소통 (1:50~2:00)

**입력 이미지**: ComfyUI 생성 빛 파동 + 할아버지 얼굴 반사 샷 (ep01-scene04-crisis.md 4-2 기준)

**Runway 프롬프트**:
```
Inside shaking prismatic world, a small radio device emits concentric rings of warm golden light.
The golden light ripples expand outward like sound waves made visible, cutting through the cold blue anxiety.
On the curved water wall surface, a kind elderly grandfather's face slowly materializes in the reflection.
The face appears warped by the spherical surface but radiates warmth and reassurance.
A small girl clutches the radio, her expression shifting from fear to determined hope.
A tardigrade beside her watches the golden light waves with wide curious eyes.
Camera: close-up on radio, then widens to show light waves reaching the walls.
Color transition: cold blue-violet gradually warming with golden tones from the radio.
Atmosphere shifts from tense to hopeful as grandfather's presence is felt.
```

**Kling 프롬프트**:
```
In a shaking prismatic world, golden light rings emit from a radio device.
An elderly face appears reflected on the curved water wall. A girl holds the radio with growing hope.
Golden warmth spreads through the cold blue atmosphere. Close-up widening to show light waves.
Tense mood gradually shifts to hopeful. Warm golden vs cool blue contrast.
```

| 항목 | 값 |
|------|---|
| Motion Amount | Medium |
| Duration | 10s |
| 핵심 모션 | 빛 파동 확산 + 얼굴 반사 출현 + 색감 웜톤 전환 + 표정 변화 |

---

### 4-3. 협력 해결 — 분자 결합 복원 (2:00~2:15)

**입력 이미지**: ComfyUI 생성 키프레임 3장 (A: 달려감, B: 결합 중, C: 복원 완료)

**Runway 프롬프트**:
```
A girl and tardigrade rush to repair breaking molecular chains on the water drop surface.
The girl pushes small round water molecule characters together with both hands.
The tardigrade uses all 8 legs to bridge gaps in the molecular chain.
Molecule characters grip each other tightly — glowing blue-white energy threads form between them.
As bonds strengthen, the shaking world gradually calms down. Water walls stabilize.
The deformed water drop slowly restores to a perfect sphere shape.
Prismatic colors stabilize from chaotic flickering back to harmonious rainbow.
A healing wave of warm light ripples outward from each repaired bond.
Final moment: girl and tardigrade face each other and touch hand-to-leg in celebration.
Camera: starts close on the repair work, gradually widens to show full world stabilizing.
Color: blue-violet anxiety transitioning back to warm prismatic rainbow + transparent blue.
```

**Kling 프롬프트**:
```
A girl and tardigrade fix breaking molecular chains. Girl pushes molecules together,
tardigrade bridges gaps with 8 legs. Glowing bonds form between molecules.
The shaking world gradually calms, colors stabilize to harmonious rainbow.
Water drop restores to sphere shape. They celebrate with hand-to-leg touch.
Camera widens from close-up to full stable world. Warm light returns.
```

| 항목 | 값 |
|------|---|
| Motion Amount | Medium-High (전반 액션 → 후반 안정) |
| Duration | 10s |
| 핵심 모션 | 달려가기 + 분자 밀기 + 결합 에너지 발광 + 세계 안정화 + 하이파이브 |
| 참고 | 키프레임 A→C를 시작/끝 이미지로 입력하여 복원 과정 보간 |

---

## Scene 5: 결말 (2:15~2:45)

### 5-1. 보석빛 물방울 — 360도 회전 줌아웃 (2:15~2:30)

**입력 이미지**: ComfyUI 생성 빛나는 물방울 내부 파노라마 (ep01-scene05-resolution.md 5-1 기준)

**Runway 프롬프트**:
```
Breathtaking slow 360-degree camera rotation inside a water drop now flooded with brilliant sunlight.
The entire prismatic world blazes with jewel-like radiance — diamond brilliance in every direction.
Rainbow caustic patterns dance on the water walls like stained glass cathedral light.
A tiny girl waves goodbye to a tardigrade, both bathed in golden-rainbow light.
The tardigrade's big eyes glisten. A single prismatic tear catches the light.
Camera slowly rotates while simultaneously pulling back (zoom-out), revealing the full majestic space.
The girl's silhouette gradually becomes smaller as the camera pulls away.
Molecular structures pulse with soft harmonious bioluminescent glow.
Light: maximum brilliance, every surface refracting sunlight into full spectrum.
Emotion: beautiful, bittersweet farewell, awe at the microscopic universe's beauty.
```

**Kling 프롬프트**:
```
Inside a water drop filled with brilliant sunlight. Slow 360-degree rotation and zoom-out.
The world blazes like a jewel. A girl waves goodbye to a tardigrade in golden-rainbow light.
The tardigrade has glistening eyes. Mandala-like light patterns on water walls.
Maximum prismatic brilliance. Beautiful bittersweet farewell. Majestic slow camera pull.
```

| 항목 | 값 |
|------|---|
| Motion Amount | Low-Medium |
| Duration | 10s |
| 핵심 모션 | 360도 회전 + 줌아웃 + 빛 증폭 + 이별 손흔들기 |

---

### 5-2. 현실 복귀 — 미디엄→클로즈업 (2:30~2:45)

**입력 이미지**: ComfyUI 생성 수채화풍 초은이 정원 복귀 샷 (ep01-scene05-resolution.md 5-2 기준)

**Runway 프롬프트**:
```
Back in the watercolor-style garden. Medium shot of an excited 7-year-old girl in the garden,
transitioning to close-up of her beaming face.
The girl gestures excitedly with one hand, holding a magnifying glass in the other,
clearly telling someone off-screen about an amazing experience.
Eyes sparkling brighter than before, cheeks flushed with excitement, huge happy smile.
Hair slightly disheveled. Warm golden afternoon sunlight. Watercolor garden background.
A water drop on a nearby leaf catches a tiny rainbow glint in the background.
Camera slowly pushes from waist-up medium shot to face close-up.
Style: soft watercolor animation, warm hand-painted feel. Return to cozy reality.
Motion: expressive character gestures, subtle background leaf sway.
```

**Kling 프롬프트**:
```
A watercolor-style excited girl in a garden talks about her adventure. Medium to close-up push.
She gestures excitedly holding a magnifying glass. Sparkling eyes, flushed cheeks, big smile.
Warm golden sunlight. A water drop nearby catches a rainbow glint. Soft watercolor animation.
Expressive gestures and happy emotion. Cozy warm garden return.
```

| 항목 | 값 |
|------|---|
| Motion Amount | Low-Medium |
| Duration | 10s |
| 핵심 모션 | 카메라 줌인 + 흥분된 제스처 + 표정 연기 + 배경 나뭇잎 흔들림 |

---

## Scene 6: 다음 화 예고 (2:45~3:00)

### 6-1. 꽃을 바라보며 — 매크로 줌 티저 (2:45~3:00)

**입력 이미지**: ComfyUI 생성 키프레임 2장 (A: 초은이+장미꽃, B: 꽃잎 매크로)

**Runway 프롬프트**:
```
A watercolor-style girl in a garden looks at a red rose bush with her magnifying glass.
Camera starts on the girl, then smoothly transitions focus to the rose,
then zooms deep into a rose petal surface — macro close-up revealing microscopic texture.
First phase (0-5s): watercolor girl gazing at rose, magnifying glass raised, curious smile.
Second phase (5-8s): camera zooms into the rose, petal detail increases, watercolor softness fades.
Third phase (8-10s): extreme macro of petal surface showing tiny cellular structures (conical papillae),
a faint prismatic glow emerges from between the cells — hint of another microscopic world.
Style transition: warm watercolor → detailed macro → subtle surreal prismatic hint at the very end.
The final frame should feel like a cliffhanger — inviting the viewer into the next adventure.
Color: warm garden tones shifting to deep rose red, ending with a flash of prismatic iridescence.
```

**Kling 프롬프트**:
```
A watercolor girl examines a rose with a magnifying glass. Camera moves from girl to rose
then zooms into petal surface at macro level. Cellular texture appears. At the very end,
a faint prismatic glow hints at a microscopic world inside the flower.
Watercolor to macro to subtle surreal transition. Rose red to prismatic iridescence.
Cliffhanger ending. Inviting next adventure.
```

| 항목 | 값 |
|------|---|
| Motion Amount | Medium |
| Duration | 10s |
| 핵심 모션 | 초은이→장미꽃 포커스 전환 + 매크로 줌인 + 스타일 전환 + 프리즘 힌트 |
| 참고 | 키프레임 A→B를 시작/끝 이미지로 입력. 줌 트랜지션은 Runway가 보간 |

---

## 클립 편집 가이드

### 클립 연결 순서

| 순서 | 클립 ID | 씬 | 길이 | 전환 |
|------|---------|-----|------|------|
| 1 | RW-0100 | 1-1 정원 전경 | 10s | — |
| 2 | RW-0102 | 1-2 초은이 등장 | 10s | Cross dissolve (1s) |
| 3 | RW-0103 | 1-3 물방울 클로즈업 | 10s | Match cut on magnifying glass |
| 4 | RW-0201 | 2-1 렌즈 전환 | 10s | Match cut on water drop |
| 5 | RW-0202 | 2-2 내부 첫 시야 | 5s | Light flash transition |
| 6 | RW-0301 | 3-1 뭉이 등장 | 10s+5s | Cut |
| 7 | RW-0302 | 3-2 프리즘 탐험 | 10s+5s | Cross dissolve (0.5s) |
| 8 | RW-0303 | 3-3 표면장력 서핑 | 10s+5s | Action match cut |
| 9 | RW-0401 | 4-1 물방울 흔들림 | 10s+10s | Hard cut (긴장감) |
| 10 | RW-0402 | 4-2 할아버지 무전 | 10s | Sound bridge transition |
| 11 | RW-0403 | 4-3 협력 해결 | 10s+5s | Cross dissolve (0.5s) |
| 12 | RW-0501 | 5-1 보석빛 물방울 | 10s+5s | Light bloom transition |
| 13 | RW-0502 | 5-2 현실 복귀 | 10s+5s | Flash white → watercolor |
| 14 | RW-0601 | 6-1 꽃을 바라보며 | 10s+5s | Cross dissolve (1s) |

### 전환 효과 규칙

- **현실→미시**: 급속 줌인 + 파티클 분해 + 스타일 전환 (Scene 2-1에서 처리)
- **미시→현실**: 화이트 플래시 + 수채화풍 페이드인 (Scene 5-1→5-2에서 처리)
- **미시 세계 내부**: 크로스 디졸브 또는 매치컷 (부드러운 연결)
- **위기 장면**: 하드컷 (긴장감 유지, 부드러운 전환 금지)
- **현실 세계 내부**: 크로스 디졸브 (자연스러운 흐름)

### 총 영상 길이 계산

- 원본 클립 합계: 약 180초 (3분)
- 전환 오버랩: 약 -10초
- 후반 편집 트림: 약 -5~10초
- **최종 예상 길이**: 약 160~170초 (2분 40초~2분 50초)
- 3분 채우기 위해 오프닝 타이틀(5초) + 엔딩 크레딧(5~10초)을 후반 편집에서 추가
