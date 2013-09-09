function _prlctl_commands() {
    local ret=1 state
    _arguments ':subcommand:->subcommand' && ret=0

    case $state in
      subcommand)
        subcommands=(
          "list:List all running instances"
          "reset:Reset UIID"
          "delete:Delete UIID"
        )
        _describe -t subcommands 'prlctl subcommands' subcommands && ret=0
    esac

    return ret
}

function _prlctl_commands_auto() {
	prlctl | sed "1,/Supported actions are:/d"  | awk '/^  [a-z]+/ { print $1 }'
}

compdef _prlctl_commands_auto prlctl