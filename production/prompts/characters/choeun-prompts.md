# 초은이 (박초은, 7세) — 캐릭터 프롬프트 세트

> ComfyUI SDXL 즉시 사용 가능 프롬프트. 현실 세계(수채화풍)와 미시 세계(초현실) 두 스타일 버전 포함.

---

## 공통 캐릭터 기술 (Character Description Token)

```
# 모든 프롬프트 앞에 붙여 사용하는 캐릭터 기본 토큰
choeun_base = "7-year-old Korean girl, short bobbed black hair with a single tiny braid on the right side tied with a sky-blue bead, round face with large expressive dark brown eyes, slightly chubby cheeks with a faint natural blush, small upturned nose, wearing a pastel mint field-explorer vest over a cream-colored long-sleeve shirt, khaki cargo shorts with oversized pockets, mismatched socks (one striped blue, one dotted green), worn brown lace-up boots, a brass magnifying glass hanging from a leather cord around her neck"
```

<!-- 캐릭터 정체성 메모:
- 뻔한 애니메이션 소녀가 아닌 '현장 탐험가' 느낌의 7세 소녀
- 돋보기는 목에 걸려 있는 황동 돋보기 (트레이드마크)
- 파스텔 민트 탐험 조끼 + 카키 반바지 → 자연탐험가 이미지
- 양말 짝짝이 → 7세다운 엉뚱함과 개성 표현
- 머리 한쪽에 하늘색 구슬로 묶은 작은 땋은 머리 → 식별 포인트
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
| **LoRA** | ral-wtrclr-sdxl (현실 세계, trigger: `ral-wtrclr`) / ral-crztlgls-sdxl (미시 세계, trigger: `ral-crztlgls`) |

---

## Prompt 01: 정면 전신 — 현실 세계 (수채화풍)

<!-- 의도: 캐릭터 레퍼런스 시트의 기준이 되는 정면 전신. 수채화 스타일의 따뜻한 정원 배경 -->

**Positive Prompt:**
```
masterpiece, best quality, character reference sheet, front view, full body,
7-year-old Korean girl, short bobbed black hair with a single tiny braid on the right side tied with a sky-blue bead, round face with large expressive dark brown eyes, slightly chubby cheeks with a faint natural blush, small upturned nose, curious bright smile showing slight gap in front teeth,
wearing a pastel mint field-explorer vest over a cream-colored long-sleeve shirt, khaki cargo shorts with oversized pockets stuffed with small leaves and pebbles, mismatched socks (one striped blue, one dotted green), worn brown lace-up boots with mud on the soles,
a brass magnifying glass hanging from a leather cord around her neck,
standing in a sunlit garden after rain, warm watercolor illustration style, soft diffused lighting, traditional watercolor texture with visible paper grain, gentle color bleeding at edges, Studio Ghibli-inspired warmth, children's book illustration quality,
white background with minimal garden elements, character design emphasis
```

**Negative Prompt:**
```
photorealistic, 3d render, anime screencap, chibi, super deformed, adult proportions, mature face, makeup, high heels, sexy, revealing clothing, dark atmosphere, horror, gore, extra fingers, extra limbs, deformed hands, bad anatomy, blurry, low quality, watermark, signature, text, logo, oversaturated neon colors, generic anime girl, school uniform, magical girl costume
```

**Parameters:** Steps 35, CFG 7.0, Sampler DPM++ 2M Karras, 896x1152

---

## Prompt 02: 측면 전신 — 현실 세계 (수채화풍)

<!-- 의도: 90도 측면 프로필. 머리 뒤의 땋은 머리와 조끼 옆면 디테일 확인용 -->

**Positive Prompt:**
```
masterpiece, best quality, character reference sheet, side view, full body, profile view from left side,
7-year-old Korean girl, short bobbed black hair with a single tiny braid on the right side tied with a sky-blue bead visible behind the head, round face profile with small upturned nose, large dark brown eye visible in profile, slightly chubby cheek with natural blush,
wearing a pastel mint field-explorer vest with side pockets, cream-colored long-sleeve shirt visible underneath, khaki cargo shorts with oversized pockets, mismatched socks, worn brown lace-up boots,
brass magnifying glass hanging from leather cord at chest level,
walking pose with one foot slightly forward, natural stride,
warm watercolor illustration style, soft diffused lighting, traditional watercolor texture with visible paper grain, gentle color bleeding, Studio Ghibli-inspired warmth,
clean light background, character design emphasis, side profile reference
```

**Negative Prompt:**
```
photorealistic, 3d render, anime screencap, chibi, super deformed, adult proportions, mature face, makeup, dark atmosphere, horror, extra fingers, extra limbs, deformed hands, bad anatomy, blurry, low quality, watermark, signature, text, logo, oversaturated neon colors, generic anime girl, facing camera, front view
```

**Parameters:** Steps 35, CFG 7.0, Sampler DPM++ 2M Karras, 896x1152

---

## Prompt 03: 후면 전신 — 현실 세계 (수채화풍)

<!-- 의도: 등 뒤에서 본 모습. 조끼 뒷면, 반바지 뒷주머니, 부츠 등 확인용 -->

**Positive Prompt:**
```
masterpiece, best quality, character reference sheet, back view, full body, rear view,
7-year-old Korean girl seen from behind, short bobbed black hair with a single tiny braid on the right side tied with a sky-blue bead clearly visible, back of round head,
pastel mint field-explorer vest from behind showing back panel with a small embroidered leaf patch, cream-colored long-sleeve shirt visible at sleeves and collar, khaki cargo shorts with a back pocket holding a small notebook, mismatched socks, worn brown lace-up boots,
leather cord of magnifying glass visible around neck from behind,
standing and looking ahead toward a garden path, slight head tilt to the right,
warm watercolor illustration style, soft afternoon sunlight casting gentle shadow, traditional watercolor texture, Studio Ghibli-inspired warmth,
clean light background, character design emphasis, back reference
```

**Negative Prompt:**
```
photorealistic, 3d render, anime screencap, chibi, super deformed, adult proportions, face visible, front view, side view, dark atmosphere, horror, extra fingers, extra limbs, deformed hands, bad anatomy, blurry, low quality, watermark, signature, text, logo, oversaturated neon colors
```

**Parameters:** Steps 35, CFG 7.0, Sampler DPM++ 2M Karras, 896x1152

---

## Prompt 04: 표정 시트 — 호기심 (Curiosity)

<!-- 의도: Scene 1-2에서 물방울 발견 시 호기심 가득한 표정. 눈이 반짝이는 느낌 -->

**Positive Prompt:**
```
masterpiece, best quality, character expression sheet, close-up face portrait, head and shoulders,
7-year-old Korean girl, short bobbed black hair with sky-blue bead braid, round face with large expressive dark brown eyes sparkling with wonder and curiosity, eyebrows slightly raised, pupils dilated with excitement, mouth slightly open in an "ooh" shape, chubby cheeks with natural blush deepening from excitement,
holding a brass magnifying glass up near her face with both hands, peering through it with one eye comically enlarged,
warm watercolor illustration style, soft golden hour lighting on face, traditional watercolor texture, gentle warm tones,
expression: intense curiosity, wonder, fascination, discovery moment,
clean warm-toned background, portrait emphasis, emotion reference sheet
```

**Negative Prompt:**
```
photorealistic, 3d render, anime screencap, chibi, adult face, mature expression, makeup, dark atmosphere, horror, extra fingers, deformed hands, bad anatomy, blurry, low quality, watermark, signature, text, logo, neutral expression, bored expression, generic cute face, oversaturated
```

**Parameters:** Steps 35, CFG 7.0, Sampler DPM++ 2M Karras, 1024x1024

---

## Prompt 05: 표정 시트 — 놀람 (Surprise)

<!-- 의도: Scene 2-1에서 미시 세계 진입 시 / Scene 4-1에서 위기 시 놀라는 표정 -->

**Positive Prompt:**
```
masterpiece, best quality, character expression sheet, close-up face portrait, head and shoulders,
7-year-old Korean girl, short bobbed black hair with sky-blue bead braid, round face with large dark brown eyes wide open in surprise, eyebrows raised high, jaw dropped open showing small teeth, chubby cheeks stretched in shock, hair slightly windswept as if caught in a gust,
both hands raised near face with fingers spread in startled gesture, brass magnifying glass swinging on leather cord at chest,
warm watercolor illustration style, dramatic but warm lighting with a slight backlight glow, traditional watercolor texture,
expression: genuine surprise, astonishment, amazement mixed with slight alarm,
clean background with subtle motion lines suggesting sudden event, emotion reference sheet
```

**Negative Prompt:**
```
photorealistic, 3d render, anime screencap, chibi, adult face, mature expression, makeup, dark atmosphere, horror, terror, screaming in pain, extra fingers, deformed hands, bad anatomy, blurry, low quality, watermark, signature, text, logo, calm expression, neutral face, oversaturated
```

**Parameters:** Steps 35, CFG 7.0, Sampler DPM++ 2M Karras, 1024x1024

---

## Prompt 06: 표정 시트 — 기쁨 (Joy)

<!-- 의도: Scene 5-2에서 현실 복귀 후 기쁨에 찬 표정. "할아버지, 물방울 속에 우주가 있었어!" -->

**Positive Prompt:**
```
masterpiece, best quality, character expression sheet, close-up face portrait, head and shoulders,
7-year-old Korean girl, short bobbed black hair with sky-blue bead braid slightly messy from adventure, round face with large dark brown eyes crinkled in pure joy, big genuine smile with gap-toothed grin, cheeks pushed up high from smiling, natural blush intensified from happiness, a tiny smudge of dirt on forehead from adventure,
one hand raised in an excited wave, other hand clutching brass magnifying glass tightly against chest,
warm watercolor illustration style, bright warm sunlight illuminating face from the side, golden hour glow, traditional watercolor texture with warm color bleeding,
expression: pure unbridled joy, excitement, triumph, eagerness to share discovery,
clean warm background with soft lens flare, emotion reference sheet
```

**Negative Prompt:**
```
photorealistic, 3d render, anime screencap, chibi, adult face, mature expression, makeup, dark atmosphere, horror, extra fingers, deformed hands, bad anatomy, blurry, low quality, watermark, signature, text, logo, subtle smile, polite expression, forced smile, oversaturated, clean perfect face
```

**Parameters:** Steps 35, CFG 7.0, Sampler DPM++ 2M Karras, 1024x1024

---

## Prompt 07: 정면 전신 — 미시 세계 (초현실 스타일)

<!-- 의도: 미시 세계(물방울 내부)에 들어간 초은이. 수채화풍이 아닌 초현실적 프리즘 세계 속의 캐릭터.
     Scene 2-2, 3-1, 3-2에서 사용. 같은 캐릭터이지만 세계관 전환으로 비주얼 톤이 달라짐 -->

**Positive Prompt:**
```
masterpiece, best quality, front view, full body,
7-year-old Korean girl miniaturized to microscopic scale, short bobbed black hair with sky-blue bead braid now subtly reflecting prismatic light, round face with large dark brown eyes reflecting rainbow spectrum, wearing a pastel mint field-explorer vest that shimmers with iridescent light particles, cream shirt with faint light refractions visible on fabric, khaki cargo shorts, mismatched socks, worn brown boots,
brass magnifying glass around neck now glowing faintly with captured light,
standing inside a water droplet, surrounded by prismatic rainbow light refractions, transparent curved water walls visible in background, floating light particles and water molecules around her, microscopic scale environment,
surreal dreamlike atmosphere, iridescent color palette of rainbow and transparent blue, volumetric prismatic lighting, light spectrum effects, ethereal glow, hyper-detailed microscopic world,
the character retains her warm realistic proportions while the world around her is fantastically surreal
```

**Negative Prompt:**
```
photorealistic photograph, flat illustration, chibi, super deformed, adult proportions, mature face, makeup, dark gothic atmosphere, horror, gore, extra fingers, extra limbs, deformed hands, bad anatomy, blurry, low quality, watermark, signature, text, logo, monochrome, desaturated, generic fantasy, typical fairy tale, mundane lighting, watercolor style, paper texture
```

**Parameters:** Steps 40, CFG 6.5, Sampler DPM++ SDE Karras, 896x1152

---

## Prompt 08: 액션 포즈 — 표면장력 서핑 (미시 세계)

<!-- 의도: Scene 3-3 표면장력 서핑. 초은이가 물 표면 위에서 서핑하는 역동적 장면.
     핵심 액션 씬이자 교육 포인트(표면장력) 시각화 -->

**Positive Prompt:**
```
masterpiece, best quality, dynamic action pose, full body,
7-year-old Korean girl surfing on the elastic surface of water tension inside a water droplet, short bobbed black hair with sky-blue bead braid flying in the wind, round face with thrilled excited expression and wide sparkling eyes, arms outstretched for balance, knees bent in surfing stance, pastel mint vest fluttering,
standing on a translucent flexible water surface that bends like a trampoline under her feet, visible water molecule chains (depicted as small connected spheres holding hands) forming the surface beneath her,
prismatic rainbow light refracting through the curved water droplet walls, floating light particles, iridescent spectral colors, dynamic motion blur on edges,
microscopic world interior, surreal scientific fantasy, volumetric prismatic lighting, dynamic camera angle from slightly below,
joyful adventure moment, sense of speed and freedom
```

**Negative Prompt:**
```
photorealistic, flat illustration, chibi, static pose, standing still, adult proportions, mature face, dark atmosphere, horror, gore, extra fingers, extra limbs, deformed hands, bad anatomy, blurry, low quality, watermark, signature, text, logo, ocean surfing, beach, real water waves, monochrome, watercolor style, paper texture, generic magical girl
```

**Parameters:** Steps 40, CFG 7.0, Sampler DPM++ SDE Karras, 1152x896 (가로 구도 - 서핑 역동성)

---

## Prompt 09: 돋보기 소품 상세 클로즈업

<!-- 의도: 초은이의 트레이드마크 돋보기를 단독으로 상세 묘사. 소품 레퍼런스 시트용.
     두 스타일 모두에서 동일한 소품이 등장해야 하므로 기준 확립 필요 -->

**Positive Prompt:**
```
masterpiece, best quality, object reference sheet, product photography style,
antique brass magnifying glass, slightly tarnished golden brass frame with patina of age and use, round lens approximately 8cm diameter with crystal-clear glass, ornate handle with subtle leaf-vine engravings, a worn leather cord loop threaded through a small ring at the handle's base for wearing around the neck,
the lens catches and refracts surrounding light creating small rainbow prisms on the surface,
multiple angles: front view showing full lens and handle, side view showing thickness and cord attachment, detail view of handle engravings,
warm natural lighting, clean white background, object design reference, high detail,
style: warm watercolor illustration with precise linework for the object details
```

**Negative Prompt:**
```
photorealistic photograph, plastic toy, modern design, sleek minimalist, chrome metal, broken glass, cracked lens, dark atmosphere, blurry, low quality, watermark, signature, text, logo, character holding it, hands visible, oversaturated neon
```

**Parameters:** Steps 35, CFG 7.5, Sampler DPM++ 2M Karras, 1024x1024

---

## Prompt 10: 초은이 + 뭉이 투샷 — 미시 세계

<!-- 의도: Scene 3-2 프리즘 세계 탐험. 초은이와 뭉이가 나란히 걷는 모습.
     두 캐릭터 간 크기 비율과 관계성 확립용 -->

**Positive Prompt:**
```
masterpiece, best quality, two characters walking together, medium shot,
7-year-old Korean girl miniaturized to microscopic scale walking alongside a cute tardigrade creature, the girl has short bobbed black hair with sky-blue bead braid, round face with gentle happy smile, pastel mint field-explorer vest, khaki shorts, mismatched socks, brown boots, brass magnifying glass on leather cord,
the tardigrade companion (named Mungyi) is about knee-height to the girl, round translucent body with 8 stubby legs, big friendly dark eyes, waddling beside her,
walking together through a rainbow prismatic light tunnel inside a water droplet, light spectrum forming a glowing path beneath their feet, floating water molecules and light particles drifting around them,
warm companionship, adventure friendship, size comparison reference between characters,
surreal microscopic world, iridescent volumetric lighting, prismatic color palette, ethereal dreamlike atmosphere
```

**Negative Prompt:**
```
photorealistic, flat illustration, chibi, adult proportions, dark atmosphere, horror, gore, extra fingers, extra limbs, deformed hands, bad anatomy, blurry, low quality, watermark, signature, text, logo, monochrome, realistic tardigrade, scary creature, single character only, watercolor paper texture, mundane environment
```

**Parameters:** Steps 40, CFG 6.5, Sampler DPM++ SDE Karras, 1152x896 (가로 - 두 캐릭터 나란히)

---

## 사용 가이드

### IP-Adapter 연동
1. Prompt 01(정면)을 기준 생성 → 가장 만족스러운 결과를 IP-Adapter 레퍼런스 이미지로 등록
2. 이후 모든 프롬프트 생성 시 IP-Adapter weight 0.6~0.8로 일관성 유지
3. 미시 세계 프롬프트(07, 08, 10)는 IP-Adapter weight를 0.5로 낮추어 스타일 전환 허용

### LoRA 학습 계획
- 정면/측면/후면 기준 이미지 확정 후 → 초은이 전용 LoRA 학습 (20~30장 레퍼런스)
- trigger word: `choeun_girl`
- LoRA weight: 0.7~0.9

### 씬별 프롬프트 선택 가이드
| 씬 | 사용 프롬프트 |
|----|-------------|
| Scene 1-2 (정원에서 물방울 발견) | Prompt 01 + 04 (호기심) |
| Scene 2-1 (미시 세계 진입) | Prompt 05 (놀람) → Prompt 07 (미시 정면) |
| Scene 3-1 (뭉이 만남) | Prompt 07 + 10 (투샷) |
| Scene 3-2 (프리즘 탐험) | Prompt 10 (투샷 걷기) |
| Scene 3-3 (표면장력 서핑) | Prompt 08 (서핑 액션) |
| Scene 4-1 (위기) | Prompt 05 (놀람, 미시 세계 배경으로 수정) |
| Scene 5-2 (현실 복귀) | Prompt 06 (기쁨) |
| Scene 6-1 (다음 화 예고) | Prompt 01 변형 (장미꽃 바라보기) |
