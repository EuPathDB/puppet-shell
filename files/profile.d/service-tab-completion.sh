#
# bash tab completion for /sbin/service
#
# $Id$
# $URL$

_service() {
  local servicedir="/etc/init.d"  
  local cur="${COMP_WORDS[COMP_CWORD]}"
  local prev="${COMP_WORDS[COMP_CWORD-1]}"

  case "$prev" in
    service|/sbin/service)

      # complete on scripts in /etc/init.d

      local services="$(find $servicedir -follow -maxdepth 1 -type f -o -type l |\
                          xargs -n1 -i basename '{}')"
      COMPREPLY=( $(compgen -W "$services" -- "$cur") )
      ;;
    *)

      # (attempt to) complete on values from Usage help in
      # init script. Assumes the common help stucture:
      #     echo $"Usage: $0 {start|stop|status|condrestart|restart}"

      [ ! -e "$servicedir/$prev" ] && return
      local usage="$(egrep 'echo.+Usage:' $servicedir/$prev | \
                       sed  's/.*{//' | \
                       sed 's/}.*//' | \
                       sed 's/|/ /g')"
      COMPREPLY=( $(compgen -W "$usage" -- "$cur") )
      ;;
  esac

}
complete -F "_service" "service"
complete -F "_service" "/sbin/service"
