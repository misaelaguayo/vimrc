if status is-interactive
    set -Ux ZELLIJ_AUTO_ATTACH
    set -Ux ZELLIJ_AUTO_EXIT
    eval (zellij setup --generate-auto-start fish | string collect)
end
