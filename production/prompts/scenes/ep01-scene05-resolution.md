# EP01 Scene 5: 결말 (2:15~2:45)

<!-- 미시 세계 마무리 + 현실 복귀. 보석빛 물방울의 클라이맥스 비주얼과 수채화풍 현실 세계로의 귀환 -->

> **비주얼 레이어**: 미시 세계(5-1) → 현실 세계(5-2)
> **스타일 톤**: 초현실 프리즘 감동 절정(5-1) → 따뜻한 수채화 복귀(5-2)
> **1화 색감**: 무지개 + 투명 블루 → 따뜻한 골든아워
> **생성 도구**: Runway (cinematic lighting) + ComfyUI SDXL (watercolor style)

---

## Sub-Scene 5-1: 보석빛 물방울 (2:15~2:30)

<!-- 햇빛이 비치며 물방울 전체가 보석처럼 빛남. 뭉이에게 인사하는 이별의 순간. 미시 세계 비주얼 최고조 -->

### Positive Prompt

```
masterpiece, best quality, surreal microscopic universe art, breathtaking cinematic moment,
interior of water drop flooded with brilliant sunlight entering from above,
entire prismatic world transformed into a jewel-like radiance,
water drop glowing like a precious gemstone from inside — diamond-like brilliance,
rainbow light refractions reaching maximum intensity, full visible spectrum in every direction,
crystalline structures blazing with captured sunlight, prismatic fire dancing on every surface,
light caustics creating intricate mandala-like patterns on the water walls,
tiny girl (Choeun) waving goodbye to tardigrade (Moongi), bittersweet emotional moment,
Choeun with a warm grateful smile, hand raised in farewell wave,
Moongi looking up at Choeun with big glistening eyes, a single tiny prismatic tear,
slow 360-degree camera rotation revealing the full majestic interior,
then gradual zoom-out pulling away from the scene,
warm emotional golden-rainbow lighting suffusing every element,
water molecules in the background gently pulsing with harmonious bioluminescent glow,
sense of profound beauty in the microscopic world, awe and gentle sadness of parting,
scientific accuracy: sunlight contains all visible wavelengths — when entering the spherical water drop,
each wavelength refracts at a different angle creating full spectrum dispersion (same physics as real rainbows)
```

### Negative Prompt

```
dark gloomy farewell, tragic separation, crying in despair,
horror, scary, nightmarish atmosphere,
dull flat lighting, no spectral brilliance,
text, watermark, signature, logo, UI elements,
low quality, blurry, pixelated, jpeg artifacts, noise,
watercolor style (still surreal prismatic world in this sub-scene),
flat 2D, no volumetric god rays, no light caustics,
monochrome, desaturated, muted colors (this should be the most colorful scene),
static camera (must imply 360-degree rotation),
characters ignoring each other (must show emotional farewell),
empty minimalist space (should be richly detailed prismatic environment),
incorrect light physics — rainbow should show proper spectral order (ROYGBIV)
```

### Parameters

| 항목 | 권장값 |
|------|--------|
| Model | SDXL 1.0 + Prismatic/Crystal Style LoRA (0.9, 최고 강도) + Cinematic Light LoRA (0.6) |
| Resolution | 1920 x 1080 (16:9) |
| CFG Scale | 8.5 |
| Sampler | DPM++ 2M Karras |
| Steps | 45 |
| Seed | seed: 5701 기준 (미시 세계 시드 계열) |
| ControlNet | Depth (공간감 극대화) |
| IP-Adapter | weight 0.6 (캐릭터 감정 표현 중요) |
| Clip Skip | 2 |

### 생성 가이드

- 이 씬은 미시 세계 비주얼의 최고조 — 가장 아름다운 장면이어야 함
- 슬로우 360도 회전 → 줌아웃: 파노라마 이미지 생성 후 Runway cinematic lighting으로 카메라 워크 구현
- 빛 연출:
  - 위에서 들어오는 햇빛이 물방울 내부에서 산란, 굴절되며 모든 방향으로 무지개빛 발산
  - 물방울이 보석(다이아몬드/오팔)처럼 내부에서 빛나는 느낌
  - 물벽 표면에 만다라 패턴의 코스틱(빛 무늬) 투영
- 이별 연출:
  - 초은이: 따뜻한 미소로 손을 흔드는 모습. 그리움과 감사가 섞인 표정
  - 뭉이: 큰 눈에 프리즘 빛깔 눈물 한 방울. 아쉬워하면서도 다정한 표정
  - 두 캐릭터 사이의 거리가 점점 벌어지는 구도 (줌아웃과 함께)
- 키프레임 3장:
  - (A) 햇빛이 물방울로 쏟아지며 세계가 빛나기 시작
  - (B) 초은이와 뭉이가 서로를 바라보며 인사 (감정 절정)
  - (C) 줌아웃 — 찬란한 물방울 전경, 초은이 실루엣이 빛 속으로 사라져감
- 과학 포인트: 햇빛(백색광)이 물방울에 들어갈 때 각 파장별 굴절률 차이로 전체 스펙트럼이 분산 — 실제 무지개의 원리와 동일

---

## Sub-Scene 5-2: 현실 복귀 (2:30~2:45)

<!-- 초은이가 미시 세계에서 빠져나와 현실 정원으로 돌아옴. 수채화풍으로 스타일 복귀. "할아버지, 물방울 속에 우주가 있었어!" -->

### Positive Prompt

```
masterpiece, best quality, watercolor animation style, hand-painted texture, soft brush strokes,
7-year-old Korean girl Choeun back in the garden, returning from microscopic adventure,
excited joyful expression, eyes sparkling with wonder from what she just witnessed,
short black hair with yellow hairband slightly disheveled from adventure,
white t-shirt with rainbow embroidery, blue overalls,
holding magnifying glass in one hand, other hand gesturing excitedly,
mouth open mid-speech telling grandfather about the adventure,
warm late afternoon golden sunlight bathing the garden,
cozy garden background with trees, flowers, and glistening wet leaves,
medium shot framing Choeun from waist up, transitioning to close-up of her beaming face,
watercolor skin tones with rosy cheeks flushed from excitement,
soft bokeh garden background with warm color palette,
a single water drop still visible on a nearby leaf, catching a tiny rainbow glint,
children's animation character art, Studio Ghibli-inspired warm atmosphere,
sense of accomplishment and wonder, return to safety and warmth of home
```

### Negative Prompt

```
photorealistic, 3D render, CGI, plastic skin texture,
surreal prismatic style (this scene is WATERCOLOR style — back to reality),
dark mood, sad expression, crying, traumatized look,
adult proportions, mature face, makeup,
text, watermark, signature, logo, UI elements,
low quality, blurry, pixelated, jpeg artifacts, noise,
oversaturated neon colors, harsh shadows, cold lighting,
deformed face, extra fingers, mutated hands, bad anatomy,
indoor scene, urban setting, night time,
calm quiet expression (she should be excited and animated),
dirty clothes, torn outfit, injury,
microscopic world elements in background (fully returned to reality)
```

### Parameters

| 항목 | 권장값 |
|------|--------|
| Model | SDXL 1.0 + Watercolor Style LoRA (0.7) + Choeun Character LoRA (0.8) |
| Resolution | 1920 x 1080 (16:9) |
| CFG Scale | 7.5 |
| Sampler | DPM++ 2M Karras |
| Steps | 35 |
| Seed | seed: 2001 기준 (Scene 1 현실 세계 시드 계열로 복귀) |
| ControlNet | OpenPose (포즈 가이드) + IP-Adapter (얼굴 일관성) |
| IP-Adapter | weight 0.6, Choeun reference image |
| Clip Skip | 2 |

### 생성 가이드

- 스타일 복귀: Scene 1과 동일한 수채화풍으로 완전 복귀. 미시 세계의 프리즘 스타일은 완전히 사라짐
- 시드 계열: Scene 1의 현실 세계 시드(2001 계열)로 돌아가 환경 일관성 유지
- 초은이 표정 핵심: "할아버지, 물방울 속에 우주가 있었어!" 대사에 맞는 흥분된 표정
  - 눈: 별빛 하이라이트가 평소보다 더 밝게 — 미시 세계 경험의 여운
  - 입: 활짝 열고 이야기하는 중
  - 볼: 신나서 상기된 홍조
- 물방울 힌트: 배경의 나뭇잎 위에 아직 물방울이 하나 남아있고, 햇빛에 작은 무지개가 비침 (미시 세계가 실재했음을 암시)
- 미디엄 샷 → 클로즈업 전환은 두 장의 이미지를 생성 후 Runway img2video로 카메라 무브먼트 연결
- 색온도: Scene 1과 동일한 따뜻한 골든아워 톤 (색 일관성)
- 할아버지는 이 씬에서 목소리만 등장 (프레임 밖). 별도 이미지 불필요
