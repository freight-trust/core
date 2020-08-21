# A Library of fundamental values
# Intended for use by other scripts, not to be executed directly.

# chmod -x ./lib/anchors.sh
# chmod -x ./lib/anchors.sh
# chmod -x ./lib/anchors.sh
# chmod -x ./lib/anchors.sh


# Set non-'false' by nearly every CI system in existence.
CI="${CI:-false}"  # true: _unlikely_ human-presence at the controls.
[[ $CI == "false" ]] || CI='true'  # Err on the side of automation

# Absolute realpath anchors for important directory tree roots.
LIB_PATH=$(realpath $(dirname "${BASH_SOURCE[0]}"))
REPO_PATH=$(realpath "$LIB_PATH/../")  # Specific to THIS repository
SCRIPT_PATH=$(realpath "$(dirname $0)")
