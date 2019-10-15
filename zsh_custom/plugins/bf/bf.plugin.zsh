# Connect to VC's vpn through anyconnect
function vpnVC() {
  source "${SECRETS}/secrets.zsh"
  # launchctl load /Library/LaunchDaemons/com.cisco.anyconnect.vpnagentd.plist 2> /dev/null
  printf "CustomerVPN\n${BFVPN_USERNAME}\n${BFVPN_PW}\n" |
    /opt/cisco/anyconnect/bin/vpn -s connect ${BFVPN_USERNAME}
  unset_secrets
}

# Disconnect from anyconnect vpn
function vpnD() {
  /opt/cisco/anyconnect/bin/vpn -s disconnect
  # launchctl unload /Library/LaunchDaemons/com.cisco.anyconnect.vpnagentd.plist 2> /dev/null
}