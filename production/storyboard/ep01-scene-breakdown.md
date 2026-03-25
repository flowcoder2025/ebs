# EP01 "물방울 속 우주" — 3분 영상 씬 브레이크다운

> 원작 시놉시스 5분 중 핵심 3분 구성. 공모 제출용 본편 일부.

## 비주얼 레이어 전략
- **현실 세계** (도입/결말): 따뜻한 수채화풍, 부드러운 색감
- **미시 세계** (본편): AI 초현실 비주얼, 프리즘 굴절, 무지개빛

---

## Scene 1: 정원의 발견 (0:00~0:30)

### 1-1. 정원 전경 (0:00~0:10)
- **설명**: 비 갠 오후, 햇빛이 비치는 정원. 나무, 꽃, 풀이 촉촉하게 젖어있음
- **스타일**: 수채화풍 애니메이션, 따뜻한 톤
- **카메라**: 와이드 → 천천히 줌인
- **요소**: 정원 전경, 물방울 반짝임, 새소리
- **생성 도구**: ComfyUI SDXL (watercolor style LoRA)
- **프롬프트 키워드**: `watercolor style, cozy garden after rain, sunlight through clouds, glistening water drops on leaves, warm color palette, children's animation, Studio Ghibli-inspired`

### 1-2. 초은이 등장 (0:10~0:20)
- **설명**: 초은이가 정원에서 놀다가 나뭇잎 위 물방울 발견. 돋보기로 들여다봄
- **캐릭터**: 초은이 — 7세 소녀, 호기심 가득한 표정, 돋보기 트레이드마크
- **카메라**: 미디엄 샷 → 초은이 얼굴 클로즈업
- **생성 도구**: ComfyUI (IP-Adapter + character LoRA)
- **핵심 표현**: 눈이 반짝이는 호기심 표정

### 1-3. 물방울 클로즈업 (0:20~0:30)
- **설명**: 나뭇잎 위 물방울 매크로 샷. 물방울 안에 무지개빛 반사. 할아버지가 마이크로 렌즈 건넴
- **카메라**: 익스트림 클로즈업, 물방울 내부에 주변 풍경 왜곡 반사
- **생성 도구**: ComfyUI SDXL + Runway (zoom-in 영상)
- **프롬프트 키워드**: `macro photography, single water drop on green leaf, rainbow light refraction inside, distorted garden reflection, crystal clear, hyper-detailed`

---

## Scene 2: 미시 세계 진입 (0:30~0:45)

### 2-1. 마이크로 렌즈 전환 (0:30~0:40)
- **설명**: 초은이가 렌즈를 쓰는 순간, 몸이 빛 입자로 분해되며 축소
- **비주얼**: 수채화 → 프리즘 세계로 스타일 전환 (현실→미시 트랜지션)
- **카메라**: 급속 줌인 + 화면 회전
- **생성 도구**: Runway Gen-3 (img2video transition)
- **프롬프트 키워드**: `magical shrinking transformation, body dissolving into light particles, zooming into water drop, style transition from watercolor to surreal prismatic world`

### 2-2. 물방울 내부 첫 시야 (0:40~0:45)
- **설명**: 물방울 내부. 빛의 굴절로 사방이 무지개빛. 동그란 물의 벽 너머로 바깥 세상이 왜곡되어 보임
- **비주얼**: 투명한 구체 내부, 프리즘 스펙트럼, 초현실적
- **카메라**: 360도 회전 파노라마
- **생성 도구**: ComfyUI SDXL + Runway
- **프롬프트 키워드**: `inside a water drop, prismatic rainbow world, light refraction spectrum, transparent spherical walls, distorted outside world visible through water surface, dreamy surreal, microscopic universe`

---

## Scene 3: 뭉이와의 만남 (0:45~1:30)

### 3-1. 뭉이 등장 (0:45~1:00)
- **설명**: 물곰(타디그레이드) 뭉이가 8개 다리로 뒤뚱뒤뚱 다가옴. 귀엽고 둥글둥글한 체형
- **캐릭터**: 뭉이 — 투명감 있는 몸체, 큰 눈, 느긋한 표정
- **카메라**: 로우앵글 → 뭉이 정면 클로즈업
- **생성 도구**: ComfyUI (character LoRA for 뭉이)
- **프롬프트 키워드**: `cute tardigrade character, 8 stubby legs, translucent round body, big friendly eyes, waddling walk, microscopic scale, rainbow prismatic background`

### 3-2. 프리즘 세계 탐험 (1:00~1:15)
- **설명**: 초은이와 뭉이가 함께 프리즘 세계를 걸어다님. 빛의 스펙트럼이 길처럼 펼쳐짐
- **비주얼**: 무지개 빛 터널, 빛 입자가 떠다님, 물 분자 구조 시각화
- **카메라**: 트래킹 샷 (둘이 나란히 걷는 것을 따라감)
- **생성 도구**: Runway/Kling (img2video)
- **프롬프트 키워드**: `walking through rainbow light tunnel inside water drop, floating light particles, prismatic spectrum path, microscopic water molecules visible, dreamy exploration, two small figures walking`

### 3-3. 표면장력 서핑 (1:15~1:30)
- **설명**: 표면장력 위에서 서핑! 물 표면이 탄력 있는 트램폴린처럼. 물 분자들이 손잡고 있는 모습
- **비주얼**: 반투명 물 표면 위를 미끄러지는 동작. 물 분자 의인화 (손잡은 원형들)
- **카메라**: 액션 트래킹 + 슬로모션
- **생성 도구**: ComfyUI AnimateDiff + Runway
- **프롬프트 키워드**: `surfing on water surface tension, elastic transparent water surface like trampoline, water molecules holding hands in chain, joyful riding, microscopic surfing, dynamic action`

---

## Scene 4: 위기와 해결 (1:30~2:15)

### 4-1. 물방울 흔들림 (1:30~1:50)
- **설명**: 갑자기 세계가 흔들림. 바람이 불어 물방울이 나뭇잎에서 떨어지려 함
- **비주얼**: 프리즘 세계가 왜곡되며 진동. 물벽이 출렁임. 긴장감
- **카메라**: 핸드헬드 흔들림 + 급속 줌아웃
- **생성 도구**: Runway (motion effects)
- **프롬프트 키워드**: `shaking prismatic world, distorting water walls, trembling microscopic universe, water drop about to fall, tension and danger, vibrating light spectrum`

### 4-2. 할아버지 무전 (1:50~2:00)
- **설명**: 할아버지 목소리 "표면장력을 이용해!" — 무전기에서 목소리가 빛의 파동으로 시각화
- **비주얼**: 음파가 빛의 물결로 표현. 할아버지 얼굴이 물방울 표면에 비침
- **카메라**: 클로즈업 (무전기 → 빛 파동)
- **생성 도구**: ComfyUI SDXL
- **프롬프트 키워드**: `sound waves visualized as light ripples, grandfather's face reflected on water surface, radio communication in microscopic world, warm guiding light`

### 4-3. 협력 해결 (2:00~2:15)
- **설명**: 초은이와 뭉이가 물 분자들의 결합력을 이용해 물방울 안정시킴. 분자들이 더 단단히 손잡음
- **비주얼**: 물 분자 체인이 강화, 물방울이 안정적 구체로 복원, 빛이 다시 안정
- **카메라**: 와이드 → 물방울 전체가 안정되는 모습
- **생성 도구**: ComfyUI + Runway
- **프롬프트 키워드**: `water molecules strengthening bonds, stabilizing water drop sphere, molecular chains tightening, prismatic world calming down, teamwork success, glowing restoration`

---

## Scene 5: 결말 (2:15~2:45)

### 5-1. 보석빛 물방울 (2:15~2:30)
- **설명**: 햇빛이 비치며 물방울 전체가 보석처럼 빛남. 뭉이에게 인사
- **비주얼**: 물방울 내부 전체가 찬란한 빛으로 가득. 이별의 순간
- **카메라**: 슬로우 360도 회전 → 줌아웃
- **생성 도구**: Runway (cinematic lighting)
- **프롬프트 키워드**: `water drop glowing like jewel, sunlight flooding prismatic world, brilliant rainbow reflections, farewell moment, warm emotional lighting, beautiful microscopic universe`

### 5-2. 현실 복귀 (2:30~2:45)
- **설명**: 초은이가 밖으로 나옴. "할아버지, 물방울 속에 우주가 있었어!"
- **스타일**: 다시 수채화풍으로 전환
- **카메라**: 미디엄 샷 → 초은이 웃는 얼굴
- **생성 도구**: ComfyUI (watercolor style)
- **프롬프트 키워드**: `watercolor style, happy girl back in garden, excited expression, holding magnifying glass, warm sunlight, cozy garden`

---

## Scene 6: 다음 화 예고 (2:45~3:00)

### 6-1. 꽃을 바라보며 (2:45~3:00)
- **설명**: 초은이가 돋보기를 들고 정원의 장미꽃을 바라봄. 다음 모험 암시
- **비주얼**: 수채화풍 + 장미꽃 클로즈업으로 끝. 꽃잎 위 미세구조 살짝 힌트
- **카메라**: 초은이 → 장미꽃 → 꽃잎 매크로 줌 (다음 화 티저)
- **생성 도구**: ComfyUI SDXL + Runway (zoom transition)
- **프롬프트 키워드**: `watercolor girl looking at rose, macro zoom into rose petal, microscopic petal structure teaser, transition from warm watercolor to surreal micro world hint`

---

## 교육 포인트 (영상 전체에 자연스럽게 녹여냄)
1. **빛의 굴절** — 물방울 내부 프리즘 세계
2. **표면장력** — 서핑 장면, 물 분자 결합
3. **물곰(타디그레이드)** — 뭉이 캐릭터로 존재 인식
4. **물 분자 결합력** — 위기 해결에 활용

## 사운드 가이드
- 현실 세계: 새소리, 바람, 자연음
- 전환: 마법 사운드 + 주파수 변조
- 미시 세계: 에코 있는 환경음, 물 울림, 크리스탈 사운드
- 위기: 긴장 음악, 진동음
- 해결: 따뜻한 오케스트라 + 빛 효과음
