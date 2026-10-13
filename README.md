# PIPET MPS

가톨릭대학교 계량약리학연구소(PIPET) MPS 연구단 공식 페이지.
식품의약품안전처 출연연구개발사업 **RS-2024-00396711**
「3D-생체조직칩의 QSP 모델링을 활용한 임상시험 설계 방법 개발과 규제과학 인력 양성」(2024.4–2028.12)의 과제 관리와 성과를 다룬다.

사이트: https://pipetcpt.github.io/pipetmps/

## 구조

GitHub Pages는 `main` 브랜치의 `docs/` 폴더를 사이트 루트로 서비스한다.

- `docs/index.html` — 단일 페이지. 그림·로고 전부 data URI로 내장. 외부 의존은 Google Fonts(IBM Plex Sans KR) 뿐.
- `docs/og.png` — 링크 공유용 미리보기 이미지 (1200×630).
- `docs/favicon.svg` — 브라우저 탭 아이콘.
- `docs/.nojekyll` — GitHub Pages의 Jekyll 처리 비활성화.
- `deploy.sh` — 저장소 생성·푸시·Pages 소스 설정을 한 번에 처리.

## 갱신 방법

`docs/index.html`을 수정해 `main`에 push하면 1–2분 내 반영된다.
로드맵의 "오늘" 마커는 접속 시점 날짜로 자동 계산된다.

## 출처

본문 수치는 1단계 보고서(2025.11.05)와 2026.10.13 한국보건산업진흥원 제출 자료에 근거한다.
