# 제작 파이프라인 상태

> AI 애니메이션 제작 도구별 진행 상태 및 워크플로우 참조.

## 파이프라인 개요

```
[1] 프롬프트 작성 ──→ [2] ComfyUI 이미지 생성 ──→ [3] Runway/Kling 영상 생성
        |                      |                           |
   (텍스트 작업)        (캐릭터 + 배경)            (배경 영상 + 전환)
        |                      |                           |
      완료               Phase 2 예정              Phase 3 예정
                                                           |
                               ┌───────────────────────────┘
                               v
                    [4] 캐릭터 애니메이션 ──→ [5] 합성/편집 ──→ [6] 최종 출력
                      (AnimateDiff)         (AE/DaVinci)      (MP4 FHD)
                     Phase 4 예정          Phase 5 예정     Phase 6 예정
```

## 도구별 상태

### ComfyUI (SDXL + ControlNet)
- **용도**: 캐릭터 레퍼런스 이미지 + 배경 컨셉아트 생성
- **상태**: 프롬프트 완료, 생성 미착수 (Phase 2)
- **체크포인트**: dreamshaperXL_v21TurboDPMSDE / juggernautXL_v9
- **LoRA**: watercolor_style_sdxl (현실) / prismatic_surreal_sdxl (미시)
- **부가 도구**: IP-Adapter (캐릭터 일관성), AnimateDiff (모션)

### IP-Adapter + LoRA
- **용도**: 에피소드 간 캐릭터 동일성 유지
- **상태**: 미착수
- **계획**: 초은이 정면 기준 이미지 → IP-Adapter 레퍼런스 등록 → LoRA 학습 (20~30장)
- **IP-Adapter weight**: 현실 0.6~0.8, 미시 0.5
- **LoRA trigger**: choeun_girl, grandpa_scientist, mungyi_tardigrade

### Runway / Kling (img2video)
- **용도**: 배경 영상 생성, 장면 전환
- **상태**: 프롬프트 완료, 생성 미착수 (Phase 3)
- **프롬프트 파일**: `production/prompts/scenes/ep01-runway-prompts.md`
- **Runway**: Gen-3, 상세 모션 지시
- **Kling**: 간결 프롬프트 버전

### AnimateDiff
- **용도**: 캐릭터 모션 생성
- **상태**: 미착수 (Phase 4)

### After Effects / DaVinci Resolve
- **용도**: 레이어 합성, 색보정, 최종 편집
- **상태**: 미착수 (Phase 5)
- **색보정 가이드**: `production/characters/color-palette.md` 섹션 5 참조

## 워크플로우 파일 위치
- 프롬프트: `production/prompts/`
- 캐릭터 레퍼런스: `production/characters/` (생성 후)
- 에피소드 에셋: `production/episodes/ep01/` (생성 후)
- ComfyUI 워크플로우 JSON: `production/prompts/workflows/` (미생성)
