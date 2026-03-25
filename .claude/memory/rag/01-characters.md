# 캐릭터 디자인 현황

> 캐릭터 프롬프트 + 스타일가이드 요약. ComfyUI 생성 작업 시 참조.

## 캐릭터별 프롬프트 현황

### 초은이 (박초은, 7세) — 10종 완료
- 파일: `production/prompts/characters/choeun-prompts.md`
- 트리거 워드: `choeun_girl`
- 외형 핵심: 단발 보브컷 + 하늘색 구슬 땋은머리, 파스텔 민트 탐험 조끼, 카키 반바지, 짝짝이 양말, 목에 건 황동 돋보기
- 프롬프트 목록:
  1. 정면 전신 (현실/수채화) — 레퍼런스 기준 이미지
  2. 측면 전신 (현실/수채화)
  3. 후면 전신 (현실/수채화)
  4. 표정: 호기심 (클로즈업)
  5. 표정: 놀람 (클로즈업)
  6. 표정: 기쁨 (클로즈업)
  7. 정면 전신 (미시/초현실) — 프리즘 세계 속
  8. 액션: 표면장력 서핑 (미시)
  9. 돋보기 소품 클로즈업
  10. 초은이 + 뭉이 투샷 (미시)

### 할아버지 (박 박사, 68세) — 7종 완료
- 파일: `production/prompts/characters/grandpa-prompts.md`
- 트리거 워드: `grandpa_scientist`
- 외형 핵심: 은백색 민들레홀씨 옆머리, 둥근 와이어 안경, 카멜브라운 코르듀로이 카디건(팔꿈치 패치), 레트로 무전기, 마이크로 렌즈(황동 고글)
- 현실 세계 전용 (미시 세계 직접 등장 안 함)

### 뭉이 (물곰/타디그레이드) — 8종 완료
- 파일: `production/prompts/characters/mungyi-prompts.md`
- 트리거 워드: `mungyi_tardigrade`
- 외형 핵심: 통통한 배럴형 반투명 몸체, 8개 뭉뚝한 다리, 큰 둥근 눈, 내부 발광, 비누방울 같은 프리즘 무지개빛
- 미시 세계 전용 (에피소드별 바이오 글로우 색상 변형)

## 스타일가이드 현황
- 파일: `production/characters/style-guide.md`
- 비주얼 철학, 현실/미시 스타일 정의, 캐릭터별 규칙, 전환 규칙, 금지 스타일, LoRA 가이드, ComfyUI 템플릿
- PR #5에서 WI-001 기준으로 의상/소품 통일 수정 완료 (머지 대기)
- 통일 내용: 노란 머리띠+멜빵바지 → 하늘색 구슬 땋은머리+민트 조끼+카키 반바지 (DEC-001)

## 색상 팔레트 현황
- 파일: `production/characters/color-palette.md`
- 캐릭터별 HEX 팔레트 (현실/미시 구분)
- 에피소드 1~10화 색감 톤 가이드
- 색상 전환 규칙 + After Effects/DaVinci 색보정 가이드
- PR #5에서 WI-001 기준 수정 완료 (머지 대기)
- 초은이 팔레트: 골든 옐로우 머리띠→하늘색 구슬, 코발트 멜빵바지→카키 반바지+민트 조끼 등 항목 재정의

## 공통 파라미터
| 항목 | 현실 세계 | 미시 세계 |
|------|----------|----------|
| Checkpoint | dreamshaperXL / juggernautXL | 동일 |
| Sampler | DPM++ 2M Karras | DPM++ SDE Karras |
| Steps | 30~40 | 35~40 |
| CFG | 6.5~7.5 | 6.5~7.0 |
| LoRA | watercolor_style_sdxl | prismatic_surreal_sdxl |
