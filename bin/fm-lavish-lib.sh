# shellcheck shell=bash
# Home-local Lavish browser-integration preference.
#
# config/lavish-disabled is an inherited, gitignored presence flag. Any
# filesystem entry at that path disables Firstmate-owned Lavish requirements and
# launch surfaces for the home. Treating even an unsafe or malformed entry as
# disabled is intentional: a broken opt-out must never enable a browser-backed
# process by accident.
#
# Usage: . bin/fm-lavish-lib.sh
#        fm_lavish_disabled [home]

FM_LAVISH_DISABLED_REL="config/lavish-disabled"

fm_lavish_disabled() {  # [home]
  local home=${1:-${FM_HOME:-}} config
  [ -n "$home" ] || return 1
  config=${FM_CONFIG_OVERRIDE:-$home/config}
  [ -e "$config/${FM_LAVISH_DISABLED_REL#config/}" ] \
    || [ -L "$config/${FM_LAVISH_DISABLED_REL#config/}" ]
}
