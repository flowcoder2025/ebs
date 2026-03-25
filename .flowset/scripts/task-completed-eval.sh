#!/usr/bin/env bash
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# TaskCompleted hook — 태스크 완료 시 평가 필요 여부 알림
# evaluator 에이전트 spawn을 리드에게 안내

EVAL_DIR=".flowset/eval-results"
mkdir -p "$EVAL_DIR"

# 현재 완료된 태스크에서 WI 번호 추출 시도
# hook context에서 태스크 정보 확인
TASK_SUBJECT="${TASK_SUBJECT:-unknown}"

# WI-NNN 패턴 매칭
WI_NUMBER=$(echo "$TASK_SUBJECT" | grep -oP 'WI-\d{3}' | head -1)

if [[ -z "$WI_NUMBER" ]]; then
  # WI 번호 없는 태스크는 평가 스킵
  exit 0
fi

# 이미 PASS된 WI는 스킵
if [[ -f "$EVAL_DIR/${WI_NUMBER}.pass" ]]; then
  exit 0
fi

# 스프린트 계약 존재 확인
SPRINT_NUM=$(echo "$WI_NUMBER" | grep -oP '\d{3}')
SPRINT_FILE=".flowset/contracts/sprint-${SPRINT_NUM}.md"

if [[ -f "$SPRINT_FILE" ]]; then
  echo "[eval] ${WI_NUMBER} 완료 — 평가자(evaluator) 실행이 필요합니다."
  echo "[eval] 스프린트 계약: ${SPRINT_FILE}"
  echo "[eval] 리드가 evaluator 서브에이전트를 spawn하여 채점해주세요."
fi
