# EP01 Scene 6: 다음 화 예고 (2:45~3:00)

<!-- 현실 세계. 초은이가 정원의 장미꽃을 바라보며 다음 모험을 암시하는 마무리 티저 -->

> **비주얼 레이어**: 현실 세계 → 미시 세계 힌트 (마지막 1-2초)
> **스타일 톤**: 수채화풍 따뜻한 톤 + 마지막에 초현실 미시 힌트
> **1화 색감**: 따뜻한 골든아워 → 장미빛 레드/핑크 (2화 색감 프리뷰)
> **생성 도구**: ComfyUI SDXL (watercolor style LoRA) + Runway (zoom transition)

---

## Sub-Scene 6-1: 꽃을 바라보며 (2:45~3:00)

<!-- 초은이가 돋보기를 들고 정원의 장미꽃을 바라봄. 카메라가 장미꽃으로 이동 후 꽃잎 매크로 줌으로 끝. 다음 화 모험 암시 -->

### Positive Prompt (A: 초은이와 장미꽃)

```
masterpiece, best quality, watercolor animation style, hand-painted texture, soft brush strokes,
7-year-old Korean girl Choeun in garden, gazing at a beautiful rose bush with curiosity,
short bobbed black hair with a single tiny braid on the right side tied with a sky-blue bead, round face with large expressive dark brown eyes,
wearing a pastel mint field-explorer vest over a cream-colored long-sleeve shirt, khaki cargo shorts with oversized pockets,
mismatched socks and worn brown lace-up boots, a brass magnifying glass hanging from a leather cord around her neck,
holding the brass magnifying glass up toward a blooming red rose, tilting head with wonder,
mischievous excited smile, eyes already imagining the next microscopic adventure,
warm late afternoon golden sunlight, garden bathed in amber glow,
vibrant red and pink roses in foreground, lush green garden background,
soft watercolor rendering of rose petals with visible dew drops,
medium shot of Choeun, rose bush occupying right third of frame,
depth of field: Choeun in focus, garden background in soft watercolor bokeh,
children's animation, Studio Ghibli-inspired warm ending moment,
sense of curiosity never satisfied, promise of more adventures to come
```

### Negative Prompt (A)

```
photorealistic, 3D render, CGI, plastic texture,
surreal prismatic style (watercolor world),
dark mood, night scene, cold lighting,
wilted roses, dead flowers, thorns prominent,
adult proportions, mature face,
text, watermark, signature, logo, UI elements,
low quality, blurry, pixelated, jpeg artifacts, noise,
oversaturated, harsh shadows,
deformed face, extra fingers, bad anatomy,
sad expression, bored look, disinterested pose,
indoor scene, urban, artificial flowers
```

### Parameters (A)

| 항목 | 권장값 |
|------|--------|
| Model | SDXL 1.0 + Watercolor Style LoRA (0.7) + Choeun Character LoRA (0.8) |
| Resolution | 1920 x 1080 (16:9) |
| CFG Scale | 7.5 |
| Sampler | DPM++ 2M Karras |
| Steps | 35 |
| Seed | seed: 2601 기준 (현실 세계 시드 계열) |
| ControlNet | OpenPose (초은이 포즈) + IP-Adapter (얼굴 일관성) |
| IP-Adapter | weight 0.6, Choeun reference image |
| Clip Skip | 2 |

---

### Positive Prompt (B: 장미꽃 매크로 줌 — 미시 세계 힌트)

```
masterpiece, best quality, watercolor-to-macro transition style,
extreme close-up of a red rose petal, zooming into microscopic surface structure,
macro photography composition with watercolor artistic base gradually shifting,
visible petal surface texture: tiny cellular patterns, microscopic ridges and grooves,
surface cells arranged in cone-shaped papillae creating velvet-like texture,
hint of surreal prismatic light beginning to emerge from the cellular structures,
a faint glow of otherworldly iridescence between the cells suggesting hidden microscopic universe,
soft transition from warm watercolor rendering to sharper macro detail,
rose petal color: deep crimson red with pink gradients at edges,
tiny water droplets on petal surface catching prismatic rainbow glints,
the very last frame hints at a vast microscopic world within the flower,
camera movement: starting from medium shot of rose, zooming deeper into petal surface,
color grading shifting from warm garden tones toward mysterious rose-red and magenta micro world,
sense of invitation to the next adventure, cliffhanger ending,
scientific accuracy: rose petal surface has conical epidermal cells (papillae) that create velvet appearance,
these cells scatter light creating the characteristic shimmer of rose petals
```

### Negative Prompt (B)

```
flat smooth petal surface (must show microscopic texture),
no zoom effect, no transition implied, static composition,
completely surreal prismatic (only subtle hint at the end),
dead wilted brown petal, dried flower, autumn decay,
text, watermark, signature, logo, UI elements,
low quality, blurry, pixelated, jpeg artifacts, noise,
artificial plastic flower, silk flower texture,
no cellular structure visible (must show microscopic detail),
fully realistic photograph only (maintain some watercolor artistic quality),
black background, dark void, scary microscopic view,
completely watercolor only (must transition toward macro realism at the end),
incorrect cell structure (rose petal cells are conical papillae)
```

### Parameters (B)

| 항목 | 권장값 |
|------|--------|
| Model | SDXL 1.0 + Watercolor LoRA (0.4, 점진적 감소) + Macro Detail LoRA (0.5) |
| Resolution | 1920 x 1080 (16:9) |
| CFG Scale | 8.0 |
| Sampler | DPM++ 2M Karras |
| Steps | 40 |
| Seed | seed: 3601 기준 (Scene 1-3 매크로 줌 시드와 유사 계열) |
| ControlNet | Depth (꽃잎 입체감) |
| Clip Skip | 2 |

---

### 생성 가이드

- 이 씬은 15초의 짧은 아웃트로 겸 다음 화 티저. 두 파트로 구성:
  - 파트 A (2:45~2:53): 초은이가 장미꽃을 바라보는 수채화풍 씬
  - 파트 B (2:53~3:00): 장미꽃 → 꽃잎 매크로 줌, 미시 세계 힌트로 마무리
- 줌 트랜지션: Runway Gen-3 img2video zoom transition으로 초은이 → 장미꽃 → 꽃잎 매크로로 자연스럽게 줌인
- Scene 1-3(물방울 매크로 줌)과 대구법 구성:
  - Scene 1-3: 물방울 매크로 → "물방울 속 우주" 진입
  - Scene 6-1B: 장미꽃 매크로 → "꽃잎 속 우주" 암시 (2화 예고)
- 스타일 전환 전략:
  - 파트 A: 완전한 수채화풍 (Scene 1과 동일)
  - 파트 B 전반: 수채화에서 매크로 사진 느낌으로 서서히 전환
  - 파트 B 마지막 1-2초: 미시 세계의 프리즘 빛이 세포 구조 사이에서 살짝 빛남 (힌트만)
- 장미꽃잎 과학:
  - 꽃잎 표면의 원뿔형 유두세포(papillae)가 벨벳 질감을 만듦
  - 이 세포 구조가 빛을 산란시켜 장미 특유의 색감과 광택 생성
  - 2화 "꽃잎의 비밀"에서 이 미세구조를 본격 탐험 예정
- 사운드 싱크 포인트: 마지막 줌인 순간 "다음에 또 만나" 내레이션 + 미시 세계 전조 사운드
- 엔딩 자막/타이틀카드는 후반 편집에서 오버레이 처리 (이미지에 포함하지 않음)
