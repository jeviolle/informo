# Informo 

A ruby gem for retrieving info from linux systems. Informo make's it easy to get system information for Linux systems from inside ruby scripts. Currently it is a glorified wrapper around existing native commands and tries to avoid reinventing wheels that already exist inside GNU/Linux

## Installation

clone this repo

```
$ gem install informo
```

## Documentation

[rubydoc](http://rubydoc.info/gems/informo/frames)

## Usage

```
require 'informo'
```

The following top level classes exist:

- Informo::Bios
- Informo::Dpkg
- Informo::Memory
- Informo::Network
- Informo::Processor
- Informo::Rpm
- Informo::Storage
- Informo::System


