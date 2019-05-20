# electronic-keyboard
this is a VerilogHDL project for building an electronic-keyboard.

# description
- beep.v is top module. It controls the Beep's enabled and connect the `beep_clk` module.
- beep_clk is a frequency division for building pitch which from `C5` to `B5`. And building `A4` for check if ths frequency is 440Hz.
