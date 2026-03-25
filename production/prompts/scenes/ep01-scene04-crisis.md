# EP01 Scene 4: 위기와 해결 (1:30~2:15)

<!-- 미시 세계 위기. 물방울이 흔들리고, 할아버지의 조언으로 표면장력을 이용해 위기를 해결하는 클라이맥스 -->

> **비주얼 레이어**: 미시 세계
> **스타일 톤**: 초현실 프리즘 — 불안정→긴장→안정 회복의 감정 곡선
> **1화 색감**: 무지개 + 투명 블루 (위기 시 색감 불안정화 → 해결 후 복원)
> **생성 도구**: ComfyUI SDXL + Runway (motion effects)

---

## Sub-Scene 4-1: 물방울 흔들림 (1:30~1:50)

<!-- 바람이 불어 물방울이 나뭇잎에서 떨어지려 함. 프리즘 세계가 왜곡되며 진동하고 물벽이 출렁이는 긴장 장면 -->

### Positive Prompt

```
masterpiece, best quality, surreal microscopic universe art, dramatic tension scene,
prismatic world inside water drop violently shaking and distorting,
transparent water walls trembling and bulging dangerously,
light spectrum becoming unstable — rainbow bands fragmenting and flickering,
prismatic colors stretching and warping as the spherical drop deforms,
the water drop being pushed by external wind force — visible as massive pressure waves on the walls,
tiny girl (Choeun) and tardigrade (Moongi) struggling to maintain balance,
Choeun bracing herself with wide stance, alarmed expression, wind-blown hair,
Moongi gripping the molecular surface with all 8 legs, worried round eyes,
water molecules on the surface breaking some bonds — gaps forming in the molecular chain,
handheld camera shake effect, rapid zoom-out revealing the drop's unstable shape,
color grading shift: warm prismatic tones cooling to anxious blue-violet,
crystalline structures cracking and fracturing under stress,
light pillars tilting and flickering like a building in earthquake,
sense of imminent danger — the entire microscopic universe could collapse,
scientific accuracy: wind creates pressure differential on water drop surface causing deformation,
surface tension fighting against gravity and wind to maintain spherical shape
```

### Negative Prompt

```
calm peaceful scene, serene atmosphere, relaxed characters,
stable geometry, perfectly spherical water drop,
warm happy lighting, golden hour,
text, watermark, signature, logo, UI elements,
low quality, blurry, pixelated, jpeg artifacts, noise,
watercolor style (surreal prismatic world),
flat 2D, no depth, no volumetric distortion,
explosion, fire, lava (natural water physics only),
horror gore, blood, graphic violence,
characters smiling or relaxed (they should be alarmed),
ocean storm, hurricane (this is micro-scale wind effect),
monochrome, completely desaturated (colors should be unstable but present)
```

### Parameters

| 항목 | 권장값 |
|------|--------|
| Model | SDXL 1.0 + Prismatic/Crystal Style LoRA (0.6, 불안정 효과를 위해 낮춤) |
| Resolution | 1920 x 1080 (16:9) |
| CFG Scale | 6.5 (약간의 카오스를 위해 낮은 CFG) |
| Sampler | DPM++ 2M Karras |
| Steps | 35 |
| Seed | seed: 5401 기준 |
| ControlNet | None (불안정한 자유로운 왜곡 표현) |
| Clip Skip | 2 |

### 생성 가이드

- 핸드헬드 흔들림: Runway motion effects로 카메라 쉐이크 적용. 급속 줌아웃으로 물방울 전체가 변형되는 모습 노출
- 색감 변화 전략:
  - 안정 상태: 밝은 무지개 + 투명 블루
  - 위기 상태: 색감이 불안정하게 깜빡이며, 따뜻한 톤이 차가운 블루-바이올렛으로 이동
  - 색수차(chromatic aberration) 효과로 불안감 표현
- 물방울 변형: 구형에서 찌그러진 타원형으로 변형. 한쪽 벽이 위험하게 늘어남
- 물 분자 체인 파손: 표면의 물 분자 손잡기 체인에서 일부 결합이 끊어지는 모습 (위기 시각화)
- 키프레임 3장: (A) 첫 흔들림 감지, (B) 최대 변형 — 물방울이 나뭇잎에서 거의 떨어질 뻔, (C) 긴장 속 균형 유지
- 사운드 싱크 포인트: 진동음 + 긴장 음악 시작

---

## Sub-Scene 4-2: 할아버지 무전 (1:50~2:00)

<!-- 할아버지 목소리 "표면장력을 이용해!" — 무전기에서 목소리가 빛의 파동으로 시각화. 할아버지 얼굴이 물방울 표면에 비침 -->

### Positive Prompt

```
masterpiece, best quality, surreal microscopic universe art,
radio communication visualized inside microscopic prismatic world,
sound waves transforming into beautiful rippling light waves,
concentric rings of warm golden light expanding outward from a small radio device,
grandfather's kind elderly face reflected and refracted on the curved water drop surface,
the reflection warped by the spherical water surface — warm wise expression distorted into prismatic fragments,
warm guiding light cutting through the anxious blue-violet atmosphere,
the golden sound-light waves bringing warmth back to the cooling prismatic world,
tiny girl (Choeun) holding a small communication device, looking up with hope,
Moongi beside her looking at the light waves with curious wide eyes,
close-up composition: radio device in foreground, light wave ripples expanding to mid-ground,
grandfather's face visible on the water wall surface in background,
color transition: anxious blue-violet beginning to warm with grandfather's golden light,
scientific accuracy: sound travels as compression waves — visualized as alternating bright and dim rings of light,
radio waves are electromagnetic radiation — shown as oscillating light wave patterns
```

### Negative Prompt

```
realistic radio, modern smartphone, technology device,
dark scary voice, villain communication,
grandfather looking angry or stern (must be warm and kind),
text, watermark, signature, logo, UI elements,
low quality, blurry, pixelated, jpeg artifacts, noise,
watercolor style (still in surreal prismatic world),
flat 2D, no wave propagation effect,
no light ripples, static image,
realistic elderly man photograph (stylized prismatic reflection),
monochrome, completely desaturated,
horror atmosphere, dark spirits, ghostly face,
silent scene with no implied sound visualization
```

### Parameters

| 항목 | 권장값 |
|------|--------|
| Model | SDXL 1.0 + Prismatic/Crystal Style LoRA (0.7) |
| Resolution | 1920 x 1080 (16:9) |
| CFG Scale | 7.5 |
| Sampler | DPM++ 2M Karras |
| Steps | 35 |
| Seed | seed: 5501 기준 |
| ControlNet | Depth (파동 원근감) |
| Clip Skip | 2 |

### 생성 가이드

- 음파→빛 파동 변환: 무전기에서 나오는 할아버지 목소리가 미시 세계에서는 빛의 동심원 파동으로 시각화
- 할아버지 얼굴 반사: 물방울 표면(내부에서 본)에 할아버지 얼굴이 어렴풋이 비침. 볼록렌즈 왜곡 적용
- 감정 전환 핵심: 이 씬에서 불안(블루-바이올렛) → 희망(골든 웜톤)으로 색감이 서서히 변화 시작
- 할아버지 대사 "표면장력을 이용해!" — 이 대사가 다음 서브씬의 액션을 유도
- 빛 파동의 색: 할아버지의 따뜻한 성격을 반영해 금색-주황색 계열의 따뜻한 빛
- 키프레임 2장: (A) 무전기에서 빛 파동이 퍼지기 시작, (B) 할아버지 얼굴이 물벽에 나타남
- 초은이 표정: 불안에서 희망으로 변하는 과도기 — 눈에 결의가 차오르는 모습

---

## Sub-Scene 4-3: 협력 해결 (2:00~2:15)

<!-- 초은이와 뭉이가 물 분자들의 결합력을 이용해 물방울 안정시킴. 분자들이 더 단단히 손잡고, 프리즘 세계가 복원됨 -->

### Positive Prompt

```
masterpiece, best quality, surreal microscopic universe art, triumphant resolution scene,
tiny girl (Choeun) and tardigrade (Moongi) actively helping water molecules strengthen their bonds,
Choeun pushing water molecule characters together with both hands, determined encouraging expression,
Moongi using all 8 legs to bridge gaps in the molecular chain along the surface,
water molecules personified as small round blue figures now gripping each other tightly,
molecular chains tightening and multiplying along the water drop surface,
hydrogen bonds visualized as brilliant glowing blue-white energy threads strengthening between molecules,
the water drop gradually restoring to a perfect stable sphere shape,
prismatic world calming down — light spectrum stabilizing back to harmonious rainbow,
fractured crystalline structures reforming and healing,
color grading transitioning from anxious blue-violet back to warm prismatic rainbow + transparent blue,
warm golden light flooding back into the world as stability returns,
wide camera angle showing the entire water drop interior stabilizing,
triumphant teamwork moment — Choeun and Moongi high-five (hand to stubby leg),
glowing restoration effect: ripple of healing light spreading from where bonds are strengthened,
scientific accuracy: surface tension is restored when molecular cohesive forces strengthen,
water molecules form hydrogen bonds — each molecule can bond with up to 4 neighbors,
stronger intermolecular forces create more stable surface tension membrane
```

### Negative Prompt

```
still in crisis, continued danger, unstable world,
dark atmosphere, anxiety, fear, sad ending,
characters giving up, defeated expressions,
text, watermark, signature, logo, UI elements,
low quality, blurry, pixelated, jpeg artifacts, noise,
watercolor style (surreal prismatic world until Scene 5-2),
flat 2D, no depth, no healing/restoration effect,
monochrome, desaturated,
magic wand solution, unrealistic instant fix (should show gradual effort),
solo character only (both must work together),
explosion or destruction effect,
incorrect molecular bonding (H2O forms up to 4 hydrogen bonds)
```

### Parameters

| 항목 | 권장값 |
|------|--------|
| Model | SDXL 1.0 + Prismatic/Crystal Style LoRA (0.8, 안정 복원) |
| Resolution | 1920 x 1080 (16:9) |
| CFG Scale | 7.5 |
| Sampler | DPM++ 2M Karras |
| Steps | 40 |
| Seed | seed: 5601 기준 |
| ControlNet | OpenPose (협력 포즈 가이드) |
| IP-Adapter | weight 0.5 |
| Clip Skip | 2 |

### 생성 가이드

- 해결 과정은 점진적이어야 함 (마법처럼 한순간에 해결되지 않음):
  1. 초은이와 뭉이가 분자 체인의 끊어진 부분으로 달려감
  2. 물 분자들을 물리적으로 가까이 밀어서 결합을 돕는 모습
  3. 결합이 강화되며 물방울 표면이 서서히 안정화
  4. 최종적으로 완전한 구형 복원 + 프리즘 빛 안정
- 색감 복원: 블루-바이올렛(위기) → 따뜻한 무지개 + 투명 블루(안정) 점진 전환
- 키프레임 3장:
  - (A) 초은이와 뭉이가 분자 틈으로 달려감 (결의에 찬 표정)
  - (B) 분자들을 밀어 결합시키는 중간 과정 (노력하는 모습)
  - (C) 복원 완료 — 안정된 프리즘 세계, 서로를 바라보며 미소
- 교육 포인트: "물 분자들이 서로 강하게 잡아당기면(수소결합) 표면장력이 강해져서 물방울이 안정된다"
- 하이파이브 순간: 초은이 작은 손과 뭉이의 뭉툭한 앞다리가 맞닿는 귀여운 장면 (마지막 키프레임)
