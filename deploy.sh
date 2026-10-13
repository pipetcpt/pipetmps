#!/usr/bin/env bash
# PIPET MPS 사이트를 github.com/pipetcpt/pipetmps 에 올리고 GitHub Pages로 공개한다.
# 전제: git, gh(GitHub CLI) 설치, `gh auth login` 완료, pipetcpt 조직(또는 계정)에 repo 생성 권한.
set -euo pipefail

cd "$(dirname "$0")"

# 1) 저장소 생성 (이미 있으면 건너뜀)
if ! gh repo view pipetcpt/pipetmps >/dev/null 2>&1; then
  gh repo create pipetcpt/pipetmps --public \
    --description "PIPET MPS — 3D-생체조직칩 QSP 규제과학 연구단 (식약처 RS-2024-00396711)" \
    --homepage "https://pipetmps.com/"
fi

# 2) 커밋·푸시
git init -b main 2>/dev/null || git checkout -B main
git add -A
git commit -m "PIPET MPS 과제 관리·성과 페이지" || true
git remote remove origin 2>/dev/null || true
git remote add origin "https://github.com/pipetcpt/pipetmps.git"
git push -u origin main --force

# 3) Pages 소스를 main 브랜치의 /docs 폴더로 설정
gh api -X POST "repos/pipetcpt/pipetmps/pages" \
  -f build_type=legacy -f "source[branch]=main" -f "source[path]=/docs" >/dev/null 2>&1 \
  || gh api -X PUT "repos/pipetcpt/pipetmps/pages" \
       -f build_type=legacy -f "source[branch]=main" -f "source[path]=/docs" >/dev/null

# 4) 배포 완료 대기 후 주소 출력
until [ "$(gh api repos/pipetcpt/pipetmps/pages --jq .status)" != "building" ]; do sleep 5; done
echo "https://pipetmps.com/"
