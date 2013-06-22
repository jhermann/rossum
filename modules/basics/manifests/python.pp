##############################################################################
# Class: basics::python
#
# Keep basic Python modules up to date.
#
##############################################################################
class basics::python {
    $packages = [
        "python",
        "python-dev",
        "python-lxml",
        "python-pip",
        "python-pkg-resources",
        "python-virtualenv",
    ]
    package {$packages: ensure => latest }
}
