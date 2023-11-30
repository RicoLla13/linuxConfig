setopt PROMPT_SUBST
autoload colors
colors

right_triangle() {
   echo $'\ue0b0'
}

arrow_start() {
   echo "%{$FG[$ARROW_FG]%}%{$BG[$ARROW_BG]%}%B"
}

arrow_end() {
   echo "%b%{$reset_color%}%{$FG[$NEXT_ARROW_FG]%}%{$BG[$NEXT_ARROW_BG]%}$(right_triangle)%{$reset_color%}"
}

prompt_indicator() {
   echo $'%F{002}%B\u276f%b%f'
}

ok_username() {
   ARROW_FG="016"
   ARROW_BG="011"
   NEXT_ARROW_BG="009"
   NEXT_ARROW_FG="011"
   echo "$(arrow_start) %n $(arrow_end)"
}

err_username() {
   ARROW_FG="016"
   ARROW_BG="160"
   NEXT_ARROW_BG="009"
   NEXT_ARROW_FG="160"
   echo "$(arrow_start) %n $(arrow_end)"
}

# return err_username if there are errors, ok_username otherwise
username() {
   echo "%(?.$(ok_username).$(err_username))"
}

directory() {
   ARROW_FG="016"
   ARROW_BG="009"
   NEXT_ARROW_BG=""
   NEXT_ARROW_FG="009"
   echo "$(arrow_start) %1~ $(arrow_end)"
}

git_prompt() {
   GITCOL="011"
   echo "%F{$GITCOL}$(git_prompt_info)%f%{$reset_color%}"
}

current_time() {
   TIME_COL="015"
   ARROW_COL="010"
   ARROW_CHAR="\u27a6"
   echo "%F{$ARROW_COL}$ARROW_CHAR%f%F{$TIME_COL}%t%f%{$reset_color%}"
}

ZSH_THEME_GIT_PROMPT_PREFIX="git:"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='$(username)$(directory)$(prompt_indicator) '
RPROMPT='$(git_prompt) $(current_time)'
