# LuaShiftOut

[![MIT License](https://img.shields.io/github/license/serega404/LuaShiftOut)](https://github.com/serega404/LuaShiftOut/blob/main/LICENSE)

Port of the Arduino shiftOut function.

## Installation <sub><sup>(for rasbian and debian-based)</sup></sub>

``` bash
sudo apt install luarocks lua-bitop
sudo luarocks install lua-periphery
```

## Usage

``` lua
require("shiftOut")

register = shiftOut:new(LatchPin, DataPin, ClockPin)

register:shiftOut("11000000") -- string value
register:shiftOut(192) -- decimal digit value
```

## Modules

* [lua-periphery](https://github.com/vsergeev/lua-periphery)
* [BitOp](http://bitop.luajit.org/)

## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Feel free to contribute to this project.

## License

Distributed under the MIT License. See [`LICENSE`](./LICENSE) for more information.
