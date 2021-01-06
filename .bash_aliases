function proxy-enable {
    export HTTP_PROXY=socks5://$(ip route show default | cut -d' ' -f 3):1080
    export HTTPS_PROXY=socks5://$(ip route show default | cut -d' ' -f 3):1080
    export NO_PROXY=localhost,127.0.0.1,gateway.docker.internal
}

function proxy-disable {
    export HTTP_PROXY=
    export HTTPS_PROXY=
}

function c {
    exec {fd_ccloud}>>/dev/stdout
    . <(ccloud-multitool --ppid $$ --stdout-fd $fd_ccloud "$@")
    exec {fd_ccloud}>&-
    }
source <(c completion bash --prog-name c)

alias f='(sudo dockerd &) ; sleep 1; sudo f5fpc-docker'
alias j='ssh -D :1080 jump01.cc.eu-de-1.cloud.sap'

alias ll='ls -lF'
alias ..='cd ..'
alias o='less -R'

alias gs='git status'
alias gl='git log --oneline --graph --decorate --color'
alias gf='git fetch --all'
alias gp='git pull'

alias k='u8s kubectl --'
alias kn='u8s kubectl get namespace'
alias kd='u8s kubectl get deployments'
alias kp='u8s kubectl get -o wide pods'
alias kl='u8s kubectl logs'

