# 할아버지 — '박사 할배' (68세) — 캐릭터 프롬프트 세트

> ComfyUI SDXL 즉시 사용 가능 프롬프트. 현실 세계(수채화풍)와 미시 세계(초현실) 두 스타일 버전 포함.

---

## 공통 캐릭터 기술 (Character Description Token)

```
# 모든 프롬프트 앞에 붙여 사용하는 캐릭터 기본 토큰
grandpa_base = "68-year-old Korean man, retired scientist, warm and wise grandfather figure, silver-white hair thinning on top but fluffy at the sides like a dandelion puff, round wire-rimmed glasses perched low on a broad nose, deep smile lines and crow's feet around kind narrow eyes, bushy silver eyebrows, slightly hunched posture from years of peering into microscopes, wearing a well-loved camel-brown corduroy cardigan with elbow patches over a faded plaid flannel shirt, comfortable dark brown trousers, brown leather house slippers, a chunky retro walkie-talkie clipped to cardigan pocket, a micro-lens device (resembling vintage brass goggles with crystalline lenses) hanging around his neck or pushed up on his forehead"
```

<!-- 캐릭터 정체성 메모:
- 은퇴한 과학자 → 지적이면서 따뜻한 느낌
- 은백색 민들레 홀씨 같은 옆머리 → 과학자+할아버지 동시 표현
- 코르듀로이 카디건 + 팔꿈치 패치 → 학자 느낌의 클래식한 캐주얼
- 무전기는 레트로 디자인(최신 슬림 아님) → 다락방 발명가 이미지
- 마이크로 렌즈 = 황동 고글 형태 + 수정체 렌즈 → SF 발명품 느낌
- 키가 크고 약간 구부정 → 현미경 앞에서 평생을 보낸 과학자
-->

---

## 권장 기본 파라미터

| 항목 | 권장 값 |
|------|--------|
| **Checkpoint** | DreamShaperXL_Turbo_v2_1.safetensors 또는 juggernautXL_v9.safetensors |
| **Sampler** | DPM++ 2M Karras (수채화풍) / DPM++ SDE Karras (초현실) |
| **Steps** | 30~40 |
| **CFG Scale** | 6.5~7.5 |
| **Resolution** | 1024x1024 (정사각) 또는 896x1152 (세로 캐릭터 시트) |
| **Seed** | 캐릭터 일관성용 고정 시드 사용 권장 (IP-Adapter 병행 시 자유) |
| **VAE** | sdxl_vae.safetensors |
| **LoRA** | ral-wtrclr-sdxl (현실 세계, trigger: `ral-wtrclr`) |

---

## Prompt 01: 정면 전신 — 현실 세계 (수채화풍)

<!-- 의도: 할아버지 캐릭터 기준 정면 레퍼런스. Scene 1-3에서 마이크로 렌즈를 건네는 장면의 기본형 -->

**Positive Prompt:**
```
masterpiece, best quality, character reference sheet, front view, full body,
68-year-old Korean man, retired scientist grandfather, tall with slightly hunched scholarly posture, silver-white hair thinning on top but fluffy at the sides like dandelion puffs, round wire-rimmed glasses perched low on a broad friendly nose, deep warm smile lines and crow's feet around kind narrow eyes, bushy silver eyebrows slightly wild and unkempt, weathered gentle hands with visible veins,
wearing a well-loved camel-brown corduroy cardigan with brown leather elbow patches over a faded red-and-cream plaid flannel shirt, comfortable dark brown wool trousers with slight creases, brown leather house slippers,
a chunky retro walkie-talkie with a short antenna clipped to the left cardigan pocket, a micro-lens device resembling vintage brass goggles with crystalline prismatic lenses pushed up on his forehead resting against his fluffy silver hair,
standing in a warm cluttered attic laboratory with books and specimen jars in soft focus behind him,
warm watercolor illustration style, soft afternoon window light, traditional watercolor texture with visible paper grain, gentle color bleeding at edges, Studio Ghibli-inspired warmth, kind grandfatherly presence,
clean background with subtle attic elements, character design emphasis
```

**Negative Prompt:**
```
photorealistic, 3d render, anime screencap, chibi, young man, muscular, intimidating, stern expression, military uniform, suit and tie, modern tech gadgets, smartphone, dark atmosphere, horror, extra fingers, extra limbs, deformed hands, bad anatomy, blurry, low quality, watermark, signature, text, logo, oversaturated neon colors, generic old man, Santa Claus, wizard robe
```

**Parameters:** Steps 35, CFG 7.0, Sampler DPM++ 2M Karras, 896x1152

---

## Prompt 02: 측면 전신 — 현실 세계 (수채화풍)

<!-- 의도: 프로필 뷰. 구부정한 자세와 카디건 실루엣, 무전기/마이크로렌즈 위치 확인용 -->

**Positive Prompt:**
```
masterpiece, best quality, character reference sheet, side view, full body, profile view from right side,
68-year-old Korean man, retired scientist grandfather, tall with characteristically hunched upper back from decades of laboratory work, silver-white fluffy side hair visible in profile, round wire-rimmed glasses on broad nose seen from side, kind narrow eye visible, bushy silver eyebrow,
camel-brown corduroy cardigan with elbow patch clearly visible in profile, faded plaid flannel shirt collar peeking out, dark brown trousers, brown leather slippers,
walkie-talkie clipped to front cardigan pocket visible in profile with short antenna protruding, brass micro-lens goggles pushed up on forehead visible from side showing the crystalline lens thickness and adjustable brass strap,
slight forward lean in posture, hands clasped behind back in contemplative stance,
warm watercolor illustration style, soft natural lighting from the side, traditional watercolor texture, Studio Ghibli-inspired warmth,
clean light background, character design emphasis, side profile reference
```

**Negative Prompt:**
```
photorealistic, 3d render, anime screencap, chibi, young man, muscular, straight-backed military posture, dark atmosphere, horror, extra fingers, extra limbs, deformed hands, bad anatomy, blurry, low quality, watermark, signature, text, logo, oversaturated neon colors, facing camera, front view, generic old man
```

**Parameters:** Steps 35, CFG 7.0, Sampler DPM++ 2M Karras, 896x1152

---

## Prompt 03: 표정 시트 — 미소 (Warm Smile)

<!-- 의도: Scene 1-3에서 마이크로 렌즈를 건네며 웃는 장면 / Scene 5-2에서 초은이 이야기 듣는 장면.
     "다음엔 어디를 들여다볼까?" 하고 웃는 따뜻한 미소 -->

**Positive Prompt:**
```
masterpiece, best quality, character expression sheet, close-up face portrait, head and shoulders,
68-year-old Korean man, retired scientist grandfather, silver-white fluffy side hair, round wire-rimmed glasses perched low on broad nose, deep warm smile with eyes almost closed in crescent shapes, pronounced crow's feet crinkling warmly, smile lines deeply creased, bushy silver eyebrows relaxed and slightly raised in gentle amusement, a few age spots on temples,
wearing camel-brown corduroy cardigan collar visible, faded plaid flannel shirt collar,
brass micro-lens goggles pushed up on forehead catching warm light,
expression: deeply warm knowing smile, grandfatherly pride, quiet wisdom, gentle encouragement, the kind of smile that makes a child feel safe and loved,
warm watercolor illustration style, soft golden interior lighting as if from an attic window, traditional watercolor texture with warm tones,
clean warm background, emotion reference sheet, portrait emphasis
```

**Negative Prompt:**
```
photorealistic, 3d render, anime screencap, chibi, young face, stern expression, angry, cold distant look, dark atmosphere, horror, extra fingers, deformed, bad anatomy, blurry, low quality, watermark, signature, text, logo, neutral expression, smirking, sarcastic smile, oversaturated, forced grin
```

**Parameters:** Steps 35, CFG 7.0, Sampler DPM++ 2M Karras, 1024x1024

---

## Prompt 04: 표정 시트 — 놀람 (Surprise)

<!-- 의도: 작품소개서 "가끔 본인도 모르는 현상이 나타나서 함께 놀라기도" 표현.
     Scene 4 위기 상황에서 무전으로 교신하며 놀라는 장면에도 활용 가능 -->

**Positive Prompt:**
```
masterpiece, best quality, character expression sheet, close-up face portrait, head and shoulders,
68-year-old Korean man, retired scientist grandfather, silver-white fluffy side hair slightly disheveled, round wire-rimmed glasses askew and slipping down nose, eyes wide open behind glasses in genuine surprise, bushy silver eyebrows shooting up high, mouth open in a startled "oh!", deep wrinkles animated with shock,
one hand adjusting slipping glasses, other hand holding the chunky retro walkie-talkie up near his ear with antenna extended,
expression: genuine scientific surprise, fascinated shock, not fearful but intellectually astonished, the excitement of unexpected discovery,
warm watercolor illustration style, slightly dramatic lighting suggesting something extraordinary just happened, traditional watercolor texture,
clean background with subtle light burst effect, emotion reference sheet, portrait emphasis
```

**Negative Prompt:**
```
photorealistic, 3d render, anime screencap, chibi, young face, terrified horror expression, screaming in fear, heart attack, dark atmosphere, horror, gore, extra fingers, deformed, bad anatomy, blurry, low quality, watermark, signature, text, logo, calm expression, neutral face, oversaturated, modern smartphone instead of walkie-talkie
```

**Parameters:** Steps 35, CFG 7.0, Sampler DPM++ 2M Karras, 1024x1024

---

## Prompt 05: 무전기 + 마이크로렌즈 소품 상세

<!-- 의도: 할아버지의 핵심 소품 두 가지를 단독 레퍼런스 시트로 확립.
     무전기 = 현실 세계에서 교신 도구, 마이크로 렌즈 = 미시 세계 진입 장치 -->

**Positive Prompt:**
```
masterpiece, best quality, object reference sheet, product design illustration, multiple views,
two scientific instruments on a clean background:

ITEM 1 - Retro Walkie-Talkie Communication Device:
chunky vintage walkie-talkie with rounded edges, olive-green and brass body, a short telescoping antenna on top, a circular speaker grille with concentric rings, three small toggle switches on the side, a worn leather belt clip on the back, a small glowing amber indicator light, hand-built handcrafted quality with visible tiny screws and solder marks, size reference: fits in an adult hand comfortably,

ITEM 2 - Micro-Lens Device:
vintage brass goggles with two large crystalline prismatic lenses that shimmer with rainbow iridescence, adjustable brass frame with small gear mechanisms on the temples for focusing, a worn brown leather headband strap with brass buckle adjustment, the lenses appear to contain captured light refractions within the crystal, small engraved measurement markings on the brass frame, overall aesthetic: steampunk-meets-laboratory-instrument,

warm watercolor illustration style with precise technical linework, multiple angles for each item (front, side, detail), clean white background, object design reference, high detail
```

**Negative Prompt:**
```
photorealistic photograph, modern technology, smartphone, digital screen, plastic toy, cheap materials, dark atmosphere, blurry, low quality, watermark, signature, text, logo, character holding items, hands visible, oversaturated neon, mass-produced factory look, sleek minimalist design
```

**Parameters:** Steps 35, CFG 7.5, Sampler DPM++ 2M Karras, 1152x896 (가로 - 두 소품 나란히)

---

## Prompt 06: 다락방 연구실 — 할아버지 환경 (현실 세계)

<!-- 의도: 할아버지의 활동 공간인 다락방 연구실. 캐릭터 세계관 확립 + Scene 1 배경 요소.
     할아버지가 여기서 마이크로 렌즈를 꺼내오는 장면 활용 -->

**Positive Prompt:**
```
masterpiece, best quality, interior background illustration, wide shot,
68-year-old Korean scientist grandfather in his cozy attic laboratory, silver-white fluffy hair, camel corduroy cardigan, standing at a cluttered wooden workbench reaching for the brass micro-lens goggles on a shelf,

attic laboratory environment: sloped wooden ceiling with exposed beams, a round window letting in warm afternoon sunlight with dust motes floating, overflowing bookshelves with scientific journals and old leather-bound books, glass specimen jars containing preserved plants and insects on shelves, a vintage brass microscope on the workbench, scattered hand-drawn diagrams and notes pinned to a corkboard, a worn Persian rug on the wooden floor, a desk lamp with a green glass shade, potted plants on the windowsill receiving sunlight, a small chalkboard with molecular diagrams,

warm watercolor illustration style, golden afternoon light streaming through the round window, cozy cluttered academic atmosphere, traditional watercolor texture with warm earth tones, Studio Ghibli-inspired detailed interior,
lived-in scholarly warmth, the kind of room that invites curiosity
```

**Negative Prompt:**
```
photorealistic, 3d render, modern laboratory, sterile white walls, fluorescent lighting, high-tech equipment, computer screens, dark dungeon, horror, abandoned building, dirty messy chaos, extra fingers, deformed, bad anatomy, blurry, low quality, watermark, signature, text, logo, oversaturated neon, cold blue lighting, empty room
```

**Parameters:** Steps 40, CFG 7.0, Sampler DPM++ 2M Karras, 1152x896 (가로 - 배경 공간)

---

## Prompt 07: 할아버지 반사상 — 미시 세계 (초현실)

<!-- 의도: Scene 4-2 "할아버지 얼굴이 물방울 표면에 비침" + 무전기 음파 빛 파동 시각화.
     할아버지는 직접 미시 세계에 들어가지 않지만, 물방울 표면에 반사되는 형태로 등장 -->

**Positive Prompt:**
```
masterpiece, best quality, surreal scene illustration,
a grandfather's warm face reflected and distorted on the curved inner surface of a water droplet, 68-year-old Korean man with silver-white fluffy hair and round wire-rimmed glasses, his face warped by the spherical water surface like a funhouse mirror but still recognizable and warm, his mouth open mid-speech giving urgent but caring instructions,

sound waves from his walkie-talkie communication visualized as concentric rings of golden light rippling across the water droplet surface, the light ripples carrying his voice manifest as warm amber and gold wave patterns expanding outward,

interior of water droplet visible: prismatic rainbow refractions, transparent curved water walls, the distorted outside world (garden) visible through the water membrane,

surreal microscopic world, volumetric prismatic lighting, iridescent color palette, the warmth of his presence contrasting with the crisis tension of the shaking world,
ethereal communication between macro and micro worlds
```

**Negative Prompt:**
```
photorealistic, flat illustration, chibi, clear undistorted face, character physically present inside water droplet, dark horror atmosphere, scary distortion, ugly face, extra fingers, deformed, bad anatomy, blurry, low quality, watermark, signature, text, logo, monochrome, desaturated, watercolor paper texture, mundane phone call, modern technology
```

**Parameters:** Steps 40, CFG 6.5, Sampler DPM++ SDE Karras, 1024x1024

---

## 사용 가이드

### IP-Adapter 연동
1. Prompt 01(정면)을 기준 생성 → IP-Adapter 레퍼런스 이미지로 등록
2. 이후 모든 프롬프트에서 IP-Adapter weight 0.6~0.8 적용
3. Prompt 07(미시 세계 반사상)은 IP-Adapter weight 0.4로 낮추어 왜곡 허용

### LoRA 학습 계획
- 정면/측면 기준 이미지 확정 후 → 할아버지 전용 LoRA 학습 (15~20장)
- trigger word: `grandpa_scientist`
- LoRA weight: 0.7~0.9

### 씬별 프롬프트 선택 가이드
| 씬 | 사용 프롬프트 |
|----|-------------|
| Scene 1-3 (마이크로 렌즈 건네기) | Prompt 01 + 03 (미소) + 06 (다락방) |
| Scene 4-2 (무전 교신) | Prompt 04 (놀람) + 07 (반사상) |
| Scene 5-2 (초은이 이야기 듣기) | Prompt 03 (미소) |
| Scene 6-1 (다음 화 예고) | Prompt 03 (미소) 변형 |
