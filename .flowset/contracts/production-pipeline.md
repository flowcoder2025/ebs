# Production Pipeline Contract

## 팀 간 에셋 전달 규칙

### director → character
- 씬 브레이크다운에 캐릭터별 표정/동작/의상 지시 포함
- 파일: `production/storyboard/ep{NN}-scene-breakdown.md`

### director → visual
- 씬별 비주얼 키워드, 색감 톤, 카메라 앵글 지시
- 파일: `production/storyboard/ep{NN}-scene-breakdown.md`

### character → animation
- 확정된 캐릭터 레퍼런스 이미지 + LoRA 파일
- 경로: `production/characters/{name}/generated/`
- 네이밍: `{name}_ref_{angle}_{expression}.png`

### visual → animation
- 배경 이미지/영상 에셋
- 경로: `production/episodes/ep{NN}/backgrounds/`
- 네이밍: `scene{N}-{N}_{description}.{png|mp4}`

### animation → 최종 출력
- 합성 완료 영상
- 경로: `production/episodes/ep{NN}/composited/`
- 포맷: MP4, FHD (1920x1080), 16:9, 30fps

## 프롬프트 파일 규칙
- 모든 AI 생성 프롬프트는 `production/prompts/`에 기록
- 재현 가능하도록 시드값, 모델명, 파라미터 포함
- AI 기술 증빙자료의 근거가 됨
