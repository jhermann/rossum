# rossum ![Logo](https://raw.github.com/jhermann/rossum/master/assets/puppet_library_med.png)

My collection of Puppet recipes. It's a dollhouse.

## Usage

ENCs (external node classifiers) are used to select which modules you want to activate,
so that you can use the manifests contained here on any host in unchanged form.

The provided `apply.sh` script is used to call Puppet in agent-less mode,
by default using `/etc/puppet/rossum.yaml` as the ENC configuration file. 
Alternatively, you can provide the ENC file on the command line, 
e.g. `./apply.sh examples/rossum.yaml`.


## Platforms
These manifests are known to work on:

* Ubuntu 12.04.2 LTS amd64

