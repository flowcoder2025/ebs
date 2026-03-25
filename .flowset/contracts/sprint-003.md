# Sprint Contract: WI-003

## 기본 정보
- **WI**: WI-003-feat 씬별 배경 프롬프트 작성 (Scene 1~6)
- **담당 팀**: visual
- **생성자**: team-worker (visual)
- **평가자**: evaluator
- **스프린트 기간**: 2026-03-25

## 목표
EP01 "물방울 속 우주" 3분 영상의 전체 씬(Scene 1~6)에 대한 배경/환경 생성 프롬프트를 작성한다. 각 씬의 스토리보드 지시를 충실히 반영하고, ComfyUI SDXL 및 Runway/Kling에서 사용 가능한 형태로 제공한다.

## 입력물 (선행 조건)
- `production/storyboard/ep01-scene-breakdown.md` — 씬 구성 + 프롬프트 키워드
- `micro_voyager_작품소개서.pdf` — 비주얼 디렉션 (p.8), 1화 시놉시스 (p.5)

## 산출물 (결과 파일)
| # | 파일 경로 | 설명 |
|---|---------|------|
| 1 | `production/prompts/scenes/ep01-scene01-garden.md` | Scene 1 정원 프롬프트 (현실 세계) |
| 2 | `production/prompts/scenes/ep01-scene02-transition.md` | Scene 2 전환 프롬프트 |
| 3 | `production/prompts/scenes/ep01-scene03-prism-world.md` | Scene 3 프리즘 세계 프롬프트 (미시 세계) |
| 4 | `production/prompts/scenes/ep01-scene04-crisis.md` | Scene 4 위기 프롬프트 |
| 5 | `production/prompts/scenes/ep01-scene05-resolution.md` | Scene 5 결말 프롬프트 |
| 6 | `production/prompts/scenes/ep01-scene06-teaser.md` | Scene 6 다음 화 예고 프롬프트 |
| 7 | `production/prompts/scenes/ep01-runway-prompts.md` | Runway/Kling 전용 img2video 프롬프트 |

## 수용 기준
- [ ] 각 씬 파일에 **서브씬별** 프롬프트 포함 (씬 브레이크다운의 1-1, 1-2 등 단위)
- [ ] 현실 세계 씬(1, 5-2, 6): **수채화풍** 스타일 키워드 적용
- [ ] 미시 세계 씬(2-2, 3, 4, 5-1): **초현실 프리즘** 스타일 키워드 적용
- [ ] 각 프롬프트에 **카메라 앵글/무브먼트** 정보 포함 (씬 브레이크다운 기준)
- [ ] 모든 프롬프트에 **네거티브 프롬프트** 포함
- [ ] 모든 프롬프트에 **권장 파라미터** 포함 (모델, 해상도, CFG, 시드 가이드)
- [ ] **Runway/Kling 전용 프롬프트** 별도 작성 (img2video 변환용, 모션 지시 포함)
- [ ] 1화 비주얼 키워드 "프리즘 굴절, 투명한 구체, 빛의 스펙트럼" + 색감 "무지개 + 투명 블루" 반영
- [ ] 과학적 정확성: 빛의 굴절, 표면장력, 물 분자 구조 시각화가 과학적 사실 기반

## 평가 기준 (비주얼 프로젝트)
| 기준 | 가중치 | 이 WI에서 중점 확인 사항 |
|------|--------|----------------------|
| 디자인 품질 | 25% | 씬 간 색감 흐름 일관성, 현실→미시 전환의 비주얼 대비, 1화 색감 톤(무지개+투명블루) 준수 |
| 독창성 | 30% | 물방울 내부 세계의 독창적 비주얼 해석, "AI만 가능한" 초현실 표현, 뻔한 "물속 세계" 탈피 |
| 기술 완성도 | 25% | ComfyUI/Runway 호환 프롬프트 구조, 파라미터 완전성, img2video 모션 지시 구체성 |
| 정확성 | 20% | 씬 브레이크다운 충실 반영, 과학적 정확성(굴절/표면장력/분자구조), 카메라 앵글 일치 |

## 참조 문서
- `production/storyboard/ep01-scene-breakdown.md` (SSOT)
- `micro_voyager_작품소개서.pdf` p.5 (1화 시놉시스), p.8 (비주얼 디렉션)
- `production/characters/style-guide.md` (완료 시 참조)

## 통과 기준
- 총점 **7.0 이상** PASS
- 7.0 미만 FAIL → 재작업 (최대 3회)
