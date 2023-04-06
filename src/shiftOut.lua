shiftOut = {}

local GPIO = require('periphery').GPIO
local bit = require("bit")

LSBFIRST = 1
MSBFIRST = 0

function shiftOut:new(latchPin, dataPin, clockPin)

    local obj = {}
    obj.latchGPIO = GPIO(latchPin, "out")
    obj.dataGPIO = GPIO(dataPin, "out")
    obj.clockGPIO = GPIO(clockPin, "out")

    obj.latchGPIO:write(false)
    obj.dataGPIO:write(false)
    obj.clockGPIO:write(false)

    function obj:shiftOut(value, bitOrder)
        if bitOrder == nil then
            bitOrder = MSBFIRST
        end

        if type(value) == "number" then -- decimal
            for i = 1, 8 do
                if bitOrder == LSBFIRST then
                    self.dataGPIO:write(bit.band(value, 1))
                    value = bit.rshift(value, 1)
                else
                    self.dataGPIO:write(bit.band(value, 128) ~= 0)
                    value = bit.lshift(value, 1)
                end

                self.clockGPIO:write(true)
                self.clockGPIO:write(false)
            end
        elseif type(value) == "string" then -- string bits (Ex: "10100001")
            if bitOrder == LSBFIRST then
                value = string.reverse(value)
            end

            for i = 1, 8 do
                self.dataGPIO:write(string.sub(value, i, i) == "1")

                self.clockGPIO:write(true)
                self.clockGPIO:write(false)
            end

        end

        self.latchGPIO:write(true)
        self.latchGPIO:write(false)
    end

    setmetatable(obj, self)
    self.__index = self;
    return obj
end

return shiftOut
