# 씬별 배경 프롬프트 현황

> EP01 "물방울 속 우주" 씬 구성 및 프롬프트 파일 매핑.

## 씬 브레이크다운 (SSOT)
- 파일: `production/storyboard/ep01-scene-breakdown.md`
- 총 영상: 3분 (공모 제출용)
- 비주얼 레이어: 현실(수채화풍) / 미시(AI 초현실 프리즘)

## 씬별 프롬프트 파일 (7개 완료)

| 씬 | 시간 | 레이어 | 서브씬 | 파일 |
|----|------|--------|--------|------|
| Scene 1: 정원의 발견 | 0:00~0:30 | 현실 | 1-1, 1-2, 1-3 | `prompts/scenes/ep01-scene01-garden.md` |
| Scene 2: 미시 세계 진입 | 0:30~0:45 | 전환 | 2-1, 2-2 | `prompts/scenes/ep01-scene02-transition.md` |
| Scene 3: 프리즘 세계 탐험 | 0:45~1:30 | 미시 | 3-1, 3-2, 3-3 | `prompts/scenes/ep01-scene03-prism-world.md` |
| Scene 4: 위기 — 증발 | 1:30~2:00 | 미시 | 4-1, 4-2, 4-3 | `prompts/scenes/ep01-scene04-crisis.md` |
| Scene 5: 귀환 | 2:00~2:40 | 미시→현실 | 5-1, 5-2 | `prompts/scenes/ep01-scene05-resolution.md` |
| Scene 6: 다음 화 예고 | 2:40~3:00 | 현실 | 6-1 (A/B) | `prompts/scenes/ep01-scene06-teaser.md` |
| Runway/Kling 전용 | — | 전체 | 전 서브씬 | `prompts/scenes/ep01-runway-prompts.md` |

## 프롬프트 포함 항목 (모든 서브씬 공통)
- Positive prompt (영어, 한글 주석)
- Negative prompt
- 권장 파라미터 (모델, 해상도, CFG, 시드 가이드)
- 카메라 앵글/무브먼트 (씬 브레이크다운 기준)
- 생성 도구 지정 (ComfyUI / Runway / Kling)

## Runway/Kling 전용 프롬프트
- 모든 서브씬의 img2video 프롬프트 (Runway + Kling 양쪽 버전)
- 모션 지시 (카메라 무브먼트 + 오브젝트 모션)
- 클립 편집 가이드 (14개 클립 연결 순서, 전환 효과, 총 길이)

## EP01 비주얼 키워드
- 프리즘 굴절, 투명한 구체, 빛의 스펙트럼
- 색감: 무지개 + 투명 블루
- 주도색: `#87CEEB`, 보조색: `#E0F0FF`, `#B0E0E6`
- 강조색: 무지개 스펙트럼 전체 (`#FF4444` ~ `#8B00FF`)

## 과학 포인트 (EP01)
- 빛의 굴절 (프리즘 효과)
- 표면장력 (물 표면 서핑)
- 물 분자 구조 (H2O 수소결합 시각화)

## 수정 이력
- PR #6: 씬 01, 05, 06 프롬프트 내 캐릭터 의상 참조를 WI-001 기준으로 수정 (머지 대기)
  - yellow hairband → sky-blue bead braid
  - white t-shirt + blue overalls → pastel mint vest + khaki cargo shorts
  - magnifying glass (손에) → brass magnifying glass on leather cord (목에)
  - Runway 프롬프트(ep01-runway-prompts.md)는 의상 상세 미기재로 수정 불필요
