#!/usr/bin/env bash

function __ {
  echo "$@"
}

function __make_ansi {
  next=$1 && shift
  echo "\[\e[$(__$next $@)m\]"
}

function __make_echo {
  next=$1 && shift
  echo "\033[$(__$next $@)m"
}


function __reset {
  next=$1 && shift
  out="$(__$next $@)"
  echo "0${out:+;${out}}"
}

function __bold {
  next=$1 && shift
  out="$(__$next $@)"
  echo "${out:+${out};}1"
}

function __faint {
  next=$1 && shift
  out="$(__$next $@)"
  echo "${out:+${out};}2"
}

function __italic {
  next=$1 && shift
  out="$(__$next $@)"
  echo "${out:+${out};}3"
}

function __underline {
  next=$1 && shift
  out="$(__$next $@)"
  echo "${out:+${out};}4"
}

function __negative {
  next=$1 && shift
  out="$(__$next $@)"
  echo "${out:+${out};}7"
}

function __crossed {
  next=$1 && shift
  out="$(__$next $@)"
  echo "${out:+${out};}8"
}


function __color_normal_fg {
  echo "3$1"
}

function __color_normal_bg {
  echo "4$1"
}

function __color_bright_fg {
  echo "9$1"
}

function __color_bright_bg {
  echo "10$1"
}


function __color_black   {
  echo "0"
}

function __color_red   {
  echo "1"
}

function __color_green   {
  echo "2"
}

function __color_yellow  {
  echo "3"
}

function __color_blue  {
  echo "4"
}

function __color_magenta {
  echo "5"
}

function __color_cyan  {
  echo "6"
}

function __color_white   {
  echo "7"
}

function __color_rgb {
  r=$1 && g=$2 && b=$3
  [[ r == g && g == b ]] && echo $(( $r / 11 + 232 )) && return # gray range above 232
  echo "8;5;$(( ($r * 36  + $b * 6 + $g) / 51 + 16 ))"
}

function __color {
  color=$1 && shift
  case "$1" in
    fg|bg) side="$1" && shift ;;
    *) side=fg;;
  esac
  case "$1" in
    normal|bright) mode="$1" && shift;;
    *) mode=normal;;
  esac
  [[ $color == "rgb" ]] && rgb="$1 $2 $3" && shift 3

  next=$1 && shift
  out="$(__$next $@)"
  echo "$(__color_${mode}_${side} $(__color_${color} $rgb))${out:+;${out}}"
}


function __black   {
  echo "$(__color black $@)"
}

function __red   {
  echo "$(__color red $@)"
}

function __green   {
  echo "$(__color green $@)"
}

function __yellow  {
  echo "$(__color yellow $@)"
}

function __blue  {
  echo "$(__color blue $@)"
}

function __magenta {
  echo "$(__color magenta $@)"
}

function __cyan  {
  echo "$(__color cyan $@)"
}

function __white   {
  echo "$(__color white $@)"
}

function __rgb {
  echo "$(__color rgb $@)"
}


function __color_parse {
  next=$1 && shift
  echo "$(__$next $@)"
}

function color {
  echo "$(__color_parse make_ansi $@)"
}

function echo_color {
  echo "$(__color_parse make_echo $@)"
}


black="$(color reset black)"
red="$(color reset red)"
green="$(color reset green)"
yellow="$(color reset yellow)"
blue="$(color reset blue)"
purple="$(color reset magenta)"
cyan="$(color reset cyan)"
white="$(color reset white bold)"
orange="$(color reset red fg bright)"

bold_black="$(color black bold)"
bold_red="$(color red bold)"
bold_green="$(color green bold)"
bold_yellow="$(color yellow bold)"
bold_blue="$(color blue bold)"
bold_purple="$(color magenta bold)"
bold_cyan="$(color cyan bold)"
bold_white="$(color white bold)"
bold_orange="$(color red fg bright bold)"

underline_black="$(color black underline)"
underline_red="$(color red underline)"
underline_green="$(color green underline)"
underline_yellow="$(color yellow underline)"
underline_blue="$(color blue underline)"
underline_purple="$(color magenta underline)"
underline_cyan="$(color cyan underline)"
underline_white="$(color white underline)"
underline_orange="$(color red fg bright underline)"

background_black="$(color black bg)"
background_red="$(color red bg)"
background_green="$(color green bg)"
background_yellow="$(color yellow bg)"
background_blue="$(color blue bg)"
background_purple="$(color magenta bg)"
background_cyan="$(color cyan bg)"
background_white="$(color white bg bold)"
background_orange="$(color red bg bright)"

normal="$(color reset)"
reset_color="$(__make_ansi '' 39)"

# These colors are meant to be used with `echo -e`
echo_black="$(echo_color reset black)"
echo_red="$(echo_color reset red)"
echo_green="$(echo_color reset green)"
echo_yellow="$(echo_color reset yellow)"
echo_blue="$(echo_color reset blue)"
echo_purple="$(echo_color reset magenta)"
echo_cyan="$(echo_color reset cyan)"
echo_white="$(echo_color reset white bold)"
echo_orange="$(echo_color reset red fg bright)"

echo_bold_black="$(echo_color black bold)"
echo_bold_red="$(echo_color red bold)"
echo_bold_green="$(echo_color green bold)"
echo_bold_yellow="$(echo_color yellow bold)"
echo_bold_blue="$(echo_color blue bold)"
echo_bold_purple="$(echo_color magenta bold)"
echo_bold_cyan="$(echo_color cyan bold)"
echo_bold_white="$(echo_color white bold)"
echo_bold_orange="$(echo_color red fg bright bold)"

echo_underline_black="$(echo_color black underline)"
echo_underline_red="$(echo_color red underline)"
echo_underline_green="$(echo_color green underline)"
echo_underline_yellow="$(echo_color yellow underline)"
echo_underline_blue="$(echo_color blue underline)"
echo_underline_purple="$(echo_color magenta underline)"
echo_underline_cyan="$(echo_color cyan underline)"
echo_underline_white="$(echo_color white underline)"
echo_underline_orange="$(echo_color red fg bright underline)"

echo_background_black="$(echo_color black bg)"
echo_background_red="$(echo_color red bg)"
echo_background_green="$(echo_color green bg)"
echo_background_yellow="$(echo_color yellow bg)"
echo_background_blue="$(echo_color blue bg)"
echo_background_purple="$(echo_color magenta bg)"
echo_background_cyan="$(echo_color cyan bg)"
echo_background_white="$(echo_color white bg bold)"
echo_background_orange="$(echo_color red bg bright)"

echo_normal="$(echo_color reset)"
echo_reset_color="$(__make_echo '' 39)"

THEME_PROMPT_HOST='\H'
SCM_THEME_PROMPT_DIRTY=' ✗'
SCM_THEME_PROMPT_CLEAN=' ✓'
SCM_THEME_PROMPT_PREFIX=' |'
SCM_THEME_PROMPT_SUFFIX='|'

SCM_GIT='git'
SCM_GIT_CHAR='±'

SCM_HG='hg'
SCM_HG_CHAR='☿'

SCM_SVN='svn'
SCM_SVN_CHAR='⑆'

SCM_NONE='NONE'
SCM_NONE_CHAR='○'

RVM_THEME_PROMPT_PREFIX=' |'
RVM_THEME_PROMPT_SUFFIX='|'

VIRTUALENV_THEME_PROMPT_PREFIX=' |'
VIRTUALENV_THEME_PROMPT_SUFFIX='|'

RBENV_THEME_PROMPT_PREFIX=' |'
RBENV_THEME_PROMPT_SUFFIX='|'

RBFU_THEME_PROMPT_PREFIX=' |'
RBFU_THEME_PROMPT_SUFFIX='|'

function scm {
  if [[ -f .git/HEAD ]]; then SCM=$SCM_GIT
  elif which git &> /dev/null && [[ -n "$(git symbolic-ref HEAD 2> /dev/null)" ]]; then SCM=$SCM_GIT
  elif [[ -d .hg ]]; then SCM=$SCM_HG
  elif which hg &> /dev/null && [[ -n "$(hg root 2> /dev/null)" ]]; then SCM=$SCM_HG
  elif [[ -d .svn ]]; then SCM=$SCM_SVN
  else SCM=$SCM_NONE
  fi
}

function scm_prompt_char {
  if [[ -z $SCM ]]; then scm; fi
  if [[ $SCM == $SCM_GIT ]]; then SCM_CHAR=$SCM_GIT_CHAR
  elif [[ $SCM == $SCM_HG ]]; then SCM_CHAR=$SCM_HG_CHAR
  elif [[ $SCM == $SCM_SVN ]]; then SCM_CHAR=$SCM_SVN_CHAR
  else SCM_CHAR=$SCM_NONE_CHAR
  fi
}

function scm_prompt_vars {
  scm
  scm_prompt_char
  SCM_DIRTY=0
  SCM_STATE=''
  [[ $SCM == $SCM_GIT ]] && git_prompt_vars && return
  [[ $SCM == $SCM_HG ]] && hg_prompt_vars && return
  [[ $SCM == $SCM_SVN ]] && svn_prompt_vars && return
}

function scm_prompt_info {
  scm
  scm_prompt_char
  SCM_DIRTY=0
  SCM_STATE=''
  [[ $SCM == $SCM_GIT ]] && git_prompt_info && return
  [[ $SCM == $SCM_HG ]] && hg_prompt_info && return
  [[ $SCM == $SCM_SVN ]] && svn_prompt_info && return
}

function git_prompt_vars {
  SCM_GIT_AHEAD=''
  SCM_GIT_BEHIND=''
  SCM_GIT_STASH=''
  if [[ "$(git config --get bash-it.hide-status)" != "1" ]]; then
    local status="$(git status -bs --porcelain 2> /dev/null)"
    if [[ -n "$(grep -v ^# <<< "${status}")" ]]; then
      SCM_DIRTY=1
      SCM_STATE=${GIT_THEME_PROMPT_DIRTY:-$SCM_THEME_PROMPT_DIRTY}
    else
      SCM_DIRTY=0
      SCM_STATE=${GIT_THEME_PROMPT_CLEAN:-$SCM_THEME_PROMPT_CLEAN}
    fi
  else
    SCM_DIRTY=0
    SCM_STATE=${GIT_THEME_PROMPT_CLEAN:-$SCM_THEME_PROMPT_CLEAN}
  fi
  SCM_PREFIX=${GIT_THEME_PROMPT_PREFIX:-$SCM_THEME_PROMPT_PREFIX}
  SCM_SUFFIX=${GIT_THEME_PROMPT_SUFFIX:-$SCM_THEME_PROMPT_SUFFIX}

  local ref=$(git symbolic-ref -q --short HEAD 2> /dev/null)
  if [[ -n "$ref" ]]; then
    SCM_BRANCH=$ref
    SCM_IS_BRANCH=1
    SCM_IS_TAG=0
  else
    SCM_BRANCH=$(git describe --tags --exact-match 2> /dev/null)
    SCM_IS_TAG=1
    SCM_IS_BRANCH=0
  fi
  # SCM_BRANCH=$(git symbolic-ref -q --short HEAD || git describe --tags --exact-match 2> /dev/null)
  SCM_CHANGE=$(git rev-parse HEAD 2>/dev/null)
  local ahead_re='.+ahead ([0-9]+).+'
  local behind_re='.+behind ([0-9]+).+'
  [[ "${status}" =~ ${ahead_re} ]] && SCM_GIT_AHEAD=" ${SCM_GIT_AHEAD_CHAR}${BASH_REMATCH[1]}"
  [[ "${status}" =~ ${behind_re} ]] && SCM_GIT_BEHIND=" ${SCM_GIT_BEHIND_CHAR}${BASH_REMATCH[1]}"
  local stash_count="$(git stash list 2> /dev/null | wc -l | tr -d ' ')"
  [[ "${stash_count}" -gt 0 ]] && SCM_GIT_STASH=" {${stash_count}}"
}

function svn_prompt_vars {
  if [[ -n $(svn status 2> /dev/null) ]]; then
    SCM_DIRTY=1
      SCM_STATE=${SVN_THEME_PROMPT_DIRTY:-$SCM_THEME_PROMPT_DIRTY}
  else
    SCM_DIRTY=0
      SCM_STATE=${SVN_THEME_PROMPT_CLEAN:-$SCM_THEME_PROMPT_CLEAN}
  fi
  SCM_PREFIX=${SVN_THEME_PROMPT_PREFIX:-$SCM_THEME_PROMPT_PREFIX}
  SCM_SUFFIX=${SVN_THEME_PROMPT_SUFFIX:-$SCM_THEME_PROMPT_SUFFIX}
  SCM_BRANCH=$(svn info 2> /dev/null | awk -F/ '/^URL:/ { for (i=0; i<=NF; i++) { if ($i == "branches" || $i == "tags" ) { print $(i+1); break }; if ($i == "trunk") { print $i; break } } }') || return
  SCM_CHANGE=$(svn info 2> /dev/null | sed -ne 's#^Revision: ##p' )
}

function hg_prompt_vars {
    if [[ -n $(hg status 2> /dev/null) ]]; then
      SCM_DIRTY=1
        SCM_STATE=${HG_THEME_PROMPT_DIRTY:-$SCM_THEME_PROMPT_DIRTY}
    else
      SCM_DIRTY=0
        SCM_STATE=${HG_THEME_PROMPT_CLEAN:-$SCM_THEME_PROMPT_CLEAN}
    fi
    SCM_PREFIX=${HG_THEME_PROMPT_PREFIX:-$SCM_THEME_PROMPT_PREFIX}
    SCM_SUFFIX=${HG_THEME_PROMPT_SUFFIX:-$SCM_THEME_PROMPT_SUFFIX}
    SCM_BRANCH=$(hg summary 2> /dev/null | grep branch: | awk '{print $2}')
    SCM_CHANGE=$(hg summary 2> /dev/null | grep parent: | awk '{print $2}')
}

function rvm_version_prompt {
  if which rvm &> /dev/null; then
    rvm=$(rvm tools identifier) || return
    echo -e "$RVM_THEME_PROMPT_PREFIX$rvm$RVM_THEME_PROMPT_SUFFIX"
  fi
}

function rbenv_version_prompt {
  if which rbenv &> /dev/null; then
    rbenv=$(rbenv version-name) || return
    $(rbenv commands | grep -q gemset) && gemset=$(rbenv gemset active 2> /dev/null) && rbenv="$rbenv@${gemset%% *}"
    echo -e "$RBENV_THEME_PROMPT_PREFIX$rbenv$RBENV_THEME_PROMPT_SUFFIX"
  fi
}

function rbfu_version_prompt {
  if [[ $RBFU_RUBY_VERSION ]]; then
    echo -e "${RBFU_THEME_PROMPT_PREFIX}${RBFU_RUBY_VERSION}${RBFU_THEME_PROMPT_SUFFIX}"
  fi
}

function chruby_version_prompt {
  if declare -f -F chruby &> /dev/null; then
    if declare -f -F chruby_auto &> /dev/null; then
      chruby_auto
    fi

    ruby_version=$(ruby --version | awk '{print $1, $2;}') || return

    if [[ ! $(chruby | grep '*') ]]; then
      ruby_version="${ruby_version} (system)"
    fi
    echo -e "${CHRUBY_THEME_PROMPT_PREFIX}${ruby_version}${CHRUBY_THEME_PROMPT_SUFFIX}"
  fi
}

function ruby_version_prompt {
  echo -e "$(rbfu_version_prompt)$(rbenv_version_prompt)$(rvm_version_prompt)$(chruby_version_prompt)"
}

function virtualenv_prompt {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    virtualenv=`basename "$VIRTUAL_ENV"`
    echo -e "$VIRTUALENV_THEME_PROMPT_PREFIX$virtualenv$VIRTUALENV_THEME_PROMPT_SUFFIX"
  fi
}

# backwards-compatibility
function git_prompt_info {
  git_prompt_vars
  echo -e "$SCM_PREFIX$SCM_BRANCH$SCM_STATE$SCM_SUFFIX"
}

function svn_prompt_info {
  svn_prompt_vars
  echo -e "$SCM_PREFIX$SCM_BRANCH$SCM_STATE$SCM_SUFFIX"
}

function hg_prompt_info() {
  hg_prompt_vars
  echo -e "$SCM_PREFIX$SCM_BRANCH:${SCM_CHANGE#*:}$SCM_STATE$SCM_SUFFIX"
}

function scm_char {
  scm_prompt_char
  echo -e "$SCM_CHAR"
}

function prompt_char {
    scm_char
}

SHELL_SSH_CHAR="⌁ "
SHELL_THEME_PROMPT_COLOR=32
SHELL_SSH_THEME_PROMPT_COLOR=208

VIRTUALENV_CHAR="ⓔ "
VIRTUALENV_THEME_PROMPT_COLOR=35

SCM_NONE_CHAR=""
SCM_GIT_CHAR="⎇  "
SCM_GIT_BEHIND_CHAR="↓"
SCM_GIT_AHEAD_CHAR="↑"
SCM_THEME_PROMPT_CLEAN=""
SCM_THEME_PROMPT_DIRTY=""
SCM_THEME_PROMPT_COLOR=238
SCM_THEME_PROMPT_CLEAN_COLOR=231
SCM_THEME_PROMPT_DIRTY_COLOR=220

CWD_THEME_PROMPT_COLOR=240

LAST_STATUS_THEME_PROMPT_COLOR=52

function set_rgb_color {
    if [[ "${1}" != "-" ]]; then
        fg="38;5;${1}"
    fi
    if [[ "${2}" != "-" ]]; then
        bg="48;5;${2}"
        [[ -n "${fg}" ]] && bg=";${bg}"
    fi
    echo -e "\[\033[${fg}${bg}m\]"
}

function powerline_shell_prompt {
    if [[ -n "${SSH_CLIENT}" ]]; then
        SHELL_PROMPT="${bold_white}$(set_rgb_color - ${SHELL_SSH_THEME_PROMPT_COLOR}) ${SHELL_SSH_CHAR}\u@\h ${normal}"
    else
        SHELL_PROMPT="${bold_white}$(set_rgb_color - ${SHELL_THEME_PROMPT_COLOR}) \u ${normal}"
    fi
}

function powerline_virtualenv_prompt {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        virtualenv=$(basename "$VIRTUAL_ENV")
        VIRTUALENV_PROMPT="$(set_rgb_color - ${VIRTUALENV_THEME_PROMPT_COLOR}) ${VIRTUALENV_CHAR}$virtualenv ${normal}"
    else
        VIRTUALENV_PROMPT=""
    fi
}

function powerline_scm_prompt {
    scm_prompt_vars

    if [[ "${SCM_NONE_CHAR}" != "${SCM_CHAR}" ]]; then
        if [[ "${SCM_DIRTY}" -eq 1 ]]; then
            SCM_PROMPT="$(set_rgb_color ${SCM_THEME_PROMPT_DIRTY_COLOR} ${SCM_THEME_PROMPT_COLOR})"
        else
            SCM_PROMPT="$(set_rgb_color ${SCM_THEME_PROMPT_CLEAN_COLOR} ${SCM_THEME_PROMPT_COLOR})"
        fi
        [[ "${SCM_GIT_CHAR}" == "${SCM_CHAR}" ]] && SCM_PROMPT+=" ${SCM_CHAR}${SCM_BRANCH}${SCM_STATE}${SCM_GIT_BEHIND}${SCM_GIT_AHEAD}${SCM_GIT_STASH}"
        SCM_PROMPT="${SCM_PROMPT} ${normal}"
    else
        SCM_PROMPT=""
    fi
}

function powerline_cwd_prompt {
    CWD_PROMPT="${THEME_PROMPT_SEPARATOR}${normal}$(set_rgb_color - ${CWD_THEME_PROMPT_COLOR}) \w ${normal}$(set_rgb_color ${CWD_THEME_PROMPT_COLOR} -)${normal}"
}

function powerline_last_status_prompt {
    if [[ "$1" -eq 0 ]]; then
        LAST_STATUS_PROMPT=""
    else
        LAST_STATUS_PROMPT="$(set_rgb_color - ${LAST_STATUS_THEME_PROMPT_COLOR}) ${LAST_STATUS} ${normal}$(set_rgb_color ${LAST_STATUS_THEME_PROMPT_COLOR} -)${THEME_PROMPT_SEPARATOR}${normal}"
    fi
}

function show_icon() {
  ENVIRONMENT=""
  # if [[ ! -z $NETFLIX_ENVIRONMENT ]]; then
  #   if [[ $NETFLIX_ENVIRONMENT == "prod" ]]; then
  #     ENVIRONMENT="🔴 "
  #   else
  #     ENVIRONMENT="⚪️ "
  #   fi
  # fi
}

function powerline_prompt_command() {
    local LAST_STATUS="$?"

    show_icon
    powerline_shell_prompt
    powerline_virtualenv_prompt
    powerline_scm_prompt
    powerline_cwd_prompt
    powerline_last_status_prompt LAST_STATUS

    PS1="${ENVIRONMENT}${SHELL_PROMPT}${VIRTUALENV_PROMPT}${SCM_PROMPT}${CWD_PROMPT}${LAST_STATUS_PROMPT} "
}

PROMPT_COMMAND=powerline_prompt_command
