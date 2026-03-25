# Team Roles — AI Animation Production (v3.0)

팀 역할 참조 문서 — 서브에이전트(lead-workflow, team-worker)가 참조합니다.

## 역할 매핑

| TEAM_NAME | 역할 | 소유 디렉토리 | 책임 |
|-----------|------|-------------|------|
| director | 감독/PD | production/storyboard/**, docs/** | 스토리보드, 씬 구성, 비주얼 디렉션, 품질 관리 |
| character | 캐릭터 디자인 | production/characters/**, production/prompts/characters/** | 캐릭터 프롬프트, 스타일가이드, LoRA 관리 |
| visual | 배경/씬 아트 | production/episodes/*/concept-art/**, production/episodes/*/backgrounds/**, production/prompts/scenes/** | 미시세계 프롬프트, ComfyUI 워크플로우, 배경 생성 |
| animation | 애니메이션 | production/episodes/*/animation/**, production/episodes/*/composited/**, production/prompts/workflows/** | 모션 생성, Runway/Kling 프롬프트, 합성 가이드, 편집 타임라인 |
| submission | 제출 서류 | submission/** | 공모 신청서, AI 기술 증빙자료, 포트폴리오 작성 |

## 공유 파일 (전팀 수정 가능)
- `CLAUDE.md`
- `.gitignore`
- `production/assets/**`
- `.flowset/guardrails.md`

상세 매핑은 `.flowset/ownership.json` 참조.

## 팀별 검증 책임

| TEAM_NAME | 자체 검증 |
|-----------|----------|
| director | 스토리보드 완전성, 씬 연결성, 교육 포인트 포함 여부 |
| character | 캐릭터 일관성, 프롬프트 재현성, 스타일 통일 |
| visual | 비주얼 톤 일관성, 과학적 정확성, 에피소드별 차별화 |
| animation | 모션 자연스러움, 합성 품질, 타임라인 정합성 |
| submission | 서류 완전성, 공모 요건 충족, 마감일 준수 |

## 팀 간 소통
- director ↔ character: 캐릭터 스타일 + 씬별 표정/동작 지시
- director ↔ visual: 비주얼 디렉션 + 에피소드별 색감 톤
- character ↔ animation: 캐릭터 레퍼런스 → 모션 생성 입력
- visual ↔ animation: 배경 → 합성 레이어
- submission ↔ 전체: AI 기술 증빙에 각 팀 워크플로우 수집

## 의존성 흐름
```
director (스토리보드)
  ├→ character (캐릭터 디자인) ─────┐
  ├→ visual (배경/씬 생성) ─────────┼→ animation (합성/편집)
  └→ submission (서류 작성) ────────→ 최종 제출
```
