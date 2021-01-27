# mkEmbedded
mkEmbedded is an embedded environment package builder designed with compatibility with the Arduino set of packages in mind. It aims to produce programs without the use of complex and broken package management systems, and reduce the amount of restriction encountered when trying to interface with the arduino editor or the arduino-ctl command line toolkit. 

## Expected features:
fetchFromArduinoLibs
compileEmbedded
architecture parser for the arduino standard (avr-baremetal and similar) to feed into the compiler
