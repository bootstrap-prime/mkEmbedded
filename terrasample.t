-- load arduino core
-- Core = terralib.includec("Arduino.h")

local avrtarget = terralib.newtarget {
  Triple = "avr-none";
  CPU = "atmega328p";
  Features = "";
  FloatABIHard = true;
}

function programloop()
  return 0
end

terralib.saveobj("helloterra", { main = programloop } )
