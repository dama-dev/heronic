set -xe
ionic build --prod -- --base-href=/heronic/
(
    cd www
    git init -b github_pages
    git config --local user.email "bot"
    git config --global user.name "bot"
    git remote add origin git@github.com:dama-dev/heronic.git
    git fetch
    git reset origin/github_pages
    git add -A .
    git commit -m "deploy"
    GIT_SSH_COMMAND='ssh -i ../../../id_ed25519' git push origin github_pages
) || true
