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
DATW Ed.DistanceUnits 2 1 2
DATW Ed.Tempo 3 1 250

# FUNCTION:__main__
::_fun___main__
# Set intial tempo
movw $250 %68
# CTRL_MARKER:<program.ControlMarker marker:0 While start>
:_Control_0_start
# LOOP_CTRL:<program.LoopControl 0, name:While, test:<program.Value const:1>>
movw $1 %_cpu:acc
brz :_Control_0_else
# CALL:<program.Call name:Ed.PlayBeep with args:[]>
suba ::_fun_Ed.PlayBeep
# CALL:<program.Call name:Ed.LeftLed with args:[<program.Value const:0>]>
stinc $2
movw $0 %_cpu:acc
stwaw $0
suba ::_fun_Ed.LeftLed
stdec $2
# CALL:<program.Call name:Ed.RightLed with args:[<program.Value const:1>]>
stinc $2
movw $1 %_cpu:acc
stwaw $0
suba ::_fun_Ed.RightLed
stdec $2
# CALL:<program.Call name:Ed.Drive_TIME with args:[<program.Value const:7>, <program.Value const:5>, <program.Value const:350>]>
stinc $8
movw $7 %_cpu:acc
stwaw $0
movw $5 %_cpu:acc
stwaw $1
movw $350 %_cpu:acc
stwaw $2
suba ::_fun_Ed.Drive_TIME
stdec $8
# CALL:<program.Call name:Ed.TimeWait with args:[<program.Value const:20>, <program.Value const:1>]>
stinc $3
movw $20 %_cpu:acc
stwaw $0
movw $1 %_cpu:acc
stwaw $1
suba ::_fun_Ed.TimeWait
stdec $3
# CALL:<program.Call name:Ed.PlayBeep with args:[]>
suba ::_fun_Ed.PlayBeep
# CALL:<program.Call name:Ed.LeftLed with args:[<program.Value const:1>]>
stinc $2
movw $1 %_cpu:acc
stwaw $0
suba ::_fun_Ed.LeftLed
stdec $2
# CALL:<program.Call name:Ed.RightLed with args:[<program.Value const:0>]>
stinc $2
movw $0 %_cpu:acc
stwaw $0
suba ::_fun_Ed.RightLed
stdec $2
# CALL:<program.Call name:Ed.Drive_TIME with args:[<program.Value const:8>, <program.Value const:5>, <program.Value const:350>]>
stinc $8
movw $8 %_cpu:acc
stwaw $0
movw $5 %_cpu:acc
stwaw $1
movw $350 %_cpu:acc
stwaw $2
suba ::_fun_Ed.Drive_TIME
stdec $8
# CALL:<program.Call name:Ed.TimeWait with args:[<program.Value const:20>, <program.Value const:1>]>
stinc $3
movw $20 %_cpu:acc
stwaw $0
movw $1 %_cpu:acc
stwaw $1
suba ::_fun_Ed.TimeWait
stdec $3
# CTRL_MARKER:<program.ControlMarker marker:0 While end>
bra :_Control_0_start
:_Control_0_else
:_Control_0_end
stop
:_end___main__

# FUNCTION:Ed.LeftLed
::_fun_Ed.LeftLed
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:value> BitAnd <program.Value const:1>>
straw $3
andw $1
# OPTIMISED OUT (STACK_WRITE): stwaw $4
# UAssign:<program.UAssign <program.Value name:value> = UAdd <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $4
stwaw $3
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value name:value>]>
# OPTIMISED OUT (STACK_READ): straw $3
conv
movb %_cpu:acc %b1
ret
:_end_Ed.LeftLed

# FUNCTION:Ed.RightLed
::_fun_Ed.RightLed
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:value> BitAnd <program.Value const:1>>
straw $3
andw $1
# OPTIMISED OUT (STACK_WRITE): stwaw $4
# UAssign:<program.UAssign <program.Value name:value> = UAdd <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $4
stwaw $3
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:1>, <program.Value const:1>, <program.Value name:value>]>
# OPTIMISED OUT (STACK_READ): straw $3
conv
movb %_cpu:acc %11
ret
:_end_Ed.RightLed

# FUNCTION:Ed.TimeWait
::_fun_Ed.TimeWait
# BAssign:<program.BAssign <program.Value name:units> = <program.Value name:units> BitAnd <program.Value const:1>>
straw $4
andw $1
stwaw $4
# CTRL_MARKER:<program.ControlMarker marker:3 If start>
:_Control_3_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:units> Eq <program.Value const:0>>
straw $4
cmpw $0
brne :_int_0000
movw $1 %_cpu:acc
bra :_int_0001
:_int_0000
movw $0 %_cpu:acc
:_int_0001
# OPTIMISED OUT (STACK_WRITE): stwaw $5
# LOOP_CTRL:<program.LoopControl 3, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $5
brz :_Control_3_else
# BAssign:<program.BAssign <program.Value name:time> = <program.Value name:time> Mult <program.Value const:100>>
straw $3
mulw $100
stwaw $3
# CTRL_MARKER:<program.ControlMarker marker:3 If else>
bra :_Control_3_end
:_Control_3_else
# BAssign:<program.BAssign <program.Value name:time> = <program.Value name:time> Div <program.Value const:10>>
straw $3
divw $10
stwaw $3
# CTRL_MARKER:<program.ControlMarker marker:3 If end>
:_Control_3_end
# Ed.WriteModuleRegister16Bit:<program.Call name:Ed.WriteModuleRegister16Bit with args:[<program.Value const:14>, <program.Value const:2>, <program.Value name:time>]>
straw $3
movw %_cpu:acc %e2
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:14>, <program.Value const:1>, <program.Value const:2>]>
movb $2 %e1
ret
:_end_Ed.TimeWait

# FUNCTION:Ed.PlayBeep
::_fun_Ed.PlayBeep
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:6>, <program.Value const:1>, <program.Value const:4>]>
movb $4 %61
ret
:_end_Ed.PlayBeep

# FUNCTION:Ed.FinishDrive_TIME
::_fun_Ed.FinishDrive_TIME
# CTRL_MARKER:<program.ControlMarker marker:9 If start>
:_Control_9_start
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
# LOOP_CTRL:<program.LoopControl 9, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $6
brz :_Control_9_else
# BAssign:<program.BAssign <program.Value name:distance> = <program.Value name:distance> Div <program.Value const:10>>
straw $3
divw $10
stwaw $3
# Ed.WriteModuleRegister16Bit:<program.Call name:Ed.WriteModuleRegister16Bit with args:[<program.Value const:14>, <program.Value const:2>, <program.Value name:distance>]>
# OPTIMISED OUT (STACK_READ): straw $3
movw %_cpu:acc %e2
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:14>, <program.Value const:1>, <program.Value const:2>]>
movb $2 %e1
# CTRL_MARKER:<program.ControlMarker marker:10 If start>
:_Control_10_start
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
# LOOP_CTRL:<program.LoopControl 10, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $6
brz :_Control_10_else
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:8>, <program.Value const:1>, <program.Value const:192>]>
movb $192 %81
# CTRL_MARKER:<program.ControlMarker marker:10 If end>
:_Control_10_else
:_Control_10_end
# CTRL_MARKER:<program.ControlMarker marker:11 If start>
:_Control_11_start
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
# LOOP_CTRL:<program.LoopControl 11, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $6
brz :_Control_11_else
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:3>, <program.Value const:1>, <program.Value const:192>]>
movb $192 %31
# CTRL_MARKER:<program.ControlMarker marker:11 If end>
:_Control_11_else
:_Control_11_end
# CTRL_MARKER:<program.ControlMarker marker:9 If end>
:_Control_9_else
:_Control_9_end
ret
:_end_Ed.FinishDrive_TIME

# FUNCTION:Ed.Drive_TIME
::_fun_Ed.Drive_TIME
# CTRL_MARKER:<program.ControlMarker marker:44 If start>
:_Control_44_start
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
# LOOP_CTRL:<program.LoopControl 44, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_44_else
# CALL:<program.Call name:Ed.DriveSimple_TIME with args:[<program.Value name:direction>, <program.Value name:speed>, <program.Value name:distance>, <program.Value const:1>, <program.Value const:1>]>
stinc $9
straw $12
stwaw $0
straw $13
stwaw $1
straw $14
stwaw $2
movw $1 %_cpu:acc
stwaw $3
movw $1 %_cpu:acc
stwaw $4
suba ::_fun_Ed.DriveSimple_TIME
stdec $9
# CTRL_MARKER:<program.ControlMarker marker:44 If else>
bra :_Control_44_end
:_Control_44_else
# UAssign:<program.UAssign <program.Value name:leftCtrl> = UAdd <program.Value const:192>>
movw $192 %_cpu:acc
stwaw $6
# UAssign:<program.UAssign <program.Value name:rightCtrl> = UAdd <program.Value const:192>>
movw $192 %_cpu:acc
stwaw $7
# CTRL_MARKER:<program.ControlMarker marker:45 If start>
:_Control_45_start
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
# LOOP_CTRL:<program.LoopControl 45, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_45_else
# UAssign:<program.UAssign <program.Value name:leftCtrl> = UAdd <program.Value const:128>>
movw $128 %_cpu:acc
stwaw $6
# CTRL_MARKER:<program.ControlMarker marker:45 If else>
bra :_Control_45_end
:_Control_45_else
# CTRL_MARKER:<program.ControlMarker marker:46 If start>
:_Control_46_start
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
# LOOP_CTRL:<program.LoopControl 46, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_46_else
# UAssign:<program.UAssign <program.Value name:leftCtrl> = UAdd <program.Value const:64>>
movw $64 %_cpu:acc
stwaw $6
# CTRL_MARKER:<program.ControlMarker marker:46 If else>
bra :_Control_46_end
:_Control_46_else
# CTRL_MARKER:<program.ControlMarker marker:47 If start>
:_Control_47_start
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
# LOOP_CTRL:<program.LoopControl 47, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_47_else
# UAssign:<program.UAssign <program.Value name:rightCtrl> = UAdd <program.Value const:128>>
movw $128 %_cpu:acc
stwaw $7
# CTRL_MARKER:<program.ControlMarker marker:47 If else>
bra :_Control_47_end
:_Control_47_else
# CTRL_MARKER:<program.ControlMarker marker:48 If start>
:_Control_48_start
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
# LOOP_CTRL:<program.LoopControl 48, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_48_else
# UAssign:<program.UAssign <program.Value name:rightCtrl> = UAdd <program.Value const:64>>
movw $64 %_cpu:acc
stwaw $7
# CTRL_MARKER:<program.ControlMarker marker:48 If else>
bra :_Control_48_end
:_Control_48_else
# CTRL_MARKER:<program.ControlMarker marker:49 If start>
:_Control_49_start
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
# LOOP_CTRL:<program.LoopControl 49, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_49_else
# UAssign:<program.UAssign <program.Value name:leftCtrl> = UAdd <program.Value const:128>>
movw $128 %_cpu:acc
stwaw $6
# UAssign:<program.UAssign <program.Value name:rightCtrl> = UAdd <program.Value const:64>>
movw $64 %_cpu:acc
stwaw $7
# CTRL_MARKER:<program.ControlMarker marker:49 If else>
bra :_Control_49_end
:_Control_49_else
# CTRL_MARKER:<program.ControlMarker marker:50 If start>
:_Control_50_start
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
# LOOP_CTRL:<program.LoopControl 50, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_50_else
# UAssign:<program.UAssign <program.Value name:leftCtrl> = UAdd <program.Value const:64>>
movw $64 %_cpu:acc
stwaw $6
# UAssign:<program.UAssign <program.Value name:rightCtrl> = UAdd <program.Value const:128>>
movw $128 %_cpu:acc
stwaw $7
# CTRL_MARKER:<program.ControlMarker marker:50 If end>
:_Control_50_else
:_Control_50_end
# CTRL_MARKER:<program.ControlMarker marker:49 If end>
:_Control_49_end
# CTRL_MARKER:<program.ControlMarker marker:48 If end>
:_Control_48_end
# CTRL_MARKER:<program.ControlMarker marker:47 If end>
:_Control_47_end
# CTRL_MARKER:<program.ControlMarker marker:46 If end>
:_Control_46_end
# CTRL_MARKER:<program.ControlMarker marker:45 If end>
:_Control_45_end
# CTRL_MARKER:<program.ControlMarker marker:51 If start>
:_Control_51_start
# CTRL_MARKER:<program.ControlMarker marker:52 And start>
:_Control_52_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:distance> Gt <program.Value const:0>>
straw $5
cmpw $0
brge :_int_0022
movw $1 %_cpu:acc
bra :_int_0023
:_int_0022
movw $0 %_cpu:acc
:_int_0023
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# BOOL_CHK:<program.BoolCheck 52 And check:<program.Value name:TEMP-0>, target<program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $8
brnz :_int_0024
movw $0 %_cpu:acc
stwaw $9
bra :_Control_52_end
:_int_0024
# BAssign:<program.BAssign <program.Value name:TEMP-2> = <program.Value name:distance> Lt <program.Value const:10>>
straw $5
cmpw $10
brle :_int_0025
movw $1 %_cpu:acc
bra :_int_0026
:_int_0025
movw $0 %_cpu:acc
:_int_0026
# OPTIMISED OUT (STACK_WRITE): stwaw $10
# BOOL_CHK:<program.BoolCheck 52 And check:<program.Value name:TEMP-2>, target<program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $10
brnz :_int_0027
movw $0 %_cpu:acc
stwaw $9
bra :_Control_52_end
:_int_0027
# BOOL_CHK:<program.BoolCheck 52 Done check:<program.Value const:1>, target<program.Value name:TEMP-1>>
movw $1 %_cpu:acc
stwaw $9
# CTRL_MARKER:<program.ControlMarker marker:52 And end>
:_Control_52_else
:_Control_52_end
# LOOP_CTRL:<program.LoopControl 51, name:If, test:<program.Value name:TEMP-1>>
straw $9
brz :_Control_51_else
# RETURN:<program.Return None>
ret
# CTRL_MARKER:<program.ControlMarker marker:51 If end>
:_Control_51_else
:_Control_51_end
# CTRL_MARKER:<program.ControlMarker marker:53 If start>
:_Control_53_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:speed> Gt <program.Value const:10>>
straw $4
cmpw $10
brge :_int_0028
movw $1 %_cpu:acc
bra :_int_0029
:_int_0028
movw $0 %_cpu:acc
:_int_0029
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# LOOP_CTRL:<program.LoopControl 53, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_53_else
# UAssign:<program.UAssign <program.Value name:speed> = UAdd <program.Value const:10>>
movw $10 %_cpu:acc
stwaw $4
# CTRL_MARKER:<program.ControlMarker marker:53 If end>
:_Control_53_else
:_Control_53_end
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
# CALL:<program.Call name:Ed.FinishDrive_TIME with args:[<program.Value name:distance>, <program.Value name:leftCtrl>, <program.Value name:rightCtrl>]>
stinc $4
straw $9
stwaw $0
straw $10
stwaw $1
straw $11
stwaw $2
suba ::_fun_Ed.FinishDrive_TIME
stdec $4
# CTRL_MARKER:<program.ControlMarker marker:44 If end>
:_Control_44_end
ret
:_end_Ed.Drive_TIME

# FUNCTION:Ed.DriveSimple_TIME
::_fun_Ed.DriveSimple_TIME
# UAssign:<program.UAssign <program.Value name:control> = UAdd <program.Value const:0>>
movw $0 %_cpu:acc
stwaw $8
# CTRL_MARKER:<program.ControlMarker marker:72 If start>
:_Control_72_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:speed> Gt <program.Value const:10>>
straw $4
cmpw $10
brge :_int_0030
movw $1 %_cpu:acc
bra :_int_0031
:_int_0030
movw $0 %_cpu:acc
:_int_0031
# OPTIMISED OUT (STACK_WRITE): stwaw $9
# LOOP_CTRL:<program.LoopControl 72, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $9
brz :_Control_72_else
# UAssign:<program.UAssign <program.Value name:speed> = UAdd <program.Value const:10>>
movw $10 %_cpu:acc
stwaw $4
# CTRL_MARKER:<program.ControlMarker marker:72 If end>
:_Control_72_else
:_Control_72_end
# CTRL_MARKER:<program.ControlMarker marker:73 If start>
:_Control_73_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:direction> Eq <program.Value const:0>>
straw $3
cmpw $0
brne :_int_0032
movw $1 %_cpu:acc
bra :_int_0033
:_int_0032
movw $0 %_cpu:acc
:_int_0033
# OPTIMISED OUT (STACK_WRITE): stwaw $9
# LOOP_CTRL:<program.LoopControl 73, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $9
brz :_Control_73_else
# UAssign:<program.UAssign <program.Value name:control> = UAdd <program.Value const:192>>
movw $192 %_cpu:acc
stwaw $8
# UAssign:<program.UAssign <program.Value name:distance> = UAdd <program.Value const:0>>
movw $0 %_cpu:acc
stwaw $5
# CTRL_MARKER:<program.ControlMarker marker:73 If else>
bra :_Control_73_end
:_Control_73_else
# CTRL_MARKER:<program.ControlMarker marker:74 If start>
:_Control_74_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:direction> Eq <program.Value const:1>>
straw $3
cmpw $1
brne :_int_0034
movw $1 %_cpu:acc
bra :_int_0035
:_int_0034
movw $0 %_cpu:acc
:_int_0035
# OPTIMISED OUT (STACK_WRITE): stwaw $9
# LOOP_CTRL:<program.LoopControl 74, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $9
brz :_Control_74_else
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value const:128> BitOr <program.Value name:speed>>
straw $4
movw %_cpu:acc @_CALC
movw $128 %_cpu:acc
orw @_CALC
# OPTIMISED OUT (STACK_WRITE): stwaw $9
# UAssign:<program.UAssign <program.Value name:control> = UAdd <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $9
stwaw $8
# CTRL_MARKER:<program.ControlMarker marker:74 If else>
bra :_Control_74_end
:_Control_74_else
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value const:64> BitOr <program.Value name:speed>>
straw $4
movw %_cpu:acc @_CALC
movw $64 %_cpu:acc
orw @_CALC
# OPTIMISED OUT (STACK_WRITE): stwaw $9
# UAssign:<program.UAssign <program.Value name:control> = UAdd <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $9
stwaw $8
# CTRL_MARKER:<program.ControlMarker marker:74 If end>
:_Control_74_end
# CTRL_MARKER:<program.ControlMarker marker:75 If start>
:_Control_75_start
# CTRL_MARKER:<program.ControlMarker marker:76 And start>
:_Control_76_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:distance> Gt <program.Value const:0>>
straw $5
cmpw $0
brge :_int_0036
movw $1 %_cpu:acc
bra :_int_0037
:_int_0036
movw $0 %_cpu:acc
:_int_0037
# OPTIMISED OUT (STACK_WRITE): stwaw $9
# BOOL_CHK:<program.BoolCheck 76 And check:<program.Value name:TEMP-0>, target<program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $9
brnz :_int_0038
movw $0 %_cpu:acc
stwaw $10
bra :_Control_76_end
:_int_0038
# BAssign:<program.BAssign <program.Value name:TEMP-2> = <program.Value name:distance> Lt <program.Value const:10>>
straw $5
cmpw $10
brle :_int_0039
movw $1 %_cpu:acc
bra :_int_0040
:_int_0039
movw $0 %_cpu:acc
:_int_0040
# OPTIMISED OUT (STACK_WRITE): stwaw $11
# BOOL_CHK:<program.BoolCheck 76 And check:<program.Value name:TEMP-2>, target<program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $11
brnz :_int_0041
movw $0 %_cpu:acc
stwaw $10
bra :_Control_76_end
:_int_0041
# BOOL_CHK:<program.BoolCheck 76 Done check:<program.Value const:1>, target<program.Value name:TEMP-1>>
movw $1 %_cpu:acc
stwaw $10
# CTRL_MARKER:<program.ControlMarker marker:76 And end>
:_Control_76_else
:_Control_76_end
# LOOP_CTRL:<program.LoopControl 75, name:If, test:<program.Value name:TEMP-1>>
straw $10
brz :_Control_75_else
# RETURN:<program.Return None>
ret
# CTRL_MARKER:<program.ControlMarker marker:75 If end>
:_Control_75_else
:_Control_75_end
# CTRL_MARKER:<program.ControlMarker marker:73 If end>
:_Control_73_end
# CTRL_MARKER:<program.ControlMarker marker:77 If start>
:_Control_77_start
# LOOP_CTRL:<program.LoopControl 77, name:If, test:<program.Value name:left>>
straw $6
brz :_Control_77_else
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:8>, <program.Value const:1>, <program.Value name:control>]>
straw $8
conv
movb %_cpu:acc %81
# CTRL_MARKER:<program.ControlMarker marker:77 If end>
:_Control_77_else
:_Control_77_end
# CTRL_MARKER:<program.ControlMarker marker:78 If start>
:_Control_78_start
# LOOP_CTRL:<program.LoopControl 78, name:If, test:<program.Value name:right>>
straw $7
brz :_Control_78_else
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:3>, <program.Value const:1>, <program.Value name:control>]>
straw $8
conv
movb %_cpu:acc %31
# CTRL_MARKER:<program.ControlMarker marker:78 If end>
:_Control_78_else
:_Control_78_end
# CALL:<program.Call name:Ed.FinishDrive_TIME with args:[<program.Value name:distance>, <program.Value name:left>, <program.Value name:right>]>
stinc $4
straw $9
stwaw $0
straw $10
stwaw $1
straw $11
stwaw $2
suba ::_fun_Ed.FinishDrive_TIME
stdec $4
ret
:_end_Ed.DriveSimple_TIME
stop
END MAIN
FINISH
