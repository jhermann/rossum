##############################################################################
# Class: python::yolk
#
# Install "yolk" as a tool.
#
##############################################################################
class python::yolk {
    include python

    # TODO: refactor into pip class
    exec { "yolk":
        command => "pip install yolk",
        creates => "/usr/local/bin/yolk",
    }
}

