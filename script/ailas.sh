# Git Auto Push
cat << 'EOF' >> ~/.bashrc
g() {
  if [ -z "$1" ]; then
    echo "사용법: g '커밋메시지' [브랜치명]"
    return 1
  fi
  
  local commit_msg="$1"
  local branch="${2:-$(git branch --show-current)}"
  
  git add -A && \
  git commit -m "$commit_msg" && \
  git push origin "$branch"
}
EOF
