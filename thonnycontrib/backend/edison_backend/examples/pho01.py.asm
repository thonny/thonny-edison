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
DATW Ed.Tempo 3 1 70
DATW MESSAGE_CALIBRATE 4 1
DATW MESSAGE_LOW 5 1
DATW MESSAGE_HIGH 6 1
DATW MESSAGE_PAUSE 7 1
DATW slowingPause 8 1
DATW density0 9 1
DATW density1 10 1
DATW density2 11 1
DATW inter0 12 1
DATW inter1 13 1
DATW previousTracker 14 1
DATW validationStep 15 1
DATW tracker 16 1
DATW inter0plus 17 1
DATW inter0minus 18 1
DATW inter1plus 19 1
DATW inter1minus 20 1
DATW previousColor 21 1
DATW currentColor 22 1
stinc $3

# FUNCTION:__main__
::_fun___main__
# Set intial tempo
movw $70 %68
# CALL:<program.Call name:Ed.LineTrackerLed with args:[<program.Value const:1>]>
stinc $2
movw $1 %_cpu:acc
stwaw $0
suba ::_fun_Ed.LineTrackerLed
stdec $2
# UAssign:<program.UAssign <program.Value name:MESSAGE_CALIBRATE> = UAdd <program.Value const:1>>
movw $1 @MESSAGE_CALIBRATE
# UAssign:<program.UAssign <program.Value name:MESSAGE_LOW> = UAdd <program.Value const:2>>
movw $2 @MESSAGE_LOW
# UAssign:<program.UAssign <program.Value name:MESSAGE_HIGH> = UAdd <program.Value const:3>>
movw $3 @MESSAGE_HIGH
# UAssign:<program.UAssign <program.Value name:MESSAGE_PAUSE> = UAdd <program.Value const:4>>
movw $4 @MESSAGE_PAUSE
# UAssign:<program.UAssign <program.Value name:slowingPause> = UAdd <program.Value const:200>>
movw $200 @slowingPause
# UAssign:<program.UAssign <program.Value name:density0> = UAdd <program.Value const:0>>
movw $0 @density0
# UAssign:<program.UAssign <program.Value name:density1> = UAdd <program.Value const:0>>
movw $0 @density1
# UAssign:<program.UAssign <program.Value name:density2> = UAdd <program.Value const:0>>
movw $0 @density2
# UAssign:<program.UAssign <program.Value name:inter0> = UAdd <program.Value const:0>>
movw $0 @inter0
# UAssign:<program.UAssign <program.Value name:inter1> = UAdd <program.Value const:0>>
movw $0 @inter1
# UAssign:<program.UAssign <program.Value name:previousTracker> = UAdd <program.Value const:9999>>
movw $9999 @previousTracker
# UAssign:<program.UAssign <program.Value name:validationStep> = UAdd <program.Value const:0>>
movw $0 @validationStep
# Inline function for Ed.DriveRightMotor_INLINE_UNLIMITED:<program.Call name:Ed.DriveRightMotor_INLINE_UNLIMITED with args:[<program.Value const:1>, <program.Value const:1>, <program.Value const:0>]>
movb $129 %31
# CTRL_MARKER:<program.ControlMarker marker:15 While start>
:_Control_15_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:validationStep> Lt <program.Value const:7>>
movw @validationStep %_cpu:acc
cmpw $7
brle :_int_0000
movw $1 %_cpu:acc
bra :_int_0001
:_int_0000
movw $0 %_cpu:acc
:_int_0001
stwaw $0
# LOOP_CTRL:<program.LoopControl 15, name:While, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $0
brz :_Control_15_else
# Ed.ReadModuleRegister16Bit:<program.Call <program.Value name:tracker> = name:Ed.ReadModuleRegister16Bit with args:[<program.Value const:0>, <program.Value const:2>]>
movw %02 %_cpu:acc
movw %_cpu:acc @tracker
# CTRL_MARKER:<program.ControlMarker marker:16 If start>
:_Control_16_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:tracker> Gt <program.Value name:previousTracker>>
movw @previousTracker %_cpu:acc
movw %_cpu:acc @_CALC
movw @tracker %_cpu:acc
cmpw @_CALC
brge :_int_0002
movw $1 %_cpu:acc
bra :_int_0003
:_int_0002
movw $0 %_cpu:acc
:_int_0003
stwaw $0
# LOOP_CTRL:<program.LoopControl 16, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $0
brz :_Control_16_else
# CTRL_MARKER:<program.ControlMarker marker:17 If start>
:_Control_17_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:tracker> Sub <program.Value name:previousTracker>>
movw @previousTracker %_cpu:acc
movw %_cpu:acc @_CALC
movw @tracker %_cpu:acc
subw @_CALC
stwaw $0
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:TEMP-0> Gt <program.Value const:150>>
# OPTIMISED OUT (STACK_READ): straw $0
cmpw $150
brge :_int_0004
movw $1 %_cpu:acc
bra :_int_0005
:_int_0004
movw $0 %_cpu:acc
:_int_0005
stwaw $1
# LOOP_CTRL:<program.LoopControl 17, name:If, test:<program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $1
brz :_Control_17_else
# Inline function for Ed.DriveRightMotor_INLINE_UNLIMITED:<program.Call name:Ed.DriveRightMotor_INLINE_UNLIMITED with args:[<program.Value const:0>, <program.Value const:1>, <program.Value const:0>]>
movb $192 %31
# CALL:<program.Call name:Ed.TimeWait with args:[<program.Value const:400>, <program.Value const:1>]>
stinc $3
movw $400 %_cpu:acc
stwaw $0
movw $1 %_cpu:acc
stwaw $1
suba ::_fun_Ed.TimeWait
stdec $3
# CALL:<program.Call name:readAndCalibrate with args:[<program.Value name:validationStep>]>
stinc $3
movw @validationStep %_cpu:acc
stwaw $0
suba ::_fun_readAndCalibrate
stdec $3
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:validationStep> Add <program.Value const:1>>
movw @validationStep %_cpu:acc
addw $1
stwaw $0
# UAssign:<program.UAssign <program.Value name:validationStep> = UAdd <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $0
movw %_cpu:acc @validationStep
# CTRL_MARKER:<program.ControlMarker marker:17 If end>
:_Control_17_else
:_Control_17_end
# CTRL_MARKER:<program.ControlMarker marker:16 If else>
bra :_Control_16_end
:_Control_16_else
# CTRL_MARKER:<program.ControlMarker marker:18 If start>
:_Control_18_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:previousTracker> Sub <program.Value name:tracker>>
movw @tracker %_cpu:acc
movw %_cpu:acc @_CALC
movw @previousTracker %_cpu:acc
subw @_CALC
stwaw $0
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:TEMP-0> Gt <program.Value const:150>>
# OPTIMISED OUT (STACK_READ): straw $0
cmpw $150
brge :_int_0006
movw $1 %_cpu:acc
bra :_int_0007
:_int_0006
movw $0 %_cpu:acc
:_int_0007
stwaw $1
# LOOP_CTRL:<program.LoopControl 18, name:If, test:<program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $1
brz :_Control_18_else
# Inline function for Ed.DriveRightMotor_INLINE_UNLIMITED:<program.Call name:Ed.DriveRightMotor_INLINE_UNLIMITED with args:[<program.Value const:0>, <program.Value const:1>, <program.Value const:0>]>
movb $192 %31
# CALL:<program.Call name:Ed.TimeWait with args:[<program.Value const:400>, <program.Value const:1>]>
stinc $3
movw $400 %_cpu:acc
stwaw $0
movw $1 %_cpu:acc
stwaw $1
suba ::_fun_Ed.TimeWait
stdec $3
# CALL:<program.Call name:readAndCalibrate with args:[<program.Value name:validationStep>]>
stinc $3
movw @validationStep %_cpu:acc
stwaw $0
suba ::_fun_readAndCalibrate
stdec $3
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:validationStep> Add <program.Value const:1>>
movw @validationStep %_cpu:acc
addw $1
stwaw $0
# UAssign:<program.UAssign <program.Value name:validationStep> = UAdd <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $0
movw %_cpu:acc @validationStep
# CTRL_MARKER:<program.ControlMarker marker:18 If end>
:_Control_18_else
:_Control_18_end
# CTRL_MARKER:<program.ControlMarker marker:16 If end>
:_Control_16_end
# CTRL_MARKER:<program.ControlMarker marker:15 While end>
bra :_Control_15_start
:_Control_15_else
:_Control_15_end
# Inline function for Ed.DriveRightMotor_INLINE_UNLIMITED:<program.Call name:Ed.DriveRightMotor_INLINE_UNLIMITED with args:[<program.Value const:0>, <program.Value const:1>, <program.Value const:0>]>
movb $192 %31
# CTRL_MARKER:<program.ControlMarker marker:19 If start>
:_Control_19_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:density2> Gt <program.Value name:density0>>
movw @density0 %_cpu:acc
movw %_cpu:acc @_CALC
movw @density2 %_cpu:acc
cmpw @_CALC
brge :_int_0008
movw $1 %_cpu:acc
bra :_int_0009
:_int_0008
movw $0 %_cpu:acc
:_int_0009
stwaw $0
# LOOP_CTRL:<program.LoopControl 19, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $0
brz :_Control_19_else
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:density0> Add <program.Value name:density1>>
movw @density1 %_cpu:acc
movw %_cpu:acc @_CALC
movw @density0 %_cpu:acc
addw @_CALC
stwaw $0
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:TEMP-0> Div <program.Value const:2>>
# OPTIMISED OUT (STACK_READ): straw $0
divw $2
stwaw $1
# UAssign:<program.UAssign <program.Value name:inter0> = UAdd <program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $1
movw %_cpu:acc @inter0
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:density1> Add <program.Value name:density2>>
movw @density2 %_cpu:acc
movw %_cpu:acc @_CALC
movw @density1 %_cpu:acc
addw @_CALC
stwaw $0
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:TEMP-0> Div <program.Value const:2>>
# OPTIMISED OUT (STACK_READ): straw $0
divw $2
stwaw $1
# UAssign:<program.UAssign <program.Value name:inter1> = UAdd <program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $1
movw %_cpu:acc @inter1
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:density1> Sub <program.Value name:density0>>
movw @density0 %_cpu:acc
movw %_cpu:acc @_CALC
movw @density1 %_cpu:acc
subw @_CALC
stwaw $0
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:TEMP-0> Div <program.Value const:5>>
# OPTIMISED OUT (STACK_READ): straw $0
divw $5
stwaw $1
# BAssign:<program.BAssign <program.Value name:TEMP-2> = <program.Value name:inter0> Add <program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $1
movw %_cpu:acc @_CALC
movw @inter0 %_cpu:acc
addw @_CALC
# OPTIMISED OUT (STACK_WRITE): stwaw $2
# UAssign:<program.UAssign <program.Value name:inter0plus> = UAdd <program.Value name:TEMP-2>>
# OPTIMISED OUT (STACK_READ): straw $2
movw %_cpu:acc @inter0plus
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:density1> Sub <program.Value name:density0>>
movw @density0 %_cpu:acc
movw %_cpu:acc @_CALC
movw @density1 %_cpu:acc
subw @_CALC
stwaw $0
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:TEMP-0> Div <program.Value const:5>>
# OPTIMISED OUT (STACK_READ): straw $0
divw $5
stwaw $1
# BAssign:<program.BAssign <program.Value name:TEMP-2> = <program.Value name:inter0> Sub <program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $1
movw %_cpu:acc @_CALC
movw @inter0 %_cpu:acc
subw @_CALC
# OPTIMISED OUT (STACK_WRITE): stwaw $2
# UAssign:<program.UAssign <program.Value name:inter0minus> = UAdd <program.Value name:TEMP-2>>
# OPTIMISED OUT (STACK_READ): straw $2
movw %_cpu:acc @inter0minus
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:density2> Sub <program.Value name:density1>>
movw @density1 %_cpu:acc
movw %_cpu:acc @_CALC
movw @density2 %_cpu:acc
subw @_CALC
stwaw $0
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:TEMP-0> Div <program.Value const:5>>
# OPTIMISED OUT (STACK_READ): straw $0
divw $5
stwaw $1
# BAssign:<program.BAssign <program.Value name:TEMP-2> = <program.Value name:inter1> Add <program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $1
movw %_cpu:acc @_CALC
movw @inter1 %_cpu:acc
addw @_CALC
# OPTIMISED OUT (STACK_WRITE): stwaw $2
# UAssign:<program.UAssign <program.Value name:inter1plus> = UAdd <program.Value name:TEMP-2>>
# OPTIMISED OUT (STACK_READ): straw $2
movw %_cpu:acc @inter1plus
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:density2> Sub <program.Value name:density1>>
movw @density1 %_cpu:acc
movw %_cpu:acc @_CALC
movw @density2 %_cpu:acc
subw @_CALC
stwaw $0
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:TEMP-0> Div <program.Value const:5>>
# OPTIMISED OUT (STACK_READ): straw $0
divw $5
stwaw $1
# BAssign:<program.BAssign <program.Value name:TEMP-2> = <program.Value name:inter1> Sub <program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $1
movw %_cpu:acc @_CALC
movw @inter1 %_cpu:acc
subw @_CALC
# OPTIMISED OUT (STACK_WRITE): stwaw $2
# UAssign:<program.UAssign <program.Value name:inter1minus> = UAdd <program.Value name:TEMP-2>>
# OPTIMISED OUT (STACK_READ): straw $2
movw %_cpu:acc @inter1minus
# CTRL_MARKER:<program.ControlMarker marker:19 If else>
bra :_Control_19_end
:_Control_19_else
# CTRL_MARKER:<program.ControlMarker marker:20 If start>
:_Control_20_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:density0> Gt <program.Value name:density1>>
movw @density1 %_cpu:acc
movw %_cpu:acc @_CALC
movw @density0 %_cpu:acc
cmpw @_CALC
brge :_int_0010
movw $1 %_cpu:acc
bra :_int_0011
:_int_0010
movw $0 %_cpu:acc
:_int_0011
stwaw $0
# LOOP_CTRL:<program.LoopControl 20, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $0
brz :_Control_20_else
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:density1> Add <program.Value name:density2>>
movw @density2 %_cpu:acc
movw %_cpu:acc @_CALC
movw @density1 %_cpu:acc
addw @_CALC
stwaw $0
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:TEMP-0> Div <program.Value const:2>>
# OPTIMISED OUT (STACK_READ): straw $0
divw $2
stwaw $1
# UAssign:<program.UAssign <program.Value name:inter0> = UAdd <program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $1
movw %_cpu:acc @inter0
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:density2> Add <program.Value name:density0>>
movw @density0 %_cpu:acc
movw %_cpu:acc @_CALC
movw @density2 %_cpu:acc
addw @_CALC
stwaw $0
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:TEMP-0> Div <program.Value const:2>>
# OPTIMISED OUT (STACK_READ): straw $0
divw $2
stwaw $1
# UAssign:<program.UAssign <program.Value name:inter1> = UAdd <program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $1
movw %_cpu:acc @inter1
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:density2> Sub <program.Value name:density1>>
movw @density1 %_cpu:acc
movw %_cpu:acc @_CALC
movw @density2 %_cpu:acc
subw @_CALC
stwaw $0
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:TEMP-0> Div <program.Value const:5>>
# OPTIMISED OUT (STACK_READ): straw $0
divw $5
stwaw $1
# BAssign:<program.BAssign <program.Value name:TEMP-2> = <program.Value name:inter0> Add <program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $1
movw %_cpu:acc @_CALC
movw @inter0 %_cpu:acc
addw @_CALC
# OPTIMISED OUT (STACK_WRITE): stwaw $2
# UAssign:<program.UAssign <program.Value name:inter0plus> = UAdd <program.Value name:TEMP-2>>
# OPTIMISED OUT (STACK_READ): straw $2
movw %_cpu:acc @inter0plus
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:density2> Sub <program.Value name:density1>>
movw @density1 %_cpu:acc
movw %_cpu:acc @_CALC
movw @density2 %_cpu:acc
subw @_CALC
stwaw $0
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:TEMP-0> Div <program.Value const:5>>
# OPTIMISED OUT (STACK_READ): straw $0
divw $5
stwaw $1
# BAssign:<program.BAssign <program.Value name:TEMP-2> = <program.Value name:inter0> Sub <program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $1
movw %_cpu:acc @_CALC
movw @inter0 %_cpu:acc
subw @_CALC
# OPTIMISED OUT (STACK_WRITE): stwaw $2
# UAssign:<program.UAssign <program.Value name:inter0minus> = UAdd <program.Value name:TEMP-2>>
# OPTIMISED OUT (STACK_READ): straw $2
movw %_cpu:acc @inter0minus
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:density0> Sub <program.Value name:density2>>
movw @density2 %_cpu:acc
movw %_cpu:acc @_CALC
movw @density0 %_cpu:acc
subw @_CALC
stwaw $0
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:TEMP-0> Div <program.Value const:5>>
# OPTIMISED OUT (STACK_READ): straw $0
divw $5
stwaw $1
# BAssign:<program.BAssign <program.Value name:TEMP-2> = <program.Value name:inter1> Add <program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $1
movw %_cpu:acc @_CALC
movw @inter1 %_cpu:acc
addw @_CALC
# OPTIMISED OUT (STACK_WRITE): stwaw $2
# UAssign:<program.UAssign <program.Value name:inter1plus> = UAdd <program.Value name:TEMP-2>>
# OPTIMISED OUT (STACK_READ): straw $2
movw %_cpu:acc @inter1plus
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:density0> Sub <program.Value name:density2>>
movw @density2 %_cpu:acc
movw %_cpu:acc @_CALC
movw @density0 %_cpu:acc
subw @_CALC
stwaw $0
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:TEMP-0> Div <program.Value const:5>>
# OPTIMISED OUT (STACK_READ): straw $0
divw $5
stwaw $1
# BAssign:<program.BAssign <program.Value name:TEMP-2> = <program.Value name:inter1> Sub <program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $1
movw %_cpu:acc @_CALC
movw @inter1 %_cpu:acc
subw @_CALC
# OPTIMISED OUT (STACK_WRITE): stwaw $2
# UAssign:<program.UAssign <program.Value name:inter1minus> = UAdd <program.Value name:TEMP-2>>
# OPTIMISED OUT (STACK_READ): straw $2
movw %_cpu:acc @inter1minus
# CTRL_MARKER:<program.ControlMarker marker:20 If else>
bra :_Control_20_end
:_Control_20_else
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:density2> Add <program.Value name:density0>>
movw @density0 %_cpu:acc
movw %_cpu:acc @_CALC
movw @density2 %_cpu:acc
addw @_CALC
stwaw $0
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:TEMP-0> Div <program.Value const:2>>
# OPTIMISED OUT (STACK_READ): straw $0
divw $2
stwaw $1
# UAssign:<program.UAssign <program.Value name:inter0> = UAdd <program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $1
movw %_cpu:acc @inter0
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:density0> Add <program.Value name:density1>>
movw @density1 %_cpu:acc
movw %_cpu:acc @_CALC
movw @density0 %_cpu:acc
addw @_CALC
stwaw $0
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:TEMP-0> Div <program.Value const:2>>
# OPTIMISED OUT (STACK_READ): straw $0
divw $2
stwaw $1
# UAssign:<program.UAssign <program.Value name:inter1> = UAdd <program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $1
movw %_cpu:acc @inter1
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:density0> Sub <program.Value name:density2>>
movw @density2 %_cpu:acc
movw %_cpu:acc @_CALC
movw @density0 %_cpu:acc
subw @_CALC
stwaw $0
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:TEMP-0> Div <program.Value const:5>>
# OPTIMISED OUT (STACK_READ): straw $0
divw $5
stwaw $1
# BAssign:<program.BAssign <program.Value name:TEMP-2> = <program.Value name:inter0> Add <program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $1
movw %_cpu:acc @_CALC
movw @inter0 %_cpu:acc
addw @_CALC
# OPTIMISED OUT (STACK_WRITE): stwaw $2
# UAssign:<program.UAssign <program.Value name:inter0plus> = UAdd <program.Value name:TEMP-2>>
# OPTIMISED OUT (STACK_READ): straw $2
movw %_cpu:acc @inter0plus
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:density0> Sub <program.Value name:density2>>
movw @density2 %_cpu:acc
movw %_cpu:acc @_CALC
movw @density0 %_cpu:acc
subw @_CALC
stwaw $0
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:TEMP-0> Div <program.Value const:5>>
# OPTIMISED OUT (STACK_READ): straw $0
divw $5
stwaw $1
# BAssign:<program.BAssign <program.Value name:TEMP-2> = <program.Value name:inter0> Sub <program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $1
movw %_cpu:acc @_CALC
movw @inter0 %_cpu:acc
subw @_CALC
# OPTIMISED OUT (STACK_WRITE): stwaw $2
# UAssign:<program.UAssign <program.Value name:inter0minus> = UAdd <program.Value name:TEMP-2>>
# OPTIMISED OUT (STACK_READ): straw $2
movw %_cpu:acc @inter0minus
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:density1> Sub <program.Value name:density0>>
movw @density0 %_cpu:acc
movw %_cpu:acc @_CALC
movw @density1 %_cpu:acc
subw @_CALC
stwaw $0
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:TEMP-0> Div <program.Value const:5>>
# OPTIMISED OUT (STACK_READ): straw $0
divw $5
stwaw $1
# BAssign:<program.BAssign <program.Value name:TEMP-2> = <program.Value name:inter1> Add <program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $1
movw %_cpu:acc @_CALC
movw @inter1 %_cpu:acc
addw @_CALC
# OPTIMISED OUT (STACK_WRITE): stwaw $2
# UAssign:<program.UAssign <program.Value name:inter1plus> = UAdd <program.Value name:TEMP-2>>
# OPTIMISED OUT (STACK_READ): straw $2
movw %_cpu:acc @inter1plus
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:density1> Sub <program.Value name:density0>>
movw @density0 %_cpu:acc
movw %_cpu:acc @_CALC
movw @density1 %_cpu:acc
subw @_CALC
stwaw $0
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:TEMP-0> Div <program.Value const:5>>
# OPTIMISED OUT (STACK_READ): straw $0
divw $5
stwaw $1
# BAssign:<program.BAssign <program.Value name:TEMP-2> = <program.Value name:inter1> Sub <program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $1
movw %_cpu:acc @_CALC
movw @inter1 %_cpu:acc
subw @_CALC
# OPTIMISED OUT (STACK_WRITE): stwaw $2
# UAssign:<program.UAssign <program.Value name:inter1minus> = UAdd <program.Value name:TEMP-2>>
# OPTIMISED OUT (STACK_READ): straw $2
movw %_cpu:acc @inter1minus
# CTRL_MARKER:<program.ControlMarker marker:20 If end>
:_Control_20_end
# CTRL_MARKER:<program.ControlMarker marker:19 If end>
:_Control_19_end
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:1>]>
movb $1 %b1
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:1>, <program.Value const:1>, <program.Value const:1>]>
movb $1 %11
# CTRL_MARKER:<program.ControlMarker marker:21 While start>
:_Control_21_start
# CALL:<program.Call <program.Value name:TEMP-0> = name:Ed.ReadKeypad with args:[]>
stinc $2
suba ::_fun_Ed.ReadKeypad
straw $0
stwaw $2
stdec $2
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:TEMP-0> NotEq <program.Value const:1>>
straw $0
cmpw $1
bre :_int_0012
movw $1 %_cpu:acc
bra :_int_0013
:_int_0012
movw $0 %_cpu:acc
:_int_0013
stwaw $1
# LOOP_CTRL:<program.LoopControl 21, name:While, test:<program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $1
brz :_Control_21_else
# CTRL_MARKER:<program.ControlMarker marker:21 While end>
bra :_Control_21_start
:_Control_21_else
:_Control_21_end
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:1>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %11
# UAssign:<program.UAssign <program.Value name:previousColor> = UAdd <program.Value const:-1>>
movw $-1 @previousColor
# CTRL_MARKER:<program.ControlMarker marker:22 While start>
:_Control_22_start
# LOOP_CTRL:<program.LoopControl 22, name:While, test:<program.Value const:1>>
movw $1 %_cpu:acc
brz :_Control_22_else
# Inline function for Ed.DriveRightMotor_INLINE_UNLIMITED:<program.Call name:Ed.DriveRightMotor_INLINE_UNLIMITED with args:[<program.Value const:1>, <program.Value const:1>, <program.Value const:0>]>
movb $129 %31
# Ed.ReadModuleRegister16Bit:<program.Call <program.Value name:tracker> = name:Ed.ReadModuleRegister16Bit with args:[<program.Value const:0>, <program.Value const:2>]>
movw %02 %_cpu:acc
movw %_cpu:acc @tracker
# CTRL_MARKER:<program.ControlMarker marker:23 If start>
:_Control_23_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:tracker> Lt <program.Value name:inter0>>
movw @inter0 %_cpu:acc
movw %_cpu:acc @_CALC
movw @tracker %_cpu:acc
cmpw @_CALC
brle :_int_0014
movw $1 %_cpu:acc
bra :_int_0015
:_int_0014
movw $0 %_cpu:acc
:_int_0015
stwaw $0
# LOOP_CTRL:<program.LoopControl 23, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $0
brz :_Control_23_else
# Ed.ReadModuleRegister16Bit:<program.Call <program.Value name:tracker> = name:Ed.ReadModuleRegister16Bit with args:[<program.Value const:0>, <program.Value const:2>]>
movw %02 %_cpu:acc
movw %_cpu:acc @tracker
# CTRL_MARKER:<program.ControlMarker marker:24 While start>
:_Control_24_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:tracker> Lt <program.Value name:inter0plus>>
movw @inter0plus %_cpu:acc
movw %_cpu:acc @_CALC
movw @tracker %_cpu:acc
cmpw @_CALC
brle :_int_0016
movw $1 %_cpu:acc
bra :_int_0017
:_int_0016
movw $0 %_cpu:acc
:_int_0017
stwaw $0
# LOOP_CTRL:<program.LoopControl 24, name:While, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $0
brz :_Control_24_else
# Ed.ReadModuleRegister16Bit:<program.Call <program.Value name:tracker> = name:Ed.ReadModuleRegister16Bit with args:[<program.Value const:0>, <program.Value const:2>]>
movw %02 %_cpu:acc
movw %_cpu:acc @tracker
# CTRL_MARKER:<program.ControlMarker marker:24 While end>
bra :_Control_24_start
:_Control_24_else
:_Control_24_end
# CTRL_MARKER:<program.ControlMarker marker:23 If else>
bra :_Control_23_end
:_Control_23_else
# CTRL_MARKER:<program.ControlMarker marker:25 If start>
:_Control_25_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:tracker> Lt <program.Value name:inter1>>
movw @inter1 %_cpu:acc
movw %_cpu:acc @_CALC
movw @tracker %_cpu:acc
cmpw @_CALC
brle :_int_0018
movw $1 %_cpu:acc
bra :_int_0019
:_int_0018
movw $0 %_cpu:acc
:_int_0019
stwaw $0
# LOOP_CTRL:<program.LoopControl 25, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $0
brz :_Control_25_else
# Ed.ReadModuleRegister16Bit:<program.Call <program.Value name:tracker> = name:Ed.ReadModuleRegister16Bit with args:[<program.Value const:0>, <program.Value const:2>]>
movw %02 %_cpu:acc
movw %_cpu:acc @tracker
# CTRL_MARKER:<program.ControlMarker marker:26 While start>
:_Control_26_start
# CTRL_MARKER:<program.ControlMarker marker:27 And start>
:_Control_27_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:tracker> Gt <program.Value name:inter0minus>>
movw @inter0minus %_cpu:acc
movw %_cpu:acc @_CALC
movw @tracker %_cpu:acc
cmpw @_CALC
brge :_int_0020
movw $1 %_cpu:acc
bra :_int_0021
:_int_0020
movw $0 %_cpu:acc
:_int_0021
stwaw $0
# BOOL_CHK:<program.BoolCheck 27 And check:<program.Value name:TEMP-0>, target<program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $0
brnz :_int_0022
movw $0 %_cpu:acc
stwaw $1
bra :_Control_27_end
:_int_0022
# BAssign:<program.BAssign <program.Value name:TEMP-2> = <program.Value name:tracker> Lt <program.Value name:inter1plus>>
movw @inter1plus %_cpu:acc
movw %_cpu:acc @_CALC
movw @tracker %_cpu:acc
cmpw @_CALC
brle :_int_0023
movw $1 %_cpu:acc
bra :_int_0024
:_int_0023
movw $0 %_cpu:acc
:_int_0024
# OPTIMISED OUT (STACK_WRITE): stwaw $2
# BOOL_CHK:<program.BoolCheck 27 And check:<program.Value name:TEMP-2>, target<program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $2
brnz :_int_0025
movw $0 %_cpu:acc
stwaw $1
bra :_Control_27_end
:_int_0025
# BOOL_CHK:<program.BoolCheck 27 Done check:<program.Value const:1>, target<program.Value name:TEMP-1>>
movw $1 %_cpu:acc
stwaw $1
# CTRL_MARKER:<program.ControlMarker marker:27 And end>
:_Control_27_else
:_Control_27_end
# LOOP_CTRL:<program.LoopControl 26, name:While, test:<program.Value name:TEMP-1>>
straw $1
brz :_Control_26_else
# Ed.ReadModuleRegister16Bit:<program.Call <program.Value name:tracker> = name:Ed.ReadModuleRegister16Bit with args:[<program.Value const:0>, <program.Value const:2>]>
movw %02 %_cpu:acc
movw %_cpu:acc @tracker
# CTRL_MARKER:<program.ControlMarker marker:26 While end>
bra :_Control_26_start
:_Control_26_else
:_Control_26_end
# CTRL_MARKER:<program.ControlMarker marker:25 If else>
bra :_Control_25_end
:_Control_25_else
# Ed.ReadModuleRegister16Bit:<program.Call <program.Value name:tracker> = name:Ed.ReadModuleRegister16Bit with args:[<program.Value const:0>, <program.Value const:2>]>
movw %02 %_cpu:acc
movw %_cpu:acc @tracker
# CTRL_MARKER:<program.ControlMarker marker:28 While start>
:_Control_28_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:tracker> Gt <program.Value name:inter1minus>>
movw @inter1minus %_cpu:acc
movw %_cpu:acc @_CALC
movw @tracker %_cpu:acc
cmpw @_CALC
brge :_int_0026
movw $1 %_cpu:acc
bra :_int_0027
:_int_0026
movw $0 %_cpu:acc
:_int_0027
stwaw $0
# LOOP_CTRL:<program.LoopControl 28, name:While, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $0
brz :_Control_28_else
# Ed.ReadModuleRegister16Bit:<program.Call <program.Value name:tracker> = name:Ed.ReadModuleRegister16Bit with args:[<program.Value const:0>, <program.Value const:2>]>
movw %02 %_cpu:acc
movw %_cpu:acc @tracker
# CTRL_MARKER:<program.ControlMarker marker:28 While end>
bra :_Control_28_start
:_Control_28_else
:_Control_28_end
# CTRL_MARKER:<program.ControlMarker marker:25 If end>
:_Control_25_end
# CTRL_MARKER:<program.ControlMarker marker:23 If end>
:_Control_23_end
# CALL:<program.Call name:Ed.TimeWait with args:[<program.Value const:10>, <program.Value const:1>]>
stinc $3
movw $10 %_cpu:acc
stwaw $0
movw $1 %_cpu:acc
stwaw $1
suba ::_fun_Ed.TimeWait
stdec $3
# Inline function for Ed.DriveRightMotor_INLINE_UNLIMITED:<program.Call name:Ed.DriveRightMotor_INLINE_UNLIMITED with args:[<program.Value const:0>, <program.Value const:1>, <program.Value const:0>]>
movb $192 %31
# Ed.ReadModuleRegister16Bit:<program.Call <program.Value name:tracker> = name:Ed.ReadModuleRegister16Bit with args:[<program.Value const:0>, <program.Value const:2>]>
movw %02 %_cpu:acc
movw %_cpu:acc @tracker
# CTRL_MARKER:<program.ControlMarker marker:29 If start>
:_Control_29_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:tracker> Lt <program.Value name:inter0>>
movw @inter0 %_cpu:acc
movw %_cpu:acc @_CALC
movw @tracker %_cpu:acc
cmpw @_CALC
brle :_int_0028
movw $1 %_cpu:acc
bra :_int_0029
:_int_0028
movw $0 %_cpu:acc
:_int_0029
stwaw $0
# LOOP_CTRL:<program.LoopControl 29, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $0
brz :_Control_29_else
# UAssign:<program.UAssign <program.Value name:currentColor> = UAdd <program.Value const:0>>
movw $0 @currentColor
# CTRL_MARKER:<program.ControlMarker marker:29 If else>
bra :_Control_29_end
:_Control_29_else
# CTRL_MARKER:<program.ControlMarker marker:30 If start>
:_Control_30_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:tracker> Lt <program.Value name:inter1>>
movw @inter1 %_cpu:acc
movw %_cpu:acc @_CALC
movw @tracker %_cpu:acc
cmpw @_CALC
brle :_int_0030
movw $1 %_cpu:acc
bra :_int_0031
:_int_0030
movw $0 %_cpu:acc
:_int_0031
stwaw $0
# LOOP_CTRL:<program.LoopControl 30, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $0
brz :_Control_30_else
# UAssign:<program.UAssign <program.Value name:currentColor> = UAdd <program.Value const:1>>
movw $1 @currentColor
# CTRL_MARKER:<program.ControlMarker marker:30 If else>
bra :_Control_30_end
:_Control_30_else
# UAssign:<program.UAssign <program.Value name:currentColor> = UAdd <program.Value const:2>>
movw $2 @currentColor
# CTRL_MARKER:<program.ControlMarker marker:30 If end>
:_Control_30_end
# CTRL_MARKER:<program.ControlMarker marker:29 If end>
:_Control_29_end
# CALL:<program.Call name:sendPlayMessage with args:[<program.Value name:previousColor>, <program.Value name:currentColor>]>
stinc $4
movw @previousColor %_cpu:acc
stwaw $0
movw @currentColor %_cpu:acc
stwaw $1
suba ::_fun_sendPlayMessage
stdec $4
# UAssign:<program.UAssign <program.Value name:previousColor> = UAdd <program.Value name:currentColor>>
movw @currentColor @previousColor
# CTRL_MARKER:<program.ControlMarker marker:22 While end>
bra :_Control_22_start
:_Control_22_else
:_Control_22_end
stop
:_end___main__

# FUNCTION:readAndCalibrate
::_fun_readAndCalibrate
# CALL:<program.Call name:Ed.Drive_CM with args:[<program.Value const:5>, <program.Value const:1>, <program.Value const:20>]>
stinc $6
movw $5 %_cpu:acc
stwaw $0
movw $1 %_cpu:acc
stwaw $1
movw $20 %_cpu:acc
stwaw $2
suba ::_fun_Ed.Drive_CM
stdec $6
# Ed.ReadModuleRegister16Bit:<program.Call <program.Value name:currentTracker> = name:Ed.ReadModuleRegister16Bit with args:[<program.Value const:0>, <program.Value const:2>]>
movw %02 %_cpu:acc
stwaw $4
# CTRL_MARKER:<program.ControlMarker marker:0 If start>
:_Control_0_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:validationStep> Gt <program.Value const:0>>
straw $3
cmpw $0
brge :_int_0032
movw $1 %_cpu:acc
bra :_int_0033
:_int_0032
movw $0 %_cpu:acc
:_int_0033
# OPTIMISED OUT (STACK_WRITE): stwaw $5
# LOOP_CTRL:<program.LoopControl 0, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $5
brz :_Control_0_else
# CALL:<program.Call name:Ed.SendIRData with args:[<program.Value name:MESSAGE_CALIBRATE>]>
stinc $1
movw @MESSAGE_CALIBRATE %_cpu:acc
stwaw $0
suba ::_fun_Ed.SendIRData
stdec $1
# CALL:<program.Call name:Ed.SendIRData with args:[<program.Value name:MESSAGE_CALIBRATE>]>
stinc $1
movw @MESSAGE_CALIBRATE %_cpu:acc
stwaw $0
suba ::_fun_Ed.SendIRData
stdec $1
# CALL:<program.Call name:Ed.SendIRData with args:[<program.Value name:MESSAGE_CALIBRATE>]>
stinc $1
movw @MESSAGE_CALIBRATE %_cpu:acc
stwaw $0
suba ::_fun_Ed.SendIRData
stdec $1
# CTRL_MARKER:<program.ControlMarker marker:0 If end>
:_Control_0_else
:_Control_0_end
# CTRL_MARKER:<program.ControlMarker marker:1 If start>
:_Control_1_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:validationStep> Eq <program.Value const:1>>
straw $3
cmpw $1
brne :_int_0034
movw $1 %_cpu:acc
bra :_int_0035
:_int_0034
movw $0 %_cpu:acc
:_int_0035
# OPTIMISED OUT (STACK_WRITE): stwaw $5
# LOOP_CTRL:<program.LoopControl 1, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $5
brz :_Control_1_else
# UAssign:<program.UAssign <program.Value name:density0> = UAdd <program.Value name:currentTracker>>
straw $4
movw %_cpu:acc @density0
# CTRL_MARKER:<program.ControlMarker marker:1 If else>
bra :_Control_1_end
:_Control_1_else
# CTRL_MARKER:<program.ControlMarker marker:2 If start>
:_Control_2_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:validationStep> Eq <program.Value const:2>>
straw $3
cmpw $2
brne :_int_0036
movw $1 %_cpu:acc
bra :_int_0037
:_int_0036
movw $0 %_cpu:acc
:_int_0037
# OPTIMISED OUT (STACK_WRITE): stwaw $5
# LOOP_CTRL:<program.LoopControl 2, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $5
brz :_Control_2_else
# UAssign:<program.UAssign <program.Value name:density1> = UAdd <program.Value name:currentTracker>>
straw $4
movw %_cpu:acc @density1
# CTRL_MARKER:<program.ControlMarker marker:2 If else>
bra :_Control_2_end
:_Control_2_else
# CTRL_MARKER:<program.ControlMarker marker:3 If start>
:_Control_3_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:validationStep> Eq <program.Value const:3>>
straw $3
cmpw $3
brne :_int_0038
movw $1 %_cpu:acc
bra :_int_0039
:_int_0038
movw $0 %_cpu:acc
:_int_0039
# OPTIMISED OUT (STACK_WRITE): stwaw $5
# LOOP_CTRL:<program.LoopControl 3, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $5
brz :_Control_3_else
# UAssign:<program.UAssign <program.Value name:density2> = UAdd <program.Value name:currentTracker>>
straw $4
movw %_cpu:acc @density2
# CTRL_MARKER:<program.ControlMarker marker:3 If end>
:_Control_3_else
:_Control_3_end
# CTRL_MARKER:<program.ControlMarker marker:2 If end>
:_Control_2_end
# CTRL_MARKER:<program.ControlMarker marker:1 If end>
:_Control_1_end
# UAssign:<program.UAssign <program.Value name:previousTracker> = UAdd <program.Value name:currentTracker>>
straw $4
movw %_cpu:acc @previousTracker
# CALL:<program.Call name:Ed.TimeWait with args:[<program.Value const:250>, <program.Value const:1>]>
stinc $3
movw $250 %_cpu:acc
stwaw $0
movw $1 %_cpu:acc
stwaw $1
suba ::_fun_Ed.TimeWait
stdec $3
# Inline function for Ed.DriveRightMotor_INLINE_UNLIMITED:<program.Call name:Ed.DriveRightMotor_INLINE_UNLIMITED with args:[<program.Value const:1>, <program.Value const:1>, <program.Value const:0>]>
movb $129 %31
ret
:_end_readAndCalibrate

# FUNCTION:sendPlayMessage
::_fun_sendPlayMessage
# CALL:<program.Call name:testButton with args:[]>
stinc $4
suba ::_fun_testButton
stdec $4
# CTRL_MARKER:<program.ControlMarker marker:4 If start>
:_Control_4_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:currentColor> Eq <program.Value const:0>>
straw $4
cmpw $0
brne :_int_0040
movw $1 %_cpu:acc
bra :_int_0041
:_int_0040
movw $0 %_cpu:acc
:_int_0041
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# LOOP_CTRL:<program.LoopControl 4, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $6
brz :_Control_4_else
# UAssign:<program.UAssign <program.Value name:message> = UAdd <program.Value name:MESSAGE_LOW>>
movw @MESSAGE_LOW %_cpu:acc
stwaw $5
# CTRL_MARKER:<program.ControlMarker marker:4 If else>
bra :_Control_4_end
:_Control_4_else
# CTRL_MARKER:<program.ControlMarker marker:5 If start>
:_Control_5_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:currentColor> Eq <program.Value const:1>>
straw $4
cmpw $1
brne :_int_0042
movw $1 %_cpu:acc
bra :_int_0043
:_int_0042
movw $0 %_cpu:acc
:_int_0043
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# LOOP_CTRL:<program.LoopControl 5, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $6
brz :_Control_5_else
# CTRL_MARKER:<program.ControlMarker marker:6 If start>
:_Control_6_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:previousColor> Eq <program.Value const:0>>
straw $3
cmpw $0
brne :_int_0044
movw $1 %_cpu:acc
bra :_int_0045
:_int_0044
movw $0 %_cpu:acc
:_int_0045
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# LOOP_CTRL:<program.LoopControl 6, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $6
brz :_Control_6_else
# UAssign:<program.UAssign <program.Value name:message> = UAdd <program.Value name:MESSAGE_LOW>>
movw @MESSAGE_LOW %_cpu:acc
stwaw $5
# CTRL_MARKER:<program.ControlMarker marker:6 If else>
bra :_Control_6_end
:_Control_6_else
# UAssign:<program.UAssign <program.Value name:message> = UAdd <program.Value name:MESSAGE_HIGH>>
movw @MESSAGE_HIGH %_cpu:acc
stwaw $5
# CTRL_MARKER:<program.ControlMarker marker:6 If end>
:_Control_6_end
# CTRL_MARKER:<program.ControlMarker marker:5 If else>
bra :_Control_5_end
:_Control_5_else
# UAssign:<program.UAssign <program.Value name:message> = UAdd <program.Value name:MESSAGE_HIGH>>
movw @MESSAGE_HIGH %_cpu:acc
stwaw $5
# CTRL_MARKER:<program.ControlMarker marker:5 If end>
:_Control_5_end
# CTRL_MARKER:<program.ControlMarker marker:4 If end>
:_Control_4_end
# CTRL_MARKER:<program.ControlMarker marker:7 If start>
:_Control_7_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:previousColor> Gt <program.Value const:-1>>
straw $3
cmpw $-1
brge :_int_0046
movw $1 %_cpu:acc
bra :_int_0047
:_int_0046
movw $0 %_cpu:acc
:_int_0047
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# LOOP_CTRL:<program.LoopControl 7, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $6
brz :_Control_7_else
# CALL:<program.Call name:Ed.SendIRData with args:[<program.Value name:message>]>
stinc $1
straw $6
stwaw $0
suba ::_fun_Ed.SendIRData
stdec $1
# CALL:<program.Call name:Ed.SendIRData with args:[<program.Value name:message>]>
stinc $1
straw $6
stwaw $0
suba ::_fun_Ed.SendIRData
stdec $1
# CALL:<program.Call name:Ed.SendIRData with args:[<program.Value name:message>]>
stinc $1
straw $6
stwaw $0
suba ::_fun_Ed.SendIRData
stdec $1
# CTRL_MARKER:<program.ControlMarker marker:7 If end>
:_Control_7_else
:_Control_7_end
# CALL:<program.Call name:Ed.TimeWait with args:[<program.Value name:slowingPause>, <program.Value const:1>]>
stinc $3
movw @slowingPause %_cpu:acc
stwaw $0
movw $1 %_cpu:acc
stwaw $1
suba ::_fun_Ed.TimeWait
stdec $3
# Inline function for Ed.DriveRightMotor_INLINE_UNLIMITED:<program.Call name:Ed.DriveRightMotor_INLINE_UNLIMITED with args:[<program.Value const:1>, <program.Value const:1>, <program.Value const:0>]>
movb $129 %31
ret
:_end_sendPlayMessage

# FUNCTION:testButton
::_fun_testButton
# CALL:<program.Call <program.Value name:keypad> = name:Ed.ReadKeypad with args:[]>
stinc $2
suba ::_fun_Ed.ReadKeypad
straw $0
stwaw $5
stdec $2
# CTRL_MARKER:<program.ControlMarker marker:8 If start>
:_Control_8_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:keypad> Eq <program.Value const:4>>
straw $3
cmpw $4
brne :_int_0048
movw $1 %_cpu:acc
bra :_int_0049
:_int_0048
movw $0 %_cpu:acc
:_int_0049
stwaw $5
# LOOP_CTRL:<program.LoopControl 8, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $5
brz :_Control_8_else
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:1>]>
movb $1 %b1
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:1>, <program.Value const:1>, <program.Value const:1>]>
movb $1 %11
# CALL:<program.Call name:Ed.SendIRData with args:[<program.Value name:MESSAGE_PAUSE>]>
stinc $1
movw @MESSAGE_PAUSE %_cpu:acc
stwaw $0
suba ::_fun_Ed.SendIRData
stdec $1
# CALL:<program.Call name:Ed.SendIRData with args:[<program.Value name:MESSAGE_PAUSE>]>
stinc $1
movw @MESSAGE_PAUSE %_cpu:acc
stwaw $0
suba ::_fun_Ed.SendIRData
stdec $1
# CALL:<program.Call name:Ed.SendIRData with args:[<program.Value name:MESSAGE_PAUSE>]>
stinc $1
movw @MESSAGE_PAUSE %_cpu:acc
stwaw $0
suba ::_fun_Ed.SendIRData
stdec $1
# CTRL_MARKER:<program.ControlMarker marker:9 While start>
:_Control_9_start
# CALL:<program.Call <program.Value name:TEMP-0> = name:Ed.ReadKeypad with args:[]>
stinc $2
suba ::_fun_Ed.ReadKeypad
straw $0
stwaw $7
stdec $2
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:TEMP-0> NotEq <program.Value const:1>>
straw $5
cmpw $1
bre :_int_0050
movw $1 %_cpu:acc
bra :_int_0051
:_int_0050
movw $0 %_cpu:acc
:_int_0051
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# LOOP_CTRL:<program.LoopControl 9, name:While, test:<program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $6
brz :_Control_9_else
# CTRL_MARKER:<program.ControlMarker marker:9 While end>
bra :_Control_9_start
:_Control_9_else
:_Control_9_end
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:1>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %11
# CTRL_MARKER:<program.ControlMarker marker:8 If else>
bra :_Control_8_end
:_Control_8_else
# CTRL_MARKER:<program.ControlMarker marker:10 If start>
:_Control_10_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:keypad> Eq <program.Value const:1>>
straw $3
cmpw $1
brne :_int_0052
movw $1 %_cpu:acc
bra :_int_0053
:_int_0052
movw $0 %_cpu:acc
:_int_0053
stwaw $5
# LOOP_CTRL:<program.LoopControl 10, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $5
brz :_Control_10_else
# CTRL_MARKER:<program.ControlMarker marker:11 If start>
:_Control_11_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:slowingPause> Eq <program.Value const:350>>
movw @slowingPause %_cpu:acc
cmpw $350
brne :_int_0054
movw $1 %_cpu:acc
bra :_int_0055
:_int_0054
movw $0 %_cpu:acc
:_int_0055
stwaw $5
# LOOP_CTRL:<program.LoopControl 11, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $5
brz :_Control_11_else
# UAssign:<program.UAssign <program.Value name:slowingPause> = UAdd <program.Value const:200>>
movw $200 @slowingPause
# CTRL_MARKER:<program.ControlMarker marker:11 If else>
bra :_Control_11_end
:_Control_11_else
# CTRL_MARKER:<program.ControlMarker marker:12 If start>
:_Control_12_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:slowingPause> Eq <program.Value const:200>>
movw @slowingPause %_cpu:acc
cmpw $200
brne :_int_0056
movw $1 %_cpu:acc
bra :_int_0057
:_int_0056
movw $0 %_cpu:acc
:_int_0057
stwaw $5
# LOOP_CTRL:<program.LoopControl 12, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $5
brz :_Control_12_else
# UAssign:<program.UAssign <program.Value name:slowingPause> = UAdd <program.Value const:80>>
movw $80 @slowingPause
# CTRL_MARKER:<program.ControlMarker marker:12 If else>
bra :_Control_12_end
:_Control_12_else
# CTRL_MARKER:<program.ControlMarker marker:13 If start>
:_Control_13_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:slowingPause> Eq <program.Value const:80>>
movw @slowingPause %_cpu:acc
cmpw $80
brne :_int_0058
movw $1 %_cpu:acc
bra :_int_0059
:_int_0058
movw $0 %_cpu:acc
:_int_0059
stwaw $5
# LOOP_CTRL:<program.LoopControl 13, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $5
brz :_Control_13_else
# UAssign:<program.UAssign <program.Value name:slowingPause> = UAdd <program.Value const:350>>
movw $350 @slowingPause
# CTRL_MARKER:<program.ControlMarker marker:13 If end>
:_Control_13_else
:_Control_13_end
# CTRL_MARKER:<program.ControlMarker marker:12 If end>
:_Control_12_end
# CTRL_MARKER:<program.ControlMarker marker:11 If end>
:_Control_11_end
# UAssign:<program.UAssign <program.Value name:i> = UAdd <program.Value const:0>>
movw $0 %_cpu:acc
stwaw $4
# CTRL_MARKER:<program.ControlMarker marker:14 While start>
:_Control_14_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:i> Lt <program.Value const:3>>
straw $4
cmpw $3
brle :_int_0060
movw $1 %_cpu:acc
bra :_int_0061
:_int_0060
movw $0 %_cpu:acc
:_int_0061
stwaw $5
# LOOP_CTRL:<program.LoopControl 14, name:While, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $5
brz :_Control_14_else
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:1>]>
movb $1 %b1
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:1>, <program.Value const:1>, <program.Value const:1>]>
movb $1 %11
# CALL:<program.Call name:Ed.TimeWait with args:[<program.Value const:20>, <program.Value const:1>]>
stinc $3
movw $20 %_cpu:acc
stwaw $0
movw $1 %_cpu:acc
stwaw $1
suba ::_fun_Ed.TimeWait
stdec $3
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:1>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %11
# CALL:<program.Call name:Ed.TimeWait with args:[<program.Value const:20>, <program.Value const:1>]>
stinc $3
movw $20 %_cpu:acc
stwaw $0
movw $1 %_cpu:acc
stwaw $1
suba ::_fun_Ed.TimeWait
stdec $3
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:i> Add <program.Value const:1>>
straw $4
addw $1
stwaw $5
# UAssign:<program.UAssign <program.Value name:i> = UAdd <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $5
stwaw $4
# CTRL_MARKER:<program.ControlMarker marker:14 While end>
bra :_Control_14_start
:_Control_14_else
:_Control_14_end
# CTRL_MARKER:<program.ControlMarker marker:10 If end>
:_Control_10_else
:_Control_10_end
# CTRL_MARKER:<program.ControlMarker marker:8 If end>
:_Control_8_end
ret
:_end_testButton

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

# FUNCTION:Ed.SendIRData
::_fun_Ed.SendIRData
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:7>, <program.Value const:0>, <program.Value const:0>]>
movb $0 %70
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:7>, <program.Value const:1>, <program.Value name:data>]>
straw $3
conv
movb %_cpu:acc %71
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:7>, <program.Value const:0>, <program.Value const:1>]>
movb $1 %70
ret
:_end_Ed.SendIRData

# FUNCTION:Ed.TimeWait
::_fun_Ed.TimeWait
# BAssign:<program.BAssign <program.Value name:units> = <program.Value name:units> BitAnd <program.Value const:1>>
straw $4
andw $1
stwaw $4
# CTRL_MARKER:<program.ControlMarker marker:33 If start>
:_Control_33_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:units> Eq <program.Value const:0>>
straw $4
cmpw $0
brne :_int_0062
movw $1 %_cpu:acc
bra :_int_0063
:_int_0062
movw $0 %_cpu:acc
:_int_0063
# OPTIMISED OUT (STACK_WRITE): stwaw $5
# LOOP_CTRL:<program.LoopControl 33, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $5
brz :_Control_33_else
# BAssign:<program.BAssign <program.Value name:time> = <program.Value name:time> Mult <program.Value const:100>>
straw $3
mulw $100
stwaw $3
# CTRL_MARKER:<program.ControlMarker marker:33 If else>
bra :_Control_33_end
:_Control_33_else
# BAssign:<program.BAssign <program.Value name:time> = <program.Value name:time> Div <program.Value const:10>>
straw $3
divw $10
stwaw $3
# CTRL_MARKER:<program.ControlMarker marker:33 If end>
:_Control_33_end
# Ed.WriteModuleRegister16Bit:<program.Call name:Ed.WriteModuleRegister16Bit with args:[<program.Value const:14>, <program.Value const:2>, <program.Value name:time>]>
straw $3
movw %_cpu:acc %e2
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:14>, <program.Value const:1>, <program.Value const:2>]>
movb $2 %e1
ret
:_end_Ed.TimeWait

# FUNCTION:Ed.FinishDrive_SPACE
::_fun_Ed.FinishDrive_SPACE
# CTRL_MARKER:<program.ControlMarker marker:36 While start>
:_Control_36_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:distance> Gt <program.Value const:0>>
straw $3
cmpw $0
brge :_int_0064
movw $1 %_cpu:acc
bra :_int_0065
:_int_0064
movw $0 %_cpu:acc
:_int_0065
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# LOOP_CTRL:<program.LoopControl 36, name:While, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $6
brz :_Control_36_else
# UAssign:<program.UAssign <program.Value name:distance> = UAdd <program.Value const:0>>
movw $0 %_cpu:acc
stwaw $3
# CTRL_MARKER:<program.ControlMarker marker:37 If start>
:_Control_37_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:left> NotEq <program.Value const:192>>
straw $4
cmpw $192
bre :_int_0066
movw $1 %_cpu:acc
bra :_int_0067
:_int_0066
movw $0 %_cpu:acc
:_int_0067
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# LOOP_CTRL:<program.LoopControl 37, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $6
brz :_Control_37_else
# Ed.ReadModuleRegister16Bit:<program.Call <program.Value name:TEMP-0> = name:Ed.ReadModuleRegister16Bit with args:[<program.Value const:8>, <program.Value const:2>]>
movw %82 %_cpu:acc
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# BAssign:<program.BAssign <program.Value name:distance> = <program.Value name:distance> Add <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $6
movw %_cpu:acc @_CALC
straw $3
addw @_CALC
stwaw $3
# CTRL_MARKER:<program.ControlMarker marker:37 If end>
:_Control_37_else
:_Control_37_end
# CTRL_MARKER:<program.ControlMarker marker:38 If start>
:_Control_38_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:right> NotEq <program.Value const:192>>
straw $5
cmpw $192
bre :_int_0068
movw $1 %_cpu:acc
bra :_int_0069
:_int_0068
movw $0 %_cpu:acc
:_int_0069
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# LOOP_CTRL:<program.LoopControl 38, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $6
brz :_Control_38_else
# Ed.ReadModuleRegister16Bit:<program.Call <program.Value name:TEMP-0> = name:Ed.ReadModuleRegister16Bit with args:[<program.Value const:3>, <program.Value const:2>]>
movw %32 %_cpu:acc
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# BAssign:<program.BAssign <program.Value name:distance> = <program.Value name:distance> Add <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $6
movw %_cpu:acc @_CALC
straw $3
addw @_CALC
stwaw $3
# CTRL_MARKER:<program.ControlMarker marker:38 If end>
:_Control_38_else
:_Control_38_end
# CTRL_MARKER:<program.ControlMarker marker:36 While end>
bra :_Control_36_start
:_Control_36_else
:_Control_36_end
ret
:_end_Ed.FinishDrive_SPACE

# FUNCTION:Ed.Drive_CM
::_fun_Ed.Drive_CM
# CTRL_MARKER:<program.ControlMarker marker:42 If start>
:_Control_42_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:direction> Lt <program.Value const:3>>
straw $3
cmpw $3
brle :_int_0070
movw $1 %_cpu:acc
bra :_int_0071
:_int_0070
movw $0 %_cpu:acc
:_int_0071
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# LOOP_CTRL:<program.LoopControl 42, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_42_else
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
# CTRL_MARKER:<program.ControlMarker marker:42 If else>
bra :_Control_42_end
:_Control_42_else
# UAssign:<program.UAssign <program.Value name:leftCtrl> = UAdd <program.Value const:192>>
movw $192 %_cpu:acc
stwaw $6
# UAssign:<program.UAssign <program.Value name:rightCtrl> = UAdd <program.Value const:192>>
movw $192 %_cpu:acc
stwaw $7
# CTRL_MARKER:<program.ControlMarker marker:43 If start>
:_Control_43_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:direction> Eq <program.Value const:3>>
straw $3
cmpw $3
brne :_int_0072
movw $1 %_cpu:acc
bra :_int_0073
:_int_0072
movw $0 %_cpu:acc
:_int_0073
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# LOOP_CTRL:<program.LoopControl 43, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_43_else
# UAssign:<program.UAssign <program.Value name:leftCtrl> = UAdd <program.Value const:128>>
movw $128 %_cpu:acc
stwaw $6
# CTRL_MARKER:<program.ControlMarker marker:43 If else>
bra :_Control_43_end
:_Control_43_else
# CTRL_MARKER:<program.ControlMarker marker:44 If start>
:_Control_44_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:direction> Eq <program.Value const:4>>
straw $3
cmpw $4
brne :_int_0074
movw $1 %_cpu:acc
bra :_int_0075
:_int_0074
movw $0 %_cpu:acc
:_int_0075
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# LOOP_CTRL:<program.LoopControl 44, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_44_else
# UAssign:<program.UAssign <program.Value name:leftCtrl> = UAdd <program.Value const:64>>
movw $64 %_cpu:acc
stwaw $6
# CTRL_MARKER:<program.ControlMarker marker:44 If else>
bra :_Control_44_end
:_Control_44_else
# CTRL_MARKER:<program.ControlMarker marker:45 If start>
:_Control_45_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:direction> Eq <program.Value const:5>>
straw $3
cmpw $5
brne :_int_0076
movw $1 %_cpu:acc
bra :_int_0077
:_int_0076
movw $0 %_cpu:acc
:_int_0077
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# LOOP_CTRL:<program.LoopControl 45, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_45_else
# UAssign:<program.UAssign <program.Value name:rightCtrl> = UAdd <program.Value const:128>>
movw $128 %_cpu:acc
stwaw $7
# CTRL_MARKER:<program.ControlMarker marker:45 If else>
bra :_Control_45_end
:_Control_45_else
# CTRL_MARKER:<program.ControlMarker marker:46 If start>
:_Control_46_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:direction> Eq <program.Value const:6>>
straw $3
cmpw $6
brne :_int_0078
movw $1 %_cpu:acc
bra :_int_0079
:_int_0078
movw $0 %_cpu:acc
:_int_0079
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# LOOP_CTRL:<program.LoopControl 46, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_46_else
# UAssign:<program.UAssign <program.Value name:rightCtrl> = UAdd <program.Value const:64>>
movw $64 %_cpu:acc
stwaw $7
# CTRL_MARKER:<program.ControlMarker marker:46 If else>
bra :_Control_46_end
:_Control_46_else
# CTRL_MARKER:<program.ControlMarker marker:47 If start>
:_Control_47_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:direction> Eq <program.Value const:7>>
straw $3
cmpw $7
brne :_int_0080
movw $1 %_cpu:acc
bra :_int_0081
:_int_0080
movw $0 %_cpu:acc
:_int_0081
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# LOOP_CTRL:<program.LoopControl 47, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_47_else
# UAssign:<program.UAssign <program.Value name:leftCtrl> = UAdd <program.Value const:128>>
movw $128 %_cpu:acc
stwaw $6
# UAssign:<program.UAssign <program.Value name:rightCtrl> = UAdd <program.Value const:64>>
movw $64 %_cpu:acc
stwaw $7
# CTRL_MARKER:<program.ControlMarker marker:47 If else>
bra :_Control_47_end
:_Control_47_else
# CTRL_MARKER:<program.ControlMarker marker:48 If start>
:_Control_48_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:direction> Eq <program.Value const:8>>
straw $3
cmpw $8
brne :_int_0082
movw $1 %_cpu:acc
bra :_int_0083
:_int_0082
movw $0 %_cpu:acc
:_int_0083
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# LOOP_CTRL:<program.LoopControl 48, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_48_else
# UAssign:<program.UAssign <program.Value name:leftCtrl> = UAdd <program.Value const:64>>
movw $64 %_cpu:acc
stwaw $6
# UAssign:<program.UAssign <program.Value name:rightCtrl> = UAdd <program.Value const:128>>
movw $128 %_cpu:acc
stwaw $7
# CTRL_MARKER:<program.ControlMarker marker:48 If end>
:_Control_48_else
:_Control_48_end
# CTRL_MARKER:<program.ControlMarker marker:47 If end>
:_Control_47_end
# CTRL_MARKER:<program.ControlMarker marker:46 If end>
:_Control_46_end
# CTRL_MARKER:<program.ControlMarker marker:45 If end>
:_Control_45_end
# CTRL_MARKER:<program.ControlMarker marker:44 If end>
:_Control_44_end
# CTRL_MARKER:<program.ControlMarker marker:43 If end>
:_Control_43_end
# CTRL_MARKER:<program.ControlMarker marker:49 If start>
:_Control_49_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:distance> NotEq <program.Value const:0>>
straw $5
cmpw $0
bre :_int_0084
movw $1 %_cpu:acc
bra :_int_0085
:_int_0084
movw $0 %_cpu:acc
:_int_0085
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# LOOP_CTRL:<program.LoopControl 49, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_49_else
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:distance> Mod <program.Value const:360>>
straw $5
modw $360
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# UAssign:<program.UAssign <program.Value name:distance> = UAdd <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
stwaw $5
# CTRL_MARKER:<program.ControlMarker marker:50 If start>
:_Control_50_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:distance> Eq <program.Value const:0>>
straw $5
cmpw $0
brne :_int_0086
movw $1 %_cpu:acc
bra :_int_0087
:_int_0086
movw $0 %_cpu:acc
:_int_0087
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# LOOP_CTRL:<program.LoopControl 50, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_50_else
# UAssign:<program.UAssign <program.Value name:distance> = UAdd <program.Value const:360>>
movw $360 %_cpu:acc
stwaw $5
# CTRL_MARKER:<program.ControlMarker marker:50 If end>
:_Control_50_else
:_Control_50_end
# CTRL_MARKER:<program.ControlMarker marker:51 If start>
:_Control_51_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:distance> Gt <program.Value const:300>>
straw $5
cmpw $300
brge :_int_0088
movw $1 %_cpu:acc
bra :_int_0089
:_int_0088
movw $0 %_cpu:acc
:_int_0089
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# LOOP_CTRL:<program.LoopControl 51, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_51_else
# BAssign:<program.BAssign <program.Value name:distance> = <program.Value name:distance> Add <program.Value const:2>>
straw $5
addw $2
stwaw $5
# CTRL_MARKER:<program.ControlMarker marker:51 If else>
bra :_Control_51_end
:_Control_51_else
# CTRL_MARKER:<program.ControlMarker marker:52 If start>
:_Control_52_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:distance> Gt <program.Value const:100>>
straw $5
cmpw $100
brge :_int_0090
movw $1 %_cpu:acc
bra :_int_0091
:_int_0090
movw $0 %_cpu:acc
:_int_0091
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# LOOP_CTRL:<program.LoopControl 52, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_52_else
# BAssign:<program.BAssign <program.Value name:distance> = <program.Value name:distance> Add <program.Value const:1>>
straw $5
addw $1
stwaw $5
# CTRL_MARKER:<program.ControlMarker marker:52 If end>
:_Control_52_else
:_Control_52_end
# CTRL_MARKER:<program.ControlMarker marker:51 If end>
:_Control_51_end
# CTRL_MARKER:<program.ControlMarker marker:53 If start>
:_Control_53_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:direction> GtE <program.Value const:7>>
straw $3
cmpw $7
brgr :_int_0092
movw $1 %_cpu:acc
bra :_int_0093
:_int_0092
movw $0 %_cpu:acc
:_int_0093
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# LOOP_CTRL:<program.LoopControl 53, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_53_else
# BAssign:<program.BAssign <program.Value name:distance> = <program.Value name:distance> Div <program.Value const:2>>
straw $5
divw $2
stwaw $5
# CTRL_MARKER:<program.ControlMarker marker:53 If end>
:_Control_53_else
:_Control_53_end
# CTRL_MARKER:<program.ControlMarker marker:54 If start>
:_Control_54_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:distance> Eq <program.Value const:0>>
straw $5
cmpw $0
brne :_int_0094
movw $1 %_cpu:acc
bra :_int_0095
:_int_0094
movw $0 %_cpu:acc
:_int_0095
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# LOOP_CTRL:<program.LoopControl 54, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_54_else
# UAssign:<program.UAssign <program.Value name:distance> = UAdd <program.Value const:1>>
movw $1 %_cpu:acc
stwaw $5
# CTRL_MARKER:<program.ControlMarker marker:54 If end>
:_Control_54_else
:_Control_54_end
# Ed.WriteModuleRegister16Bit:<program.Call name:Ed.WriteModuleRegister16Bit with args:[<program.Value const:8>, <program.Value const:2>, <program.Value name:distance>]>
straw $5
movw %_cpu:acc %82
# Ed.WriteModuleRegister16Bit:<program.Call name:Ed.WriteModuleRegister16Bit with args:[<program.Value const:3>, <program.Value const:2>, <program.Value name:distance>]>
straw $5
movw %_cpu:acc %32
# CTRL_MARKER:<program.ControlMarker marker:55 If start>
:_Control_55_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:leftCtrl> NotEq <program.Value const:192>>
straw $6
cmpw $192
bre :_int_0096
movw $1 %_cpu:acc
bra :_int_0097
:_int_0096
movw $0 %_cpu:acc
:_int_0097
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# LOOP_CTRL:<program.LoopControl 55, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_55_else
# BAssign:<program.BAssign <program.Value name:leftCtrl> = <program.Value name:leftCtrl> BitOr <program.Value const:32>>
straw $6
orw $32
stwaw $6
# CTRL_MARKER:<program.ControlMarker marker:55 If end>
:_Control_55_else
:_Control_55_end
# CTRL_MARKER:<program.ControlMarker marker:56 If start>
:_Control_56_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:rightCtrl> NotEq <program.Value const:192>>
straw $7
cmpw $192
bre :_int_0098
movw $1 %_cpu:acc
bra :_int_0099
:_int_0098
movw $0 %_cpu:acc
:_int_0099
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# LOOP_CTRL:<program.LoopControl 56, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_56_else
# BAssign:<program.BAssign <program.Value name:rightCtrl> = <program.Value name:rightCtrl> BitOr <program.Value const:32>>
straw $7
orw $32
stwaw $7
# CTRL_MARKER:<program.ControlMarker marker:56 If end>
:_Control_56_else
:_Control_56_end
# CTRL_MARKER:<program.ControlMarker marker:49 If end>
:_Control_49_else
:_Control_49_end
# CTRL_MARKER:<program.ControlMarker marker:57 If start>
:_Control_57_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:speed> Gt <program.Value const:10>>
straw $4
cmpw $10
brge :_int_0100
movw $1 %_cpu:acc
bra :_int_0101
:_int_0100
movw $0 %_cpu:acc
:_int_0101
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# LOOP_CTRL:<program.LoopControl 57, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $8
brz :_Control_57_else
# UAssign:<program.UAssign <program.Value name:speed> = UAdd <program.Value const:10>>
movw $10 %_cpu:acc
stwaw $4
# CTRL_MARKER:<program.ControlMarker marker:57 If end>
:_Control_57_else
:_Control_57_end
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
# CTRL_MARKER:<program.ControlMarker marker:42 If end>
:_Control_42_end
ret
:_end_Ed.Drive_CM

# FUNCTION:Ed.DriveSimple_CM
::_fun_Ed.DriveSimple_CM
# UAssign:<program.UAssign <program.Value name:control> = UAdd <program.Value const:0>>
movw $0 %_cpu:acc
stwaw $8
# CTRL_MARKER:<program.ControlMarker marker:90 If start>
:_Control_90_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:speed> Gt <program.Value const:10>>
straw $4
cmpw $10
brge :_int_0102
movw $1 %_cpu:acc
bra :_int_0103
:_int_0102
movw $0 %_cpu:acc
:_int_0103
# OPTIMISED OUT (STACK_WRITE): stwaw $9
# LOOP_CTRL:<program.LoopControl 90, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $9
brz :_Control_90_else
# UAssign:<program.UAssign <program.Value name:speed> = UAdd <program.Value const:10>>
movw $10 %_cpu:acc
stwaw $4
# CTRL_MARKER:<program.ControlMarker marker:90 If end>
:_Control_90_else
:_Control_90_end
# CTRL_MARKER:<program.ControlMarker marker:91 If start>
:_Control_91_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:direction> Eq <program.Value const:0>>
straw $3
cmpw $0
brne :_int_0104
movw $1 %_cpu:acc
bra :_int_0105
:_int_0104
movw $0 %_cpu:acc
:_int_0105
# OPTIMISED OUT (STACK_WRITE): stwaw $9
# LOOP_CTRL:<program.LoopControl 91, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $9
brz :_Control_91_else
# UAssign:<program.UAssign <program.Value name:control> = UAdd <program.Value const:192>>
movw $192 %_cpu:acc
stwaw $8
# UAssign:<program.UAssign <program.Value name:distance> = UAdd <program.Value const:0>>
movw $0 %_cpu:acc
stwaw $5
# CTRL_MARKER:<program.ControlMarker marker:91 If else>
bra :_Control_91_end
:_Control_91_else
# CTRL_MARKER:<program.ControlMarker marker:92 If start>
:_Control_92_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:direction> Eq <program.Value const:1>>
straw $3
cmpw $1
brne :_int_0106
movw $1 %_cpu:acc
bra :_int_0107
:_int_0106
movw $0 %_cpu:acc
:_int_0107
# OPTIMISED OUT (STACK_WRITE): stwaw $9
# LOOP_CTRL:<program.LoopControl 92, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $9
brz :_Control_92_else
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value const:128> BitOr <program.Value name:speed>>
straw $4
movw %_cpu:acc @_CALC
movw $128 %_cpu:acc
orw @_CALC
# OPTIMISED OUT (STACK_WRITE): stwaw $9
# UAssign:<program.UAssign <program.Value name:control> = UAdd <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $9
stwaw $8
# CTRL_MARKER:<program.ControlMarker marker:92 If else>
bra :_Control_92_end
:_Control_92_else
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value const:64> BitOr <program.Value name:speed>>
straw $4
movw %_cpu:acc @_CALC
movw $64 %_cpu:acc
orw @_CALC
# OPTIMISED OUT (STACK_WRITE): stwaw $9
# UAssign:<program.UAssign <program.Value name:control> = UAdd <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $9
stwaw $8
# CTRL_MARKER:<program.ControlMarker marker:92 If end>
:_Control_92_end
# CTRL_MARKER:<program.ControlMarker marker:93 If start>
:_Control_93_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:distance> Gt <program.Value const:0>>
straw $5
cmpw $0
brge :_int_0108
movw $1 %_cpu:acc
bra :_int_0109
:_int_0108
movw $0 %_cpu:acc
:_int_0109
# OPTIMISED OUT (STACK_WRITE): stwaw $9
# LOOP_CTRL:<program.LoopControl 93, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $9
brz :_Control_93_else
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
# CTRL_MARKER:<program.ControlMarker marker:93 If end>
:_Control_93_else
:_Control_93_end
# CTRL_MARKER:<program.ControlMarker marker:91 If end>
:_Control_91_end
# CTRL_MARKER:<program.ControlMarker marker:94 If start>
:_Control_94_start
# LOOP_CTRL:<program.LoopControl 94, name:If, test:<program.Value name:left>>
straw $6
brz :_Control_94_else
# Ed.WriteModuleRegister16Bit:<program.Call name:Ed.WriteModuleRegister16Bit with args:[<program.Value const:8>, <program.Value const:2>, <program.Value name:distance>]>
straw $5
movw %_cpu:acc %82
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:8>, <program.Value const:1>, <program.Value name:control>]>
straw $8
conv
movb %_cpu:acc %81
# CTRL_MARKER:<program.ControlMarker marker:94 If end>
:_Control_94_else
:_Control_94_end
# CTRL_MARKER:<program.ControlMarker marker:95 If start>
:_Control_95_start
# LOOP_CTRL:<program.LoopControl 95, name:If, test:<program.Value name:right>>
straw $7
brz :_Control_95_else
# Ed.WriteModuleRegister16Bit:<program.Call name:Ed.WriteModuleRegister16Bit with args:[<program.Value const:3>, <program.Value const:2>, <program.Value name:distance>]>
straw $5
movw %_cpu:acc %32
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:3>, <program.Value const:1>, <program.Value name:control>]>
straw $8
conv
movb %_cpu:acc %31
# CTRL_MARKER:<program.ControlMarker marker:95 If end>
:_Control_95_else
:_Control_95_end
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

# FUNCTION:Ed.ReadKeypad
::_fun_Ed.ReadKeypad
# Ed.ReadModuleRegister8Bit:<program.Call <program.Value name:button> = name:Ed.ReadModuleRegister8Bit with args:[<program.Value const:13>, <program.Value const:13>]>
movb %dd %_cpu:acc
conv
stwaw $3
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:13>, <program.Value const:13>, <program.Value const:0>]>
movb $0 %dd
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:button> BitAnd <program.Value const:15>>
straw $3
andw $15
# OPTIMISED OUT (STACK_WRITE): stwaw $4
# RETURN:<program.Return <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $4
stwaw $3
ret
# OPTIMISED OUT (DBL-RET): ret
:_end_Ed.ReadKeypad
stop
END MAIN
FINISH
