VERSION 6, 0
DEVICE tracker, 0, LINE_TRACKER1
DEVICE led, 1, Right_LED
DEVICE motor-a, 3, Right_Motor
DEVICE irrx, 5, IR_RECEIVER1
DEVICE beeper, 6, SOUNDER1
DEVICE irtx, 7, IR_TRANSMITTER1
DEVICE motor-b, 8, Left_Motor
DEVICE led, 11, Left_LED
BEGIN MAIN
DATW _CALC 0 1
DATW Ed.EdisonVersion 1 1 2
DATW Ed.DistanceUnits 2 1 0
DATW Ed.Tempo 3 1 250
stinc $2

# FUNCTION:__main__
::_fun___main__
# Set intial tempo
movw $250 %68
# CALL:<program.Call name:Ed.LineTrackerLed with args:[<program.Value const:1>]>
stinc $2
movw $1 %_cpu:acc
stwaw $0
suba ::_fun_Ed.LineTrackerLed
stdec $2
# CTRL_MARKER:<program.ControlMarker marker:0 While start>
:_Control_0_start
# LOOP_CTRL:<program.LoopControl 0, name:While, test:<program.Value const:1>>
movw $1 %_cpu:acc
brz :_Control_0_else
# Inline function for Ed.Drive_INLINE_UNLIMITED:<program.Call name:Ed.Drive_INLINE_UNLIMITED with args:[<program.Value const:1>, <program.Value const:5>, <program.Value const:0>]>
movb $133 %81
movb $133 %31
# CTRL_MARKER:<program.ControlMarker marker:1 While start>
:_Control_1_start
# CALL:<program.Call <program.Value name:TEMP-0> = name:Ed.ReadLineState with args:[]>
stinc $2
suba ::_fun_Ed.ReadLineState
straw $0
stwaw $2
stdec $2
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:TEMP-0> Eq <program.Value const:0>>
straw $0
cmpw $0
brne :_int_0000
movw $1 %_cpu:acc
bra :_int_0001
:_int_0000
movw $0 %_cpu:acc
:_int_0001
# OPTIMISED OUT (STACK_WRITE): stwaw $1
# LOOP_CTRL:<program.LoopControl 1, name:While, test:<program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $1
brz :_Control_1_else
# CTRL_MARKER:<program.ControlMarker marker:1 While end>
bra :_Control_1_start
:_Control_1_else
:_Control_1_end
# CALL:<program.Call name:Ed.Drive_CM with args:[<program.Value const:2>, <program.Value const:5>, <program.Value const:2>]>
stinc $6
movw $2 %_cpu:acc
stwaw $0
movw $5 %_cpu:acc
stwaw $1
movw $2 %_cpu:acc
stwaw $2
suba ::_fun_Ed.Drive_CM
stdec $6
# CALL:<program.Call name:Ed.Drive_CM with args:[<program.Value const:8>, <program.Value const:8>, <program.Value const:180>]>
stinc $6
movw $8 %_cpu:acc
stwaw $0
movw $8 %_cpu:acc
stwaw $1
movw $180 %_cpu:acc
stwaw $2
suba ::_fun_Ed.Drive_CM
stdec $6
# CTRL_MARKER:<program.ControlMarker marker:0 While end>
bra :_Control_0_start
:_Control_0_else
:_Control_0_end
stop
:_end___main__

# FUNCTION:Ed.LineTrackerLed
::_fun_Ed.LineTrackerLed
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:value> BitAnd <program.Value const:1>>
straw $3
andw $1
# OPTIMISED OUT (STACK_WRITE): stwaw $4
# UAssign:<program.UAssign <program.Value name:value> = UAdd <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $4
stwaw $3
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:0>, <program.Value const:1>, <program.Value name:value>]>
# OPTIMISED OUT (STACK_READ): straw $3
conv
movb %_cpu:acc %01
ret
:_end_Ed.LineTrackerLed

# FUNCTION:Ed.FinishDrive_SPACE
::_fun_Ed.FinishDrive_SPACE
# CTRL_MARKER:<program.ControlMarker marker:7 While start>
:_Control_7_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:distance> Gt <program.Value const:0>>
straw $3
cmpw $0
brge :_int_0002
movw $1 %_cpu:acc
bra :_int_0003
:_int_0002
movw $0 %_cpu:acc
:_int_0003
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# LOOP_CTRL:<program.LoopControl 7, name:While, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $6
brz :_Control_7_else
# UAssign:<program.UAssign <program.Value name:distance> = UAdd <program.Value const:0>>
movw $0 %_cpu:acc
stwaw $3
# CTRL_MARKER:<program.ControlMarker marker:8 If start>
:_Control_8_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:left> NotEq <program.Value const:192>>
straw $4
cmpw $192
bre :_int_0004
movw $1 %_cpu:acc
bra :_int_0005
:_int_0004
movw $0 %_cpu:acc
:_int_0005
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# LOOP_CTRL:<program.LoopControl 8, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $6
brz :_Control_8_else
# Ed.ReadModuleRegister16Bit:<program.Call <program.Value name:TEMP-0> = name:Ed.ReadModuleRegister16Bit with args:[<program.Value const:8>, <program.Value const:2>]>
movw %82 %_cpu:acc
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# BAssign:<program.BAssign <program.Value name:distance> = <program.Value name:distance> Add <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $6
movw %_cpu:acc @_CALC
straw $3
addw @_CALC
stwaw $3
# CTRL_MARKER:<program.ControlMarker marker:8 If end>
:_Control_8_else
:_Control_8_end
# CTRL_MARKER:<program.ControlMarker marker:9 If start>
:_Control_9_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:right> NotEq <program.Value const:192>>
straw $5
cmpw $192
bre :_int_0006
movw $1 %_cpu:acc
bra :_int_0007
:_int_0006
movw $0 %_cpu:acc
:_int_0007
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# LOOP_CTRL:<program.LoopControl 9, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $6
brz :_Control_9_else
# Ed.ReadModuleRegister16Bit:<program.Call <program.Value name:TEMP-0> = name:Ed.ReadModuleRegister16Bit with args:[<program.Value const:3>, <program.Value const:2>]>
movw %32 %_cpu:acc
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# BAssign:<program.BAssign <program.Value name:distance> = <program.Value name:distance> Add <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $6
movw %_cpu:acc @_CALC
straw $3
addw @_CALC
stwaw $3
# CTRL_MARKER:<program.ControlMarker marker:9 If end>
:_Control_9_else
:_Control_9_end
# CTRL_MARKER:<program.ControlMarker marker:7 While end>
bra :_Control_7_start
:_Control_7_else
:_Control_7_end
ret
:_end_Ed.FinishDrive_SPACE

# FUNCTION:Ed.Drive_CM
::_fun_Ed.Drive_CM
# CTRL_MARKER:<program.ControlMarker marker:13 If start>
:_Control_13_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:direction> Lt <program.Value const:3>>
straw $3
cmpw $3
brle :_int_0008
movw $1 %_cpu:acc
bra :_int_0009
:_int_0008
movw $0 %_cpu:acc
:_int_0009
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# LOOP_CTRL:<program.LoopControl 13, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_13_else
# CALL:<program.Call name:Ed.DriveSimple_CM with args:[<program.Value name:direction>, <program.Value name:speed>, <program.Value name:distance>, <program.Value const:1>, <program.Value const:1>]>
stinc $7
straw $10
stwaw $0
straw $11
stwaw $1
straw $12
stwaw $2
movw $1 %_cpu:acc
stwaw $3
movw $1 %_cpu:acc
stwaw $4
suba ::_fun_Ed.DriveSimple_CM
stdec $7
# CTRL_MARKER:<program.ControlMarker marker:13 If else>
bra :_Control_13_end
:_Control_13_else
# UAssign:<program.UAssign <program.Value name:leftCtrl> = UAdd <program.Value const:192>>
movw $192 %_cpu:acc
stwaw $6
# UAssign:<program.UAssign <program.Value name:rightCtrl> = UAdd <program.Value const:192>>
movw $192 %_cpu:acc
stwaw $7
# CTRL_MARKER:<program.ControlMarker marker:14 If start>
:_Control_14_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:direction> Eq <program.Value const:3>>
straw $3
cmpw $3
brne :_int_0010
movw $1 %_cpu:acc
bra :_int_0011
:_int_0010
movw $0 %_cpu:acc
:_int_0011
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# LOOP_CTRL:<program.LoopControl 14, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_14_else
# UAssign:<program.UAssign <program.Value name:leftCtrl> = UAdd <program.Value const:128>>
movw $128 %_cpu:acc
stwaw $6
# CTRL_MARKER:<program.ControlMarker marker:14 If else>
bra :_Control_14_end
:_Control_14_else
# CTRL_MARKER:<program.ControlMarker marker:15 If start>
:_Control_15_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:direction> Eq <program.Value const:4>>
straw $3
cmpw $4
brne :_int_0012
movw $1 %_cpu:acc
bra :_int_0013
:_int_0012
movw $0 %_cpu:acc
:_int_0013
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# LOOP_CTRL:<program.LoopControl 15, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_15_else
# UAssign:<program.UAssign <program.Value name:leftCtrl> = UAdd <program.Value const:64>>
movw $64 %_cpu:acc
stwaw $6
# CTRL_MARKER:<program.ControlMarker marker:15 If else>
bra :_Control_15_end
:_Control_15_else
# CTRL_MARKER:<program.ControlMarker marker:16 If start>
:_Control_16_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:direction> Eq <program.Value const:5>>
straw $3
cmpw $5
brne :_int_0014
movw $1 %_cpu:acc
bra :_int_0015
:_int_0014
movw $0 %_cpu:acc
:_int_0015
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# LOOP_CTRL:<program.LoopControl 16, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_16_else
# UAssign:<program.UAssign <program.Value name:rightCtrl> = UAdd <program.Value const:128>>
movw $128 %_cpu:acc
stwaw $7
# CTRL_MARKER:<program.ControlMarker marker:16 If else>
bra :_Control_16_end
:_Control_16_else
# CTRL_MARKER:<program.ControlMarker marker:17 If start>
:_Control_17_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:direction> Eq <program.Value const:6>>
straw $3
cmpw $6
brne :_int_0016
movw $1 %_cpu:acc
bra :_int_0017
:_int_0016
movw $0 %_cpu:acc
:_int_0017
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# LOOP_CTRL:<program.LoopControl 17, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_17_else
# UAssign:<program.UAssign <program.Value name:rightCtrl> = UAdd <program.Value const:64>>
movw $64 %_cpu:acc
stwaw $7
# CTRL_MARKER:<program.ControlMarker marker:17 If else>
bra :_Control_17_end
:_Control_17_else
# CTRL_MARKER:<program.ControlMarker marker:18 If start>
:_Control_18_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:direction> Eq <program.Value const:7>>
straw $3
cmpw $7
brne :_int_0018
movw $1 %_cpu:acc
bra :_int_0019
:_int_0018
movw $0 %_cpu:acc
:_int_0019
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# LOOP_CTRL:<program.LoopControl 18, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_18_else
# UAssign:<program.UAssign <program.Value name:leftCtrl> = UAdd <program.Value const:128>>
movw $128 %_cpu:acc
stwaw $6
# UAssign:<program.UAssign <program.Value name:rightCtrl> = UAdd <program.Value const:64>>
movw $64 %_cpu:acc
stwaw $7
# CTRL_MARKER:<program.ControlMarker marker:18 If else>
bra :_Control_18_end
:_Control_18_else
# CTRL_MARKER:<program.ControlMarker marker:19 If start>
:_Control_19_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:direction> Eq <program.Value const:8>>
straw $3
cmpw $8
brne :_int_0020
movw $1 %_cpu:acc
bra :_int_0021
:_int_0020
movw $0 %_cpu:acc
:_int_0021
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# LOOP_CTRL:<program.LoopControl 19, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_19_else
# UAssign:<program.UAssign <program.Value name:leftCtrl> = UAdd <program.Value const:64>>
movw $64 %_cpu:acc
stwaw $6
# UAssign:<program.UAssign <program.Value name:rightCtrl> = UAdd <program.Value const:128>>
movw $128 %_cpu:acc
stwaw $7
# CTRL_MARKER:<program.ControlMarker marker:19 If end>
:_Control_19_else
:_Control_19_end
# CTRL_MARKER:<program.ControlMarker marker:18 If end>
:_Control_18_end
# CTRL_MARKER:<program.ControlMarker marker:17 If end>
:_Control_17_end
# CTRL_MARKER:<program.ControlMarker marker:16 If end>
:_Control_16_end
# CTRL_MARKER:<program.ControlMarker marker:15 If end>
:_Control_15_end
# CTRL_MARKER:<program.ControlMarker marker:14 If end>
:_Control_14_end
# CTRL_MARKER:<program.ControlMarker marker:20 If start>
:_Control_20_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:distance> NotEq <program.Value const:0>>
straw $5
cmpw $0
bre :_int_0022
movw $1 %_cpu:acc
bra :_int_0023
:_int_0022
movw $0 %_cpu:acc
:_int_0023
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# LOOP_CTRL:<program.LoopControl 20, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_20_else
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:distance> Mod <program.Value const:360>>
straw $5
modw $360
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# UAssign:<program.UAssign <program.Value name:distance> = UAdd <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
stwaw $5
# CTRL_MARKER:<program.ControlMarker marker:21 If start>
:_Control_21_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:distance> Eq <program.Value const:0>>
straw $5
cmpw $0
brne :_int_0024
movw $1 %_cpu:acc
bra :_int_0025
:_int_0024
movw $0 %_cpu:acc
:_int_0025
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# LOOP_CTRL:<program.LoopControl 21, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_21_else
# UAssign:<program.UAssign <program.Value name:distance> = UAdd <program.Value const:360>>
movw $360 %_cpu:acc
stwaw $5
# CTRL_MARKER:<program.ControlMarker marker:21 If end>
:_Control_21_else
:_Control_21_end
# CTRL_MARKER:<program.ControlMarker marker:22 If start>
:_Control_22_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:distance> Gt <program.Value const:300>>
straw $5
cmpw $300
brge :_int_0026
movw $1 %_cpu:acc
bra :_int_0027
:_int_0026
movw $0 %_cpu:acc
:_int_0027
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# LOOP_CTRL:<program.LoopControl 22, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_22_else
# BAssign:<program.BAssign <program.Value name:distance> = <program.Value name:distance> Add <program.Value const:2>>
straw $5
addw $2
stwaw $5
# CTRL_MARKER:<program.ControlMarker marker:22 If else>
bra :_Control_22_end
:_Control_22_else
# CTRL_MARKER:<program.ControlMarker marker:23 If start>
:_Control_23_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:distance> Gt <program.Value const:100>>
straw $5
cmpw $100
brge :_int_0028
movw $1 %_cpu:acc
bra :_int_0029
:_int_0028
movw $0 %_cpu:acc
:_int_0029
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# LOOP_CTRL:<program.LoopControl 23, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_23_else
# BAssign:<program.BAssign <program.Value name:distance> = <program.Value name:distance> Add <program.Value const:1>>
straw $5
addw $1
stwaw $5
# CTRL_MARKER:<program.ControlMarker marker:23 If end>
:_Control_23_else
:_Control_23_end
# CTRL_MARKER:<program.ControlMarker marker:22 If end>
:_Control_22_end
# CTRL_MARKER:<program.ControlMarker marker:24 If start>
:_Control_24_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:direction> GtE <program.Value const:7>>
straw $3
cmpw $7
brgr :_int_0030
movw $1 %_cpu:acc
bra :_int_0031
:_int_0030
movw $0 %_cpu:acc
:_int_0031
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# LOOP_CTRL:<program.LoopControl 24, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_24_else
# BAssign:<program.BAssign <program.Value name:distance> = <program.Value name:distance> Div <program.Value const:2>>
straw $5
divw $2
stwaw $5
# CTRL_MARKER:<program.ControlMarker marker:24 If end>
:_Control_24_else
:_Control_24_end
# CTRL_MARKER:<program.ControlMarker marker:25 If start>
:_Control_25_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:distance> Eq <program.Value const:0>>
straw $5
cmpw $0
brne :_int_0032
movw $1 %_cpu:acc
bra :_int_0033
:_int_0032
movw $0 %_cpu:acc
:_int_0033
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# LOOP_CTRL:<program.LoopControl 25, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_25_else
# UAssign:<program.UAssign <program.Value name:distance> = UAdd <program.Value const:1>>
movw $1 %_cpu:acc
stwaw $5
# CTRL_MARKER:<program.ControlMarker marker:25 If end>
:_Control_25_else
:_Control_25_end
# Ed.WriteModuleRegister16Bit:<program.Call name:Ed.WriteModuleRegister16Bit with args:[<program.Value const:8>, <program.Value const:2>, <program.Value name:distance>]>
straw $5
movw %_cpu:acc %82
# Ed.WriteModuleRegister16Bit:<program.Call name:Ed.WriteModuleRegister16Bit with args:[<program.Value const:3>, <program.Value const:2>, <program.Value name:distance>]>
straw $5
movw %_cpu:acc %32
# CTRL_MARKER:<program.ControlMarker marker:26 If start>
:_Control_26_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:leftCtrl> NotEq <program.Value const:192>>
straw $6
cmpw $192
bre :_int_0034
movw $1 %_cpu:acc
bra :_int_0035
:_int_0034
movw $0 %_cpu:acc
:_int_0035
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# LOOP_CTRL:<program.LoopControl 26, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_26_else
# BAssign:<program.BAssign <program.Value name:leftCtrl> = <program.Value name:leftCtrl> BitOr <program.Value const:32>>
straw $6
orw $32
stwaw $6
# CTRL_MARKER:<program.ControlMarker marker:26 If end>
:_Control_26_else
:_Control_26_end
# CTRL_MARKER:<program.ControlMarker marker:27 If start>
:_Control_27_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:rightCtrl> NotEq <program.Value const:192>>
straw $7
cmpw $192
bre :_int_0036
movw $1 %_cpu:acc
bra :_int_0037
:_int_0036
movw $0 %_cpu:acc
:_int_0037
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# LOOP_CTRL:<program.LoopControl 27, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_27_else
# BAssign:<program.BAssign <program.Value name:rightCtrl> = <program.Value name:rightCtrl> BitOr <program.Value const:32>>
straw $7
orw $32
stwaw $7
# CTRL_MARKER:<program.ControlMarker marker:27 If end>
:_Control_27_else
:_Control_27_end
# CTRL_MARKER:<program.ControlMarker marker:20 If end>
:_Control_20_else
:_Control_20_end
# CTRL_MARKER:<program.ControlMarker marker:28 If start>
:_Control_28_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:speed> Gt <program.Value const:10>>
straw $4
cmpw $10
brge :_int_0038
movw $1 %_cpu:acc
bra :_int_0039
:_int_0038
movw $0 %_cpu:acc
:_int_0039
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# LOOP_CTRL:<program.LoopControl 28, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_28_else
# UAssign:<program.UAssign <program.Value name:speed> = UAdd <program.Value const:10>>
movw $10 %_cpu:acc
stwaw $4
# CTRL_MARKER:<program.ControlMarker marker:28 If end>
:_Control_28_else
:_Control_28_end
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:leftCtrl> BitOr <program.Value name:speed>>
straw $4
movw %_cpu:acc @_CALC
straw $6
orw @_CALC
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:8>, <program.Value const:1>, <program.Value name:TEMP-0>]>
# OPTIMISED OUT (STACK_READ): straw $8
conv
movb %_cpu:acc %81
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:rightCtrl> BitOr <program.Value name:speed>>
straw $4
movw %_cpu:acc @_CALC
straw $7
orw @_CALC
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:3>, <program.Value const:1>, <program.Value name:TEMP-0>]>
# OPTIMISED OUT (STACK_READ): straw $8
conv
movb %_cpu:acc %31
# CALL:<program.Call name:Ed.FinishDrive_SPACE with args:[<program.Value name:distance>, <program.Value name:leftCtrl>, <program.Value name:rightCtrl>]>
stinc $4
straw $9
stwaw $0
straw $10
stwaw $1
straw $11
stwaw $2
suba ::_fun_Ed.FinishDrive_SPACE
stdec $4
# CTRL_MARKER:<program.ControlMarker marker:13 If end>
:_Control_13_end
ret
:_end_Ed.Drive_CM

# FUNCTION:Ed.DriveSimple_CM
::_fun_Ed.DriveSimple_CM
# UAssign:<program.UAssign <program.Value name:control> = UAdd <program.Value const:0>>
movw $0 %_cpu:acc
stwaw $8
# CTRL_MARKER:<program.ControlMarker marker:61 If start>
:_Control_61_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:speed> Gt <program.Value const:10>>
straw $4
cmpw $10
brge :_int_0040
movw $1 %_cpu:acc
bra :_int_0041
:_int_0040
movw $0 %_cpu:acc
:_int_0041
# OPTIMISED OUT (STACK_WRITE): stwaw $9
# LOOP_CTRL:<program.LoopControl 61, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $9
brz :_Control_61_else
# UAssign:<program.UAssign <program.Value name:speed> = UAdd <program.Value const:10>>
movw $10 %_cpu:acc
stwaw $4
# CTRL_MARKER:<program.ControlMarker marker:61 If end>
:_Control_61_else
:_Control_61_end
# CTRL_MARKER:<program.ControlMarker marker:62 If start>
:_Control_62_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:direction> Eq <program.Value const:0>>
straw $3
cmpw $0
brne :_int_0042
movw $1 %_cpu:acc
bra :_int_0043
:_int_0042
movw $0 %_cpu:acc
:_int_0043
# OPTIMISED OUT (STACK_WRITE): stwaw $9
# LOOP_CTRL:<program.LoopControl 62, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $9
brz :_Control_62_else
# UAssign:<program.UAssign <program.Value name:control> = UAdd <program.Value const:192>>
movw $192 %_cpu:acc
stwaw $8
# UAssign:<program.UAssign <program.Value name:distance> = UAdd <program.Value const:0>>
movw $0 %_cpu:acc
stwaw $5
# CTRL_MARKER:<program.ControlMarker marker:62 If else>
bra :_Control_62_end
:_Control_62_else
# CTRL_MARKER:<program.ControlMarker marker:63 If start>
:_Control_63_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:direction> Eq <program.Value const:1>>
straw $3
cmpw $1
brne :_int_0044
movw $1 %_cpu:acc
bra :_int_0045
:_int_0044
movw $0 %_cpu:acc
:_int_0045
# OPTIMISED OUT (STACK_WRITE): stwaw $9
# LOOP_CTRL:<program.LoopControl 63, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $9
brz :_Control_63_else
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value const:128> BitOr <program.Value name:speed>>
straw $4
movw %_cpu:acc @_CALC
movw $128 %_cpu:acc
orw @_CALC
# OPTIMISED OUT (STACK_WRITE): stwaw $9
# UAssign:<program.UAssign <program.Value name:control> = UAdd <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $9
stwaw $8
# CTRL_MARKER:<program.ControlMarker marker:63 If else>
bra :_Control_63_end
:_Control_63_else
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value const:64> BitOr <program.Value name:speed>>
straw $4
movw %_cpu:acc @_CALC
movw $64 %_cpu:acc
orw @_CALC
# OPTIMISED OUT (STACK_WRITE): stwaw $9
# UAssign:<program.UAssign <program.Value name:control> = UAdd <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $9
stwaw $8
# CTRL_MARKER:<program.ControlMarker marker:63 If end>
:_Control_63_end
# CTRL_MARKER:<program.ControlMarker marker:64 If start>
:_Control_64_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:distance> Gt <program.Value const:0>>
straw $5
cmpw $0
brge :_int_0046
movw $1 %_cpu:acc
bra :_int_0047
:_int_0046
movw $0 %_cpu:acc
:_int_0047
# OPTIMISED OUT (STACK_WRITE): stwaw $9
# LOOP_CTRL:<program.LoopControl 64, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $9
brz :_Control_64_else
# BAssign:<program.BAssign <program.Value name:distance> = <program.Value name:distance> Mult <program.Value const:8>>
straw $5
mulw $8
stwaw $5
# BAssign:<program.BAssign <program.Value name:distance> = <program.Value name:distance> Sub <program.Value name:speed>>
straw $4
movw %_cpu:acc @_CALC
straw $5
subw @_CALC
stwaw $5
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:control> BitOr <program.Value const:32>>
straw $8
orw $32
# OPTIMISED OUT (STACK_WRITE): stwaw $9
# UAssign:<program.UAssign <program.Value name:control> = UAdd <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $9
stwaw $8
# CTRL_MARKER:<program.ControlMarker marker:64 If end>
:_Control_64_else
:_Control_64_end
# CTRL_MARKER:<program.ControlMarker marker:62 If end>
:_Control_62_end
# CTRL_MARKER:<program.ControlMarker marker:65 If start>
:_Control_65_start
# LOOP_CTRL:<program.LoopControl 65, name:If, test:<program.Value name:left>>
straw $6
brz :_Control_65_else
# Ed.WriteModuleRegister16Bit:<program.Call name:Ed.WriteModuleRegister16Bit with args:[<program.Value const:8>, <program.Value const:2>, <program.Value name:distance>]>
straw $5
movw %_cpu:acc %82
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:8>, <program.Value const:1>, <program.Value name:control>]>
straw $8
conv
movb %_cpu:acc %81
# CTRL_MARKER:<program.ControlMarker marker:65 If end>
:_Control_65_else
:_Control_65_end
# CTRL_MARKER:<program.ControlMarker marker:66 If start>
:_Control_66_start
# LOOP_CTRL:<program.LoopControl 66, name:If, test:<program.Value name:right>>
straw $7
brz :_Control_66_else
# Ed.WriteModuleRegister16Bit:<program.Call name:Ed.WriteModuleRegister16Bit with args:[<program.Value const:3>, <program.Value const:2>, <program.Value name:distance>]>
straw $5
movw %_cpu:acc %32
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:3>, <program.Value const:1>, <program.Value name:control>]>
straw $8
conv
movb %_cpu:acc %31
# CTRL_MARKER:<program.ControlMarker marker:66 If end>
:_Control_66_else
:_Control_66_end
# CALL:<program.Call name:Ed.FinishDrive_SPACE with args:[<program.Value name:distance>, <program.Value name:left>, <program.Value name:right>]>
stinc $4
straw $9
stwaw $0
straw $10
stwaw $1
straw $11
stwaw $2
suba ::_fun_Ed.FinishDrive_SPACE
stdec $4
ret
:_end_Ed.DriveSimple_CM

# FUNCTION:Ed.ReadLineState
::_fun_Ed.ReadLineState
# Ed.ReadModuleRegister8Bit:<program.Call <program.Value name:TEMP-0> = name:Ed.ReadModuleRegister8Bit with args:[<program.Value const:0>, <program.Value const:0>]>
movb %00 %_cpu:acc
conv
stwaw $3
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:TEMP-0> BitAnd <program.Value const:1>>
# OPTIMISED OUT (STACK_READ): straw $3
andw $1
# OPTIMISED OUT (STACK_WRITE): stwaw $4
# RETURN:<program.Return <program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $4
stwaw $3
ret
# OPTIMISED OUT (DBL-RET): ret
:_end_Ed.ReadLineState
stop
END MAIN
FINISH
