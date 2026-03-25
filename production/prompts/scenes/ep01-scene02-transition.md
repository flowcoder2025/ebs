# EP01 Scene 2: 미시 세계 진입 (0:30~0:45)

<!-- 현실 세계에서 미시 세계로의 전환. 수채화풍→초현실 프리즘으로 스타일 자체가 변화하는 결정적 시퀀스 -->

> **비주얼 레이어**: 현실→미시 전환 (스타일 트랜지션)
> **스타일 톤**: 수채화에서 초현실 프리즘으로 점진 전환
> **1화 색감**: 무지개 + 투명 블루 (본격 등장)
> **생성 도구**: Runway Gen-3 (img2video transition) + ComfyUI SDXL

---

## Sub-Scene 2-1: 마이크로 렌즈 전환 (0:30~0:40)

<!-- 초은이가 렌즈를 쓰는 순간 몸이 빛 입자로 분해되며 축소. 현실 수채화→프리즘 세계로 스타일 자체가 바뀌는 핵심 트랜지션 -->

### Positive Prompt

```
masterpiece, best quality, magical transformation sequence,
style morphing from soft watercolor to surreal prismatic digital art,
7-year-old girl putting on futuristic micro-lens goggles,
body dissolving into thousands of luminous light particles,
particle dispersion effect radiating outward from the lens,
rapid zoom-in through layers of reality, shrinking perspective,
watercolor brush strokes fragmenting into geometric light crystals,
warm earth tones transitioning to cool prismatic rainbow spectrum,
zooming into the water drop on leaf at impossible speed,
motion blur with streaking light trails,
kaleidoscopic tunnel effect as scale shifts from macro to micro,
light refraction increasing as perspective enters water drop boundary,
transparent blue and rainbow chromatic aberration at edges,
dynamic camera: rapid zoom-in with 180-degree spiral rotation,
sense of wonder and exhilaration, magical adventure beginning
```

### Negative Prompt

```
static image, no motion implied, boring composition,
horror transformation, body horror, painful expression, scary,
dark palette, gothic, gloomy,
text, watermark, signature, logo,
low quality, blurry, pixelated, jpeg artifacts,
realistic human anatomy during transformation (stylized particles preferred),
no color transition (must show style change),
flat 2D, no depth, no perspective shift,
slow gentle movement (this should feel rapid and exciting)
```

### Parameters

| 항목 | 권장값 |
|------|--------|
| Model | SDXL 1.0 (LoRA 없음 — 스타일 전환 중이므로 중립 베이스) |
| Resolution | 1920 x 1080 (16:9) |
| CFG Scale | 7.0 |
| Sampler | DPM++ 2M Karras |
| Steps | 35 |
| Seed | seed: 4001 기준 |
| ControlNet | None (자유로운 파티클 표현) |
| Clip Skip | 2 |
| 참고 | 키프레임 3장 생성: (A) 수채화 초은이, (B) 파티클 분해 중간, (C) 프리즘 세계 입구 |

### 생성 가이드

- 이 씬은 반드시 Runway Gen-3 img2video로 애니메이션 처리 (정적 이미지로는 표현 불가)
- 키프레임 3장을 ComfyUI로 생성한 뒤 Runway에서 보간:
  - 프레임 A (0:30): 수채화풍 초은이가 렌즈를 씀 (Scene 1 스타일 유지)
  - 프레임 B (0:35): 몸체가 빛 입자로 분해, 배경이 수채화→크리스탈로 변화 중
  - 프레임 C (0:40): 물방울 표면에 도달, 프리즘 색감이 화면 전체 지배
- 카메라: 급속 줌인 + 시계방향 180도 회전 (관객에게 현기증 아닌 경이감 전달)
- 빛 입자는 따뜻한 금색에서 시작 → 무지개 스펙트럼으로 변화 (현실→미시 시각적 전환)
- 사운드 싱크 포인트: 렌즈 장착 순간 "찰칵" + 주파수 상승음

---

## Sub-Scene 2-2: 물방울 내부 첫 시야 (0:40~0:45)

<!-- 미시 세계 첫 장면. 물방울 내부에서 360도 파노라마로 프리즘 세계를 처음 보여줌. 초현실 스타일 본격 시작 -->

### Positive Prompt

```
masterpiece, best quality, surreal microscopic universe art,
interior of a water drop seen from inside at molecular scale,
prismatic rainbow world with light refracting in all directions,
transparent spherical walls of water surface visible as curved horizon,
light spectrum bands flowing like aurora borealis inside the drop,
distorted outside world visible through the curved water surface — garden appears warped and magnified,
floating microscopic particles catching prismatic light,
water molecules represented as connected translucent blue spheres (H2O molecular structure),
crystalline light pillars and rainbow caustic patterns on every surface,
transparent blue base tone with rainbow spectrum overlays,
bioluminescent glow emanating from molecular structures,
360-degree panoramic interior view, camera slowly rotating to reveal the full space,
sense of vast universe inside a tiny drop, cathedral-like scale perception,
dreamy ethereal atmosphere, otherworldly beauty,
scientific accuracy: light refraction creating real spectrum (red outside, violet inside of rainbow arc),
surface tension visible as a shimmering membrane boundary
```

### Negative Prompt

```
realistic underwater scene, ocean, swimming pool, aquarium,
dark murky water, dirty water, cloudy liquid,
no rainbow, no prismatic effect, monochrome, desaturated,
text, watermark, signature, logo,
low quality, blurry, pixelated, jpeg artifacts,
cartoon bubble, soap bubble (this is scientific water drop interior),
flat 2D composition, no depth, no volumetric light,
scary alien world, horror, dark atmosphere,
fish, marine life, coral (this is microscopic scale, not ocean),
watercolor style (this scene is surreal prismatic style)
```

### Parameters

| 항목 | 권장값 |
|------|--------|
| Model | SDXL 1.0 + Prismatic/Crystal Style LoRA (weight 0.8) |
| Resolution | 1920 x 1080 (16:9) |
| CFG Scale | 8.0 |
| Sampler | DPM++ 2M Karras |
| Steps | 40 |
| Seed | seed: 5001 기준 (미시 세계 베이스 시드) |
| ControlNet | Depth (구형 내부 공간감) |
| Clip Skip | 2 |

### 생성 가이드

- 이 이미지가 미시 세계의 "첫인상"이므로 비주얼 임팩트 극대화 필수
- 360도 회전 파노라마: 파노라마 이미지 생성 후 Runway에서 카메라 패닝으로 구현
- 물방울 내부 광학 정확성:
  - 빛이 물방울 표면에서 굴절 → 내부에 무지개 스펙트럼 생성
  - 전반사(total internal reflection)로 일부 벽면은 거울처럼 반사
  - 바깥 세계는 볼록렌즈 효과로 왜곡 확대되어 보임
- 색감 전략: 투명 블루를 기본으로 무지개 스펙트럼이 오버레이
- 물 분자 시각화: H₂O 분자를 큰 파란 구(산소) + 작은 흰 구 2개(수소)로 표현, 서로 수소결합으로 연결
- 이 씬의 배경은 Scene 3, 4, 5-1에서도 기본 환경으로 재사용 (seed 고정 중요)
