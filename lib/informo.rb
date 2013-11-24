require 'informo/bios.rb'
require 'informo/dpkg.rb'
require 'informo/memory.rb'
require 'informo/network.rb'
require 'informo/processor.rb'
require 'informo/rpm.rb'
require 'informo/storage.rb'
require 'informo/system.rb'
require 'informo/version.rb'

##
# Informo make's it easy to get system information 
# for Linux systems from inside ruby scripts. Currently it is 
# a glorified wrapper around existing native commands and
# tries to avoid reinventing wheels that already exist inside
# GNU/Linux.
#
# The following classes are available:
#
# - Informo::BIOS
# - Informo::DPKG
# - Informo::MEMORY
# - Informo::NETWORK
# - Informo::PROCESSOR
# - Informo::RPM
# - Informo::STORAGE
# - Informo::SYSTEM
#
module Informo

end
