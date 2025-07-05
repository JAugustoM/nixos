if test -n "$GH_SETUP"
    echo "gh setup completed previously!"
else
    gh auth setup-git
    gh auth login
    set -U GH_SETUP TRUE
end
