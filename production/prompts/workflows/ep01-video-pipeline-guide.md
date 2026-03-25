# EP01 영상 파이프라인 가이드 — ComfyUI → Runway/Kling

> 본 문서는 Phase 3 (WI-008~012) 배경 영상 생성을 위한 실행 가이드입니다.
> ComfyUI로 생성한 정적 배경 이미지를 Runway Gen-3 Alpha / Kling AI img2video로 변환하는 전체 파이프라인을 다룹니다.

---

## 전체 흐름

```
[ComfyUI 배경 이미지 생성]
        |
        v
[이미지 품질 검수 + 선별]
        |
        v
[Runway/Kling img2video 입력]
        |
        v
[클립 검수 + 재생성]
        |
        v
[편집 타임라인 배치]
```

---

## Step 1: ComfyUI 배경 이미지 생성

### 워크플로우 파일 목록

| WI | 씬 | 워크플로우 파일 | 출력 이미지 수 |
|----|-----|---------------|-------------|
| WI-007 | 컨셉아트 | `comfyui-conceptart-ep01.json` | 2종 |
| WI-008 | Scene 1 | `comfyui-ep01-scene01.json` | 3종 |
| WI-009 | Scene 2 | `comfyui-ep01-scene02.json` | 5종 |
| WI-010 | Scene 3 | `comfyui-ep01-scene03.json` | 5종 |
| WI-011 | Scene 4 | `comfyui-ep01-scene04.json` | 7종 |
| WI-012 | Scene 5 | `comfyui-ep01-scene05.json` | 4종 |
| WI-012 | Scene 6 | `comfyui-ep01-scene06.json` | 2종 |
| **합계** | | | **28종** |

### 생성 순서 (권장)

1. **Scene 1 (현실세계 기준)**: 정원 배경 + 초은이 미디엄 → 현실 세계 톤 확립
2. **Scene 2-2 (미시세계 기준)**: 물방울 내부 파노라마 → 미시 세계 톤 확립
3. **Scene 3**: 미시 세계 본편 5종
4. **Scene 4**: 위기→해결 7종 (감정 곡선에 따른 색감 변화 확인)
5. **Scene 5-1**: 미시 세계 최고조 2종
6. **Scene 2-1**: 전환 키프레임 3종 (양쪽 톤 확립 후 전환 중간 생성)
7. **Scene 1-3**: 물방울 매크로 (Scene 2 연결 브릿지)
8. **Scene 5-2 + Scene 6**: 현실 복귀 + 티저

### 생성 팁

- 씬별로 seed를 고정하고 variation 0.1~0.3으로 배리에이션 생성
- 같은 세계관(현실/미시) 내에서 연속 씬은 seed 계열을 유지하여 톤 일관성 확보
- 각 워크플로우의 `_meta.source_prompts`에 표기된 프롬프트 MD와 파라미터 대조 확인
- 1920x1080 (16:9) 해상도로 통일 — 영상 프레임 기준

### 결과물 저장 위치

```
production/episodes/ep01-water-drop/concept-art/
  concept01-garden-watercolor.png
  concept02-prism-world-surreal.png

production/episodes/ep01-water-drop/backgrounds/
  bg-s01-01-garden-wide.png
  bg-s01-02-choeun-medium.png
  bg-s01-03-waterdrop-macro.png
  bg-s02-01a-transition-watercolor.png
  bg-s02-01b-transition-particle.png
  bg-s02-01c-transition-prism.png
  bg-s02-02a-interior-panorama.png
  bg-s02-02b-interior-panorama.png
  bg-s03-01a-mungyi-lowangle.png
  bg-s03-01b-mungyi-frontal.png
  bg-s03-02-exploration-tracking.png
  bg-s03-03a-surfing-start.png
  bg-s03-03b-surfing-action.png
  bg-s04-01a-crisis-start.png
  bg-s04-01b-crisis-peak.png
  bg-s04-01c-crisis-hold.png
  bg-s04-02a-radio-light.png
  bg-s04-02b-grandpa-reflect.png
  bg-s04-03a-repair-rush.png
  bg-s04-03b-repair-restore.png
  bg-s05-01a-jewel-farewell.png
  bg-s05-01b-jewel-zoomout.png
  bg-s05-02a-return-medium.png
  bg-s05-02b-return-closeup.png
  bg-s06-01a-rose-garden.png
  bg-s06-01b-rose-macro.png
```

---

## Step 2: 이미지 품질 검수

### 필수 검수 항목

| 항목 | 기준 |
|------|------|
| 해상도 | 1920x1080 (16:9) |
| 스타일 일관성 | 현실: 수채화풍 / 미시: 프리즘 초현실 |
| 캐릭터 정확성 | 초은이 의상/소품, 뭉이 다리 8개, 할아버지 표정 |
| 색감 톤 | 현실: 따뜻한 골든아워 / 미시: 투명 블루 + 무지개 |
| 과학적 정확성 | H2O 분자 구조, 빛 굴절 스펙트럼 순서 |
| 연속성 | 키프레임 간 구도/색감 자연스러운 연결 |

### 키프레임 연결 확인

키프레임 기반 씬(2-1, 4-1, 4-3)은 시작/끝 이미지의 **구도 연결성** 필수 확인:
- 키프레임 A→B→C 순서로 나열했을 때 자연스러운 전환 가능한지
- 주요 피사체의 화면 내 위치가 급격히 변하지 않는지
- 색감 변화가 점진적인지

---

## Step 3: Runway/Kling img2video 변환

### 입력 유형별 설정

| 유형 | Runway 입력 | 모션 양 | 대표 씬 |
|------|-----------|---------|---------|
| 단일 이미지 → 카메라 무브 | Image (1장) | Low~Medium | 1-1, 1-2, 2-2, 3-2, 5-2 |
| 키프레임 보간 | First/Last Frame (2장) | Medium~High | 2-1, 3-3, 4-1, 4-3, 6-1 |
| 단일 이미지 → 캐릭터 모션 | Image (1장) | Medium | 3-1, 4-2, 5-1 |

### 씬별 Runway/Kling 설정 요약

프롬프트 원문은 `ep01-runway-prompts.md`를 참조하세요.

| 클립 ID | 서브씬 | 입력 이미지 | Duration | Motion | 핵심 모션 |
|---------|--------|-----------|----------|--------|----------|
| RW-0100 | 1-1 정원 전경 | bg-s01-01 | 10s | Low | 줌인 + 나뭇잎 흔들림 |
| RW-0102 | 1-2 초은이 등장 | bg-s01-02 | 10s | Low-Med | 돋보기 올리기 + 줌인 |
| RW-0103 | 1-3 물방울 매크로 | bg-s01-03 | 10s | Medium | 줌인 + 프리즘 변화 |
| RW-0201 | 2-1 렌즈 전환 | bg-s02-01a→01c | 10s | High | 180도 스파이럴 줌 |
| RW-0202 | 2-2 내부 첫 시야 | bg-s02-02a→02b | 5s | Low-Med | 360도 패닝 |
| RW-0301 | 3-1 뭉이 등장 | bg-s03-01a→01b | 10s+5s | Medium | 앵글 전환 + 눈 깜빡임 |
| RW-0302 | 3-2 프리즘 탐험 | bg-s03-02 | 10s+5s | Medium | 횡이동 트래킹 |
| RW-0303 | 3-3 서핑 | bg-s03-03a→03b | 10s+5s | High | 서핑 이동 + 리플 |
| RW-0401 | 4-1 위기 진동 | bg-s04-01a→01b | 10s+10s | High | 진동 + 색감 불안정 |
| RW-0402 | 4-2 할아버지 무전 | bg-s04-02a→02b | 10s | Medium | 빛 파동 + 얼굴 출현 |
| RW-0403 | 4-3 협력 해결 | bg-s04-03a→03b | 10s+5s | Med-High | 복원 + 하이파이브 |
| RW-0501 | 5-1 보석빛 이별 | bg-s05-01a→01b | 10s+5s | Low-Med | 360도 회전 + 줌아웃 |
| RW-0502 | 5-2 현실 복귀 | bg-s05-02a→02b | 10s+5s | Low-Med | 줌인 + 제스처 |
| RW-0601 | 6-1 장미 티저 | bg-s06-01a→01b | 10s+5s | Medium | 포커스 전환 + 매크로 줌 |

### Runway Gen-3 Alpha 권장 설정

| 항목 | 권장값 |
|------|--------|
| Duration | 4s (기본) / 10s (확장) |
| Resolution | 1920 x 1080 (16:9) |
| Motion Amount | 씬별 상이 (표 참조) |
| Style Preset | None (소스 이미지 스타일 유지) |
| Seed | 각 씬별 고정 시드 (재현성 확보) |

### Kling AI 권장 설정

| 항목 | 권장값 |
|------|--------|
| Mode | Professional |
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

## Step 4: 클립 품질 검수

### 검수 체크리스트

| 항목 | 기준 |
|------|------|
| 모션 자연스러움 | 카메라 무브먼트가 부드러운지, 급작스러운 점프 없는지 |
| 스타일 유지 | 원본 이미지의 수채화/프리즘 스타일이 영상에서도 유지되는지 |
| 캐릭터 변형 | 인물/캐릭터가 모션 중 왜곡되지 않는지 |
| 색감 일관성 | 원본 이미지 색감이 영상 전체에서 유지되는지 |
| 키프레임 보간 | 시작→끝 이미지 사이 전환이 자연스러운지 |

### 재생성 기준

- 캐릭터 얼굴/몸체 변형 발생 → seed 변경 후 재생성
- 스타일이 사실적으로 변하는 구간 → Motion Amount 낮추기
- 모션이 너무 적어 정지 느낌 → Motion Amount 한 단계 올리기
- 색수차/밴딩 발생 → Duration을 짧게(4~5s)하고 여러 클립 연결

---

## Step 5: 편집 타임라인 배치

### 클립 연결 순서

`ep01-runway-prompts.md`의 "클립 편집 가이드" 섹션 참조.

| 순서 | 클립 ID | 씬 | 길이 | 전환 |
|------|---------|-----|------|------|
| 1 | RW-0100 | 1-1 정원 전경 | 10s | -- |
| 2 | RW-0102 | 1-2 초은이 등장 | 10s | Cross dissolve (1s) |
| 3 | RW-0103 | 1-3 물방울 클로즈업 | 10s | Match cut on magnifying glass |
| 4 | RW-0201 | 2-1 렌즈 전환 | 10s | Match cut on water drop |
| 5 | RW-0202 | 2-2 내부 첫 시야 | 5s | Light flash transition |
| 6 | RW-0301 | 3-1 뭉이 등장 | 15s | Cut |
| 7 | RW-0302 | 3-2 프리즘 탐험 | 15s | Cross dissolve (0.5s) |
| 8 | RW-0303 | 3-3 표면장력 서핑 | 15s | Action match cut |
| 9 | RW-0401 | 4-1 물방울 흔들림 | 20s | Hard cut (긴장감) |
| 10 | RW-0402 | 4-2 할아버지 무전 | 10s | Sound bridge transition |
| 11 | RW-0403 | 4-3 협력 해결 | 15s | Cross dissolve (0.5s) |
| 12 | RW-0501 | 5-1 보석빛 물방울 | 15s | Light bloom transition |
| 13 | RW-0502 | 5-2 현실 복귀 | 15s | Flash white → watercolor |
| 14 | RW-0601 | 6-1 꽃을 바라보며 | 15s | Cross dissolve (1s) |

### 전환 효과 규칙

| 전환 유형 | 적용 구간 | 이유 |
|----------|----------|------|
| 현실→미시 | Scene 1-3 → 2-1 | 급속 줌인 + 파티클 분해 + 스타일 전환 |
| 미시→현실 | Scene 5-1 → 5-2 | 화이트 플래시 + 수채화 페이드인 |
| 미시 세계 내부 | Scene 3, 4 | 크로스 디졸브 또는 매치컷 |
| 위기 장면 | Scene 4-1 진입 | 하드컷 (긴장감 유지) |
| 현실 세계 내부 | Scene 1, 5-2, 6 | 크로스 디졸브 |

### 총 영상 길이 계산

- 원본 클립 합계: 약 180초 (3분)
- 전환 오버랩: 약 -10초
- 후반 편집 트림: 약 -5~10초
- **최종 예상**: 약 160~170초 (2분 40초~2분 50초)
- 3분 채우기: 오프닝 타이틀(5초) + 엔딩 크레딧(5~10초) 후반 편집 추가

---

## 트러블슈팅

### ComfyUI 배경 생성 문제

| 증상 | 해결 |
|------|------|
| 미시 세계 색감 탁함 | ral-crztlgls-sdxl LoRA strength 0.8→0.9 올리기 |
| 수채화 톤 과하게 뭉개짐 | ral-wtrclr-sdxl LoRA strength 0.7→0.5 낮추기 |
| 캐릭터 위치 불안정 | ControlNet OpenPose로 포즈 가이드 추가 |
| 물방울 내부 공간감 부족 | ControlNet Depth로 구형 깊이감 추가 |
| 해상도 VRAM 초과 | 1920x1080 대신 1536x864 생성 후 업스케일 |

### Runway/Kling 영상 변환 문제

| 증상 | 해결 |
|------|------|
| 스타일이 사실적으로 변함 | Motion Amount 낮추기 + "maintain artistic style" 프롬프트 강조 |
| 캐릭터 얼굴 변형 | Duration 짧게(4~5s) + 여러 클립 이어붙이기 |
| 카메라 움직임 부자연스러움 | 모션 지시를 단순화 ("slow zoom in" 수준) |
| 키프레임 보간이 어색함 | 중간 키프레임 추가 생성하여 3장 이상 사용 |
| 색감 변화가 급격함 | Kling Creativity 0.5→0.3 낮추기 |

### 긴 씬 처리 (15~20초)

일부 씬은 10초 이상이므로 클립을 나눠 생성:
- 10s + 5s 또는 10s + 10s로 분할
- 앞 클립의 마지막 프레임을 뒤 클립의 시작 이미지로 사용
- 연결 부분에 0.5s 크로스 디졸브 적용
- Runway의 "Extend" 기능 활용 가능 (연속 생성)

---

## 씬별 LoRA 설정 참조

| 씬 | 세계관 | LoRA | trigger word | strength_model | strength_clip |
|----|--------|------|-------------|---------------|---------------|
| 1-1, 1-2 | 현실 | ral-wtrclr-sdxl | `ral-wtrclr` | 0.7 | 0.7 |
| 1-3 | 현실→전환 | ral-wtrclr-sdxl | `ral-wtrclr` | 0.4 | 0.4 |
| 2-1A | 현실 시작 | 없음 (중립) | - | - | - |
| 2-1B | 전환 중간 | 없음 (중립) | - | - | - |
| 2-1C | 미시 도착 | ral-crztlgls-sdxl | `ral-crztlgls` | 0.8 | 0.8 |
| 2-2, 3-1, 3-2, 3-3 | 미시 | ral-crztlgls-sdxl | `ral-crztlgls` | 0.8 | 0.8 |
| 4-1 | 미시 위기 | ral-crztlgls-sdxl | `ral-crztlgls` | 0.6 | 0.6 |
| 4-2 | 미시 무전 | ral-crztlgls-sdxl | `ral-crztlgls` | 0.7 | 0.7 |
| 4-3 | 미시 복원 | ral-crztlgls-sdxl | `ral-crztlgls` | 0.8 | 0.8 |
| 5-1 | 미시 최고조 | ral-crztlgls-sdxl | `ral-crztlgls` | 0.9 | 0.9 |
| 5-2 | 현실 복귀 | ral-wtrclr-sdxl | `ral-wtrclr` | 0.7 | 0.7 |
| 6-1A | 현실 | ral-wtrclr-sdxl | `ral-wtrclr` | 0.7 | 0.7 |
| 6-1B | 현실→전환 | ral-wtrclr-sdxl | `ral-wtrclr` | 0.4 | 0.4 |

---

## 씬별 KSampler 파라미터 참조

| 씬 | Steps | CFG | Sampler | Scheduler | 비고 |
|----|-------|-----|---------|-----------|------|
| 1-1 | 30 | 7.0 | dpmpp_2m | karras | 정원 배경 |
| 1-2 | 35 | 7.5 | dpmpp_2m | karras | 캐릭터 포함 |
| 1-3 | 40 | 8.0 | dpmpp_2m | karras | 매크로 디테일 |
| 2-1A,B | 35 | 7.0 | dpmpp_2m | karras | 전환 키프레임 |
| 2-1C | 40 | 6.5 | dpmpp_sde | karras | 프리즘 세계 진입 |
| 2-2 | 40 | 8.0 | dpmpp_2m | karras | 내부 파노라마 |
| 3-1 | 40 | 7.5 | dpmpp_2m | karras | 캐릭터 등장 |
| 3-2 | 35 | 7.5 | dpmpp_2m | karras | 트래킹 배경 |
| 3-3 | 35 | 7.0 | dpmpp_2m | karras | 액션 씬 |
| 4-1 | 35 | 6.5 | dpmpp_2m | karras | 위기 불안정 (낮은 CFG) |
| 4-2 | 35 | 7.5 | dpmpp_2m | karras | 무전 씬 |
| 4-3 | 40 | 7.5 | dpmpp_2m | karras | 복원 씬 |
| 5-1 | 45 | 8.5 | dpmpp_2m | karras | 최고 품질 (높은 steps/CFG) |
| 5-2 | 35 | 7.5 | dpmpp_2m | karras | 현실 복귀 |
| 6-1A | 35 | 7.5 | dpmpp_2m | karras | 수채화 |
| 6-1B | 40 | 8.0 | dpmpp_2m | karras | 매크로 디테일 |
