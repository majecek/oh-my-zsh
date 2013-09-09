function _prlctl_commands() {
    local ret=1 state
    _arguments ':subcommand:->subcommand' && ret=0

    case $state in
      subcommand)
        subcommands=(
          "list:List all running instances"
          "reset:Reset"
        )
        _describe -t subcommands 'prlctl subcommands' subcommands && ret=0
    esac

    return ret
}

compdef _prlctl_commands prlctl