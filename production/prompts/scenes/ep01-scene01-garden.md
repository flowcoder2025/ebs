# EP01 Scene 1: 정원의 발견 (0:00~0:30)

<!-- 현실 세계 — 수채화풍 따뜻한 톤. 비 갠 오후 정원에서 초은이가 물방울을 발견하는 도입부 -->

> **비주얼 레이어**: 현실 세계
> **스타일 톤**: 따뜻한 수채화 느낌, 손그림 질감, 부드럽고 친근한 톤
> **1화 색감**: 무지개 + 투명 블루 (물방울 클로즈업에서 시작)
> **생성 도구**: ComfyUI SDXL (watercolor style LoRA)

---

## Sub-Scene 1-1: 정원 전경 (0:00~0:10)

<!-- 비 갠 오후 정원. 와이드 샷에서 서서히 줌인하며 촉촉한 정원의 온기를 전달 -->

### Positive Prompt

```
masterpiece, best quality, watercolor animation style, hand-painted texture, soft brush strokes,
cozy garden after rain, late afternoon golden sunlight filtering through clearing clouds,
lush green trees and colorful flower beds glistening with water droplets,
wet grass and leaves with tiny sparkling water beads,
warm color palette with soft yellows, gentle greens, and muted pinks,
atmospheric light rays through clouds, petrichor mood,
children's animation background, Studio Ghibli-inspired environment art,
wide establishing shot slowly zooming in, depth of field,
gentle lens flare from sun, volumetric lighting through mist,
no characters in frame, serene peaceful garden landscape,
16:9 aspect ratio, animation background plate
```

### Negative Prompt

```
photorealistic, 3D render, CGI, plastic texture, harsh shadows,
dark mood, horror, night scene, urban, indoor,
text, watermark, signature, logo, UI elements,
low quality, blurry, pixelated, jpeg artifacts, noise,
oversaturated neon colors, flat lighting, monochrome,
anime screencap, manga panel, comic book style,
deformed plants, floating objects, impossible geometry
```

### Parameters

| 항목 | 권장값 |
|------|--------|
| Model | SDXL 1.0 + Watercolor Style LoRA (weight 0.7) |
| Resolution | 1920 x 1080 (16:9) |
| CFG Scale | 7.0 |
| Sampler | DPM++ 2M Karras |
| Steps | 30 |
| Seed | 고정 후 배리에이션 (seed: 1001 기준, variation 0.1~0.3) |
| ControlNet | None (배경 전용) |
| Clip Skip | 2 |

### 생성 가이드

- 와이드 → 줌인 트랜지션은 두 장의 이미지(와이드/미디엄)를 생성 후 Runway img2video로 카메라 무브먼트 적용
- 물방울 반짝임은 후반 합성(After Effects)에서 글리터 이펙트로 추가
- 색온도: 따뜻한 골든아워 톤 (color temperature ~5500K 느낌)
- 정원 레퍼런스: 한국 시골집 정원 + 유럽식 코티지 가든 혼합

---

## Sub-Scene 1-2: 초은이 등장 (0:10~0:20)

<!-- 초은이가 정원에서 놀다가 나뭇잎 위 물방울 발견. 호기심 가득한 표정의 미디엄→클로즈업 -->

### Positive Prompt

```
masterpiece, best quality, watercolor animation style, hand-painted texture, soft brush strokes,
7-year-old Korean girl Choeun in cozy garden, curious bright expression,
short bobbed black hair with a single tiny braid on the right side tied with a sky-blue bead, round face with large expressive dark brown eyes,
wearing a pastel mint field-explorer vest over a cream-colored long-sleeve shirt, khaki cargo shorts with oversized pockets,
mismatched socks and worn brown lace-up boots, a brass magnifying glass hanging from a leather cord around her neck,
holding the brass magnifying glass up to eye level, examining a water drop on a leaf,
medium shot transitioning to face close-up, soft focus background,
warm afternoon sunlight on face, sparkling eyes full of wonder and curiosity,
watercolor skin tones with rosy cheeks, gentle shading,
garden background with bokeh effect, green foliage frame,
children's animation character art, Studio Ghibli-inspired character rendering,
expressive eyes catching light, subtle smile of discovery
```

### Negative Prompt

```
photorealistic, 3D render, CGI, plastic skin, uncanny valley,
adult proportions, mature face, makeup, glamorous,
dark mood, horror, scary expression,
text, watermark, signature, logo,
low quality, blurry, pixelated, jpeg artifacts,
oversaturated, flat lighting, harsh shadows,
deformed face, extra fingers, mutated hands, bad anatomy,
wrong eye direction, cross-eyed, asymmetric face
```

### Parameters

| 항목 | 권장값 |
|------|--------|
| Model | SDXL 1.0 + Watercolor LoRA (0.7) + Choeun Character LoRA (0.8) |
| Resolution | 1920 x 1080 (16:9) |
| CFG Scale | 7.5 |
| Sampler | DPM++ 2M Karras |
| Steps | 35 |
| Seed | 캐릭터 일관성용 고정 seed (seed: 2001) |
| ControlNet | OpenPose (포즈 가이드) + IP-Adapter (얼굴 일관성) |
| IP-Adapter | weight 0.6, Choeun reference image |
| Clip Skip | 2 |

### 생성 가이드

- 미디엄 샷과 클로즈업 두 장 개별 생성 → Runway로 카메라 무브먼트 연결
- IP-Adapter로 초은이 얼굴 일관성 유지 (레퍼런스 이미지 필수)
- 표정 핵심: "눈이 반짝이는 호기심" — 동공에 하이라이트 두 점, 살짝 벌린 입
- 돋보기는 금속 테두리 + 유리 렌즈의 빛 반사 디테일 포함

---

## Sub-Scene 1-3: 물방울 클로즈업 (0:20~0:30)

<!-- 나뭇잎 위 물방울 매크로 샷. 물방울 안에 무지개빛 굴절 반사. 할아버지가 마이크로 렌즈 건넴. 현실→미시 세계 전환 직전의 결정적 순간 -->

### Positive Prompt

```
masterpiece, best quality, watercolor-to-macro transition style,
extreme close-up of a single perfect water drop sitting on a vibrant green leaf,
macro photography composition with watercolor artistic interpretation,
rainbow light refraction inside the water drop, prismatic spectrum visible within,
distorted garden landscape reflected and refracted through the spherical water surface,
crystal clear transparent water with internal caustics,
hyper-detailed water surface tension visible at contact point with leaf,
leaf vein texture visible beneath the drop, morning dew aesthetic,
tiny rainbow arcs inside the drop suggesting a hidden universe within,
soft bokeh background transitioning from warm watercolor garden to hints of prismatic blue,
golden sunlight catching the drop creating brilliant spectral highlights,
scientific accuracy in light refraction angles, convex lens effect of water drop
```

### Negative Prompt

```
photorealistic only, no artistic interpretation, flat water, opaque liquid,
no refraction, no rainbow, dull gray water,
dirty water, muddy, contaminated appearance,
text, watermark, signature, logo,
low quality, blurry center, pixelated, jpeg artifacts,
multiple water drops (single drop focus), splashing water,
dead leaf, brown dried plant, wilted vegetation,
artificial looking, plastic, CGI liquid simulation look,
incorrect refraction physics, inverted reflection
```

### Parameters

| 항목 | 권장값 |
|------|--------|
| Model | SDXL 1.0 + Watercolor LoRA (0.4, 점진적 감소) + Macro Detail LoRA (0.5) |
| Resolution | 1920 x 1080 (16:9) |
| CFG Scale | 8.0 |
| Sampler | DPM++ 2M Karras |
| Steps | 40 |
| Seed | seed: 3001 기준 |
| ControlNet | Depth (물방울 입체감) |
| Clip Skip | 2 |

### 생성 가이드

- 이 씬은 현실→미시 세계 전환의 브릿지 역할. 수채화 톤을 유지하되 물방울 내부에 프리즘 색감 힌트
- 물방울 내부 굴절은 과학적으로 정확해야 함: 볼록렌즈 효과로 배경이 상하 반전되어 보임 (실제 물방울 광학)
- 할아버지 손이 프레임 가장자리에서 마이크로 렌즈(안경형 장치)를 건네는 모습은 별도 레이어로 합성
- 줌인 애니메이션은 Runway Gen-3에서 처리 (이 이미지가 Scene 2 트랜지션의 시작점)
- 물방울 크기 대비 주변부 보케가 자연스럽게 수채화 질감으로 녹아야 함
