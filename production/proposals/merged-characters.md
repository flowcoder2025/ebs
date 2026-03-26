# 병합안 캐릭터 설정 + DreamShaperXL 프롬프트 초안

> character 팀 작성 | 2026-03-26
> 기저 프레임: "그려줘 뚝딱" ControlNet scribble 메커니즘
> 캐릭터 원안: "꿈빛 도서관" 하늘+먹이+빛솔
> 관통 서사: "꿈빛 미술관" 까만 얼룩
> 핵심 메시지: "못 그린 그림은 없다"

---

## 캐릭터 설계 원칙

1. **AI 일관성 우선**: 모든 캐릭터는 화풍이 바뀌어도 식별 가능한 실루엣/색상 앵커를 가진다
2. **ControlNet scribble 연동**: 주인공의 낙서가 세계를 만드는 서사 — 캐릭터도 이 메커니즘에 자연스럽게 통합
3. **비인간 캐릭터 활용**: 먹이(고정 실루엣), 빛솔(의도적 비정형), 까만 얼룩(추상) — AI 생성 제약을 서사 장점으로 전환
4. **화풍 전환 시 변하는 것과 변하지 않는 것을 명확히 정의**

---

## 캐릭터 1: 하늘 (주인공)

### 기본 정보
- **나이/성별**: 7세 여자아이
- **역할**: 주인공. 호기심 많고 그림 그리기를 좋아하는 아이
- **한 줄 설명**: 할머니의 화구 상자 '뚝딱'에 그림을 그려 세계를 만들고 그 안에서 모험하는 꼬마 화가

### 외모 디자인
- **머리**: 짧은 갈색 단발 (턱선 기장), 이마를 덮는 앞머리
- **모자**: 빨간색 베레모 — "그림 그리는 아이" 정체성 아이콘. 어떤 화풍에서도 빨간 원형으로 식별
- **상의**: 크림색 긴팔 셔츠 + 파스텔 민트 앞치마 (주머니에 항상 크레파스 몇 자루)
- **하의**: 진갈색 반바지, 흰 양말
- **신발**: 빨간 운동화 (베레모와 색상 통일 — 상하 빨간 앵커)
- **소품**: 할머니에게 물려받은 낡은 나무 화구 상자 '뚝딱' — 뚜껑을 열고 그림을 그리면 세계가 열림

### 실루엣 앵커 (화풍 전환 시 고정 요소)
- 빨간 베레모 (원형)
- 짧은 단발 (갈색 톤)
- 앞치마 실루엣 (A라인)
- 빨간 운동화
- **이 4요소가 유지되면 수채화/크레파스/수묵화 어디서든 "하늘"로 식별 가능**

### 성격
- 실패를 두려워하지 않고 과감하게 그린다
- "이렇게 그리면 어떨까?" — 호기심이 모험의 동력
- 먹이에게 잔소리를 듣지만 결국 자기 방식으로 문제를 풀어낸다
- 까만 얼룩을 처음부터 무서워하지 않고 궁금해한다

### 서사 역할
- ControlNet scribble의 서사적 구현: 하늘이가 화구 상자 '뚝딱'에 그림을 그리면 → 그 낙서가 세계가 됨
- 매 에피소드 다른 재료(크레파스, 수채화, 색종이 등)로 그림 → 재료에 따라 다른 화풍의 세계 생성
- 시리즈 후반: 까만 얼룩을 위해 "어떤 재료로도 그려지지 않는 그림"을 그리려 시도

---

## 캐릭터 2: 먹이 (가이드)

### 기본 정보
- **종**: 검은 고양이
- **역할**: 가이드/멘토. 화구 상자 '뚝딱'에 깃든 수호자
- **한 줄 설명**: 화구 상자에 깃들어 수십 년째 잠들어 있던 늙은 검은 고양이, 하늘이가 뚜껑을 열자 깨어나 그림 세계의 규칙을 알려주는 안내자

### 외모 디자인
- **몸**: 전신 검은 털, 약간 통통한 체형 (둥근 실루엣)
- **귀**: 왼쪽 귀 살짝 접힘 (개체 식별 포인트)
- **눈**: 금빛 눈 (어두운 화풍에서도 빛나는 앵커)
- **목**: 작은 종이 달린 빨간 리본 (하늘이의 베레모/운동화와 색상 호응)
- **꼬리**: 끝이 약간 구부러진 긴 꼬리

### 실루엣 앵커 (화풍 전환 시 고정 요소)
- 검은 실루엣 (어떤 화풍에서도 "검은 덩어리"로 즉시 식별)
- 금빛 눈 2개 (어둠 속에서도 빛남)
- 빨간 리본 + 종 (소리 + 색상 이중 앵커)
- **검은 고양이는 수채화/크레파스/수묵화/콜라주 모든 화풍에서 가장 일관성 유지가 쉬운 디자인**

### 성격
- 느긋하고 잔소리 많음 ("또 그렇게 대충 그리면...")
- 위기 상황에서 의외로 용감
- 그림 세계의 규칙을 꿰뚫고 있지만 가끔 틀림 (코미디 요소)
- 까만 얼룩을 경계하지만, 과거에 까만 얼룩과 연관된 기억이 있는 듯한 복선

### 서사 역할
- 하늘이가 세계에 들어갈 때 함께 동행 — 규칙 설명, 위험 경고
- "그림을 완성해야 돌아올 수 있다"는 핵심 규칙의 전달자
- 시리즈 후반: 까만 얼룩의 정체를 알고 있었음이 밝혀짐

### AI 생성 특이사항
- **검은 실루엣 = 화풍 불문 일관성 최강**: IP-Adapter 의존도 최소
- 금빛 눈은 프롬프트에 `golden eyes, glowing eyes`로 강제 가능
- 빨간 리본은 `red ribbon with small bell on neck`으로 일관 유지

---

## 캐릭터 3: 빛솔 (마스코트)

### 기본 정보
- **종**: 비정형 빛 존재 (그림 요정)
- **역할**: 조력자/마스코트. 그림 세계가 열릴 때 나타나는 작은 빛 덩어리
- **한 줄 설명**: 말을 못하고 빛과 색으로 감정을 표현하는 요정 — 매 에피소드 해당 화풍의 재료로 형태가 달라짐

### 외모 디자인 (에피소드별 변형)
- **기본 형태**: 주먹 크기의 부드러운 빛 구체, 따뜻한 황금빛
- **에피소드별 변형 예시**:
  - 크레파스 세계: 크레파스로 동그랗게 칠한 것 같은 노란 덩어리, 크레파스 결 텍스처
  - 수채화 세계: 물방울 형태, 물감이 번지듯 가장자리가 퍼짐
  - 색종이 세계: 접힌 종이 별 모양
  - 수묵화 세계: 먹물 방울 (금빛이 아닌 은빛으로 변환)
  - 크리스탈 세계: 작은 유리 조각, 프리즘처럼 무지개빛 굴절
  - 혼합 세계: 여러 재료가 겹친 복합 형태

### 실루엣 앵커
- **의도적으로 고정 실루엣 없음** — 매 에피소드 다른 형태가 이 캐릭터의 정체성
- 유일한 공통점: "작고 둥글고 빛나는 것" (크기 약 주먹만 함)
- 감정 표현: 기쁨=밝게 빛남 / 슬픔=어둡게 깜박 / 놀람=빠르게 점멸

### 성격
- 말을 하지 않음 — 빛의 밝기, 색상, 움직임으로 의사 표현
- 호기심 많고 장난기 있음 (하늘이 주변을 맴돌며 반짝)
- 위험 감지 시 붉은색으로 변하며 경고
- 까만 얼룩 근처에서는 불안하게 깜박이다가, 시리즈 후반에서 까만 얼룩에게 다가감

### 서사 역할
- 그림 세계의 "생명력" 상징 — 빛솔이 있으면 그림이 살아있다는 증거
- 하늘이와 먹이를 위험에서 경고하는 센서 역할
- EP10에서 까만 얼룩에게 자신의 빛을 나눠주는 결정적 장면

### AI 생성 특이사항
- **비정형 = AI 자유 생성 최적**: 일관성 필요 없으므로 매 에피소드 자유롭게 생성
- 화풍별 재료 질감만 프롬프트에 지정하면 됨
- 발광 효과: `glowing, luminous, ethereal light, soft glow` 계열 프롬프트로 통일

---

## 캐릭터 4: 까만 얼룩 (관통 캐릭터 / 시리즈 미스터리)

### 기본 정보
- **종**: 정체불명의 검은 얼룩
- **역할**: 시리즈 관통 미스터리. 어떤 그림에도 속하지 못한 외로운 존재
- **한 줄 설명**: 그림 세계 곳곳에 나타나는 검은 얼룩 — 그림을 망가뜨리는 것처럼 보이지만, 사실은 자기만의 그림을 찾고 있는 외로운 존재

### 외모 디자인
- **형태**: 비정형 검은 얼룩. 잉크가 번진 것 같기도 하고, 그림자 같기도 한 불확실한 형태
- **크기**: 장면에 따라 변화 (작은 점 ~ 화면을 뒤덮는 크기)
- **질감**: 해당 화풍의 "실패한 흔적"처럼 보임
  - 수채화 세계: 물감이 엎질러진 자국
  - 크레파스 세계: 검은 크레파스로 마구 칠한 자국
  - 수묵화 세계: 먹물이 번진 커다란 얼룩
  - 색종이 세계: 찢어진 검은 종이 조각들
- **눈**: 없음. 단, 하늘이와 시선이 마주치는 순간 일시적으로 두 개의 흐릿한 빛이 깜박 (EP03~)

### 실루엣 앵커
- **"검은 얼룩"이라는 개념 자체가 앵커** — 형태는 매번 달라도 "검고 불규칙한 얼룩"이면 까만 얼룩
- 주변 그림과의 부조화가 식별 포인트 (해당 화풍에 "어울리지 않는" 검은 자국)

### 등장 패턴 (시리즈 아크)
- **EP01~03**: 배경에 짧게 스치듯 등장. 그림을 망가뜨리는 원인처럼 보임
- **EP04~06**: 하늘이가 존재를 인식. 먹이가 경계하지만 하늘이는 궁금해함
- **EP07~09**: 까만 얼룩이 "그려지고 싶다"는 욕구를 드러냄. 하늘이에게 다가옴
- **EP10**: 하늘이가 까만 얼룩을 위한 그림을 그림 → "못 그린 그림은 없다" 메시지 완성

### 성격
- 외롭고 두려움이 많음 — 다가가고 싶지만 자기 모습이 그림을 망가뜨릴까 봐 도망
- 어떤 화풍에도 속하지 못하는 소외감이 핵심 감정
- 하늘이의 "못 그린 그림도 그림이야"라는 말에 처음으로 반응

### 서사 역할
- 시리즈 감정 서사의 핵심: "완벽하지 않아도 괜찮다"는 메시지의 체현
- 매 에피소드 살짝씩 등장하여 시청자의 궁금증 유발 (미스터리 후킹)
- EP10 클라이맥스에서 하늘이가 까만 얼룩을 그림으로 받아들이며 서사 완결

### AI 생성 특이사항
- **추상적 검은 형태 = AI 생성 가장 쉬움**: `black ink blot, dark smudge, spilled ink` 계열
- 화풍별 "실패 흔적" 질감만 바꾸면 됨 — 별도 캐릭터 시트 불필요
- 의도적으로 "이질적"으로 보여야 하므로 AI 아티팩트조차 장점으로 전환 가능

---

## DreamShaperXL 프롬프트 초안 (캐릭터 이미지 3장)

> 제출용 캐릭터 이미지 3장. DreamShaperXL_Turbo_v2_1 + ral-wtrclr-sdxl 기준.
> 현실 세계(아틀리에) 배경, 수채화풍 따뜻한 톤.

### 이미지 1: 하늘 — 정면 전신 레퍼런스

**Positive prompt:**
```
a 7 year old girl standing in a cozy artist atelier, full body front view, short brown bob hair with bangs, wearing a red beret, cream long sleeve shirt, pastel mint green apron with pockets holding crayons, dark brown shorts, white socks, red sneakers, holding an old wooden art supply box, warm smile, big curious eyes, soft afternoon sunlight through window, ral-wtrclr, watercolor illustration style, children's book art, gentle warm tones, soft edges
```

**Negative prompt:**
```
realistic, photorealistic, 3d render, CGI, anime, manga, adult, teenager, mature face, tall, dark mood, horror, scary, deformed hands, extra fingers, bad anatomy, blurry, low quality
```

**설정**: Steps 6, CFG 2.0, dpmpp_sde/karras, LoRA ral-wtrclr-sdxl weight 0.7

---

### 이미지 2: 하늘 + 먹이 — 아틀리에 투샷

**Positive prompt:**
```
a 7 year old girl sitting on the floor of an old artist atelier with a black cat beside her, girl has short brown bob hair with bangs and a red beret, cream shirt and pastel mint green apron, the black cat is chubby with golden eyes and a red ribbon with a small bell on its neck, left ear slightly folded, they are looking at a glowing old wooden art supply box together, the box lid is open with crayons and paint inside, warm cozy lighting, art supplies scattered around, ral-wtrclr, watercolor illustration, children's picture book style, soft warm palette
```

**Negative prompt:**
```
realistic, photorealistic, 3d render, CGI, anime, manga, adult, teenager, multiple cats, white cat, gray cat, deformed, bad anatomy, blurry, dark mood, horror
```

**설정**: Steps 6, CFG 2.0, dpmpp_sde/karras, LoRA ral-wtrclr-sdxl weight 0.7

---

### 이미지 3: 하늘 + 먹이 + 빛솔 — 그림 세계 진입 장면

**Positive prompt:**
```
a 7 year old girl with a red beret and a chubby black cat stepping into a magical world emerging from a glowing old wooden art supply box with its lid wide open, the girl wears cream shirt and mint green apron, the cat has golden eyes and red ribbon with bell, a small golden glowing orb floats beside them, the world ahead is a watercolor landscape with bleeding colors and soft washes, the transition between the atelier floor and the painted world is visible, magical sparkles at the boundary, ral-wtrclr, lush watercolor style, dreamy atmosphere, children's book fantasy illustration, warm and wonder-filled
```

**Negative prompt:**
```
realistic, photorealistic, 3d render, CGI, anime, manga, adult, teenager, dark mood, horror, scary, multiple girls, deformed, bad anatomy, blurry, low quality, dull colors
```

**설정**: Steps 6, CFG 2.0, dpmpp_sde/karras, LoRA ral-wtrclr-sdxl weight 0.85 (세계 진입 장면이므로 수채화 강도 높임)

---

## IP-Adapter 일관성 전략

| 캐릭터 | IP-Adapter 필요도 | 전략 |
|--------|------------------|------|
| 하늘 | **높음** | 이미지 1을 레퍼런스로 IP-Adapter Plus 적용. weight 0.6~0.8 |
| 먹이 | **낮음** | 검은 실루엣 자체로 일관성 확보. 프롬프트만으로 충분. IP-Adapter는 보조적 사용 |
| 빛솔 | **불필요** | 매 에피소드 다른 형태가 설계 의도. IP-Adapter 미적용 |
| 까만 얼룩 | **불필요** | 추상적 형태. 화풍별 "검은 얼룩" 프롬프트만으로 생성 |

---

## 까만 얼룩 등장 프롬프트 예시 (배경 요소로)

> 까만 얼룩은 독립 이미지가 아니라 에피소드 장면 배경에 살짝 등장하는 방식.

**EP02 수채화 세계 배경 등장:**
```
(...장면 프롬프트...), in the far background corner a mysterious dark watercolor stain is barely visible, like spilled ink on the painted landscape, subtle and easy to miss
```

**EP05 크리스탈 세계 배경 등장:**
```
(...장면 프롬프트...), a dark amorphous smudge lurking behind a crystal pillar, like a shadow that does not belong to this glass world, two faint dim lights where eyes might be
```
