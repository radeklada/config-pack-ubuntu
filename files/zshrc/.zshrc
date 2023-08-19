export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=( 
    git
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT='%F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '

export ANSIBLE_CONFIG=/etc/ansible/.ansible.cfg

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

alias k='kubectl'
alias t="terraform"
gcpp() {
  gcloud config set project $(gcloud projects list |  fzf --header-lines 1 --reverse | awk '{print $1}')
  echo -e "GCP project set to: \e[34m$(gcloud config get project)\e[0m"
}

base64_cert ()
{
    echo -n $1 | base64 -d | openssl x509 -text | grep --color='always' 'Not Before\|Not After\|Subject Alternative Name\|$' | batcat --color always --paging always
}

alias myip='dig @resolver4.opendns.com myip.opendns.com +short' 
alias myip4='dig @resolver4.opendns.com myip.opendns.com +short -4'
alias myip6='dig @resolver1.ipv6-sandbox.opendns.com AAAA myip.opendns.com +short -6'
