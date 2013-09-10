#! /bin/bash
#
# Apply Puppet manifest, using the default ENC, or one given on the command line
#
set -e
base=$(cd $(dirname "$0") && pwd)
self="$base/"$(basename "$0")

abspath() {
    echo $(cd $(dirname "$1") && pwd)/$(basename "$1")
}
apply() { # Apply manifests located in the same directory as this script
    puppet apply --node_terminus exec --external_nodes "$self" \
        --modulepath $base/modules $base/manifests/site.pp
}


action="$1"; test -z "$action" || shift

case "$action" in
    enc | "$(hostname -f)")
        # Callback from Puppet, see "--external_nodes" above
        cat ${ROSSUM_ENC:-/etc/puppet/rossum.yaml}
        ;;
    -* | -h | --help | help)
        echo "usage:" $(basename "$0") "[apply <enc.yaml>]"
        ;;
    apply)
        # Apply manifests, take optional ENC argument
        test -z "$1" || export ROSSUM_ENC=$(abspath "$1")
        apply
        ;;
    "")
        # Apply manifests with default ENC (or one already set in ROSSUM_ENC)
        apply
        ;;
    *)
        # Interpret any odd argument as an ENC filename
        export ROSSUM_ENC=$(abspath "$action")
        apply
        ;;
esac

