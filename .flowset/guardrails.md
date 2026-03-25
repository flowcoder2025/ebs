# Guardrails - ebs

> 프로젝트별 실패 방지 규칙. 반복 실패 시 자동 추가됩니다.

## TypeScript 규칙
- `strict: true` 타입 체크 활성화
- `any` 타입 사용 금지 (불가피한 경우 주석으로 사유 명시)
- 미사용 import/변수 금지 (`noUnusedLocals`, `noUnusedParameters`)

## 누적 규칙
<!-- FlowSet 실행 중 실패 패턴 발견 시 자동 추가 -->
