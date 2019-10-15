eval "$(fnm env --multi)"

function autoswitch_to_node_version() {
  if [ -f '.nvmrc' ]; then
    requested_node_version="$(cat .nvmrc)"
    fnm use "$requested_node_version"
  fi
}

function context_switch() {
  autoswitch_to_node_version
  # autoswitch_conda_env
  context=$(echo $PWD | sed -E 's/^\/Users\/emurphy\/code\/([^/]+).*$/\1/')
  if ! [[ $context =~ / ]]; then
    export AWS_PROFILE=$context
  fi
}


cd () { builtin cd "$@" && context_switch; }
pushd () { builtin pushd "$@" && context_switch; }
popd () { builtin popd "$@" && context_switch; }
cd .