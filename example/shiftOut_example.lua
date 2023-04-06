require("shiftOut")

LatchPin = 4
DataPin = 2
ClockPin = 3

register = shiftOut:new(LatchPin, DataPin, ClockPin)

register:shiftOut("11000000") -- string value
register:shiftOut(192) -- decimal digit value

-- By default bit order is MSBFIRST, but you can change it to LSBFIRST
register:shiftOut("11000000", LSBFIRST)
register:shiftOut(192, MSBFIRST)
