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
DATW TONE_COUNT 4 1
DATW density-object, 5, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
DATW density, 17, 1, 3077
DATW interval-object, 18, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
DATW interval, 29, 1, 2834
DATW tones-object, 30, 12, 20408, 18181, 16202, 15289, 13622, 12135, 11457, 10207, 9090, 8099, 7644, 100
DATW tones, 42, 1, 3102
DATW tone 43 1
DATW int 44 1
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
# UAssign:<program.UAssign <program.Value name:TONE_COUNT> = UAdd <program.Value const:12>>
movw $12 @TONE_COUNT
# UAssign:<program.UAssign <program.Value name:tone> = UAdd <program.Value const:0>>
movw $0 @tone
# Ed.RegisterEventHandler:<program.Call name:Ed.RegisterEventHandler with args:[<program.Value const:9>, <program.Value const:"calibrateTone">]>
# CTRL_MARKER:<program.ControlMarker marker:13 While start>
:_Control_13_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:tone> Lt <program.Value name:TONE_COUNT>>
movw @TONE_COUNT %_cpu:acc
movw %_cpu:acc @_CALC
movw @tone %_cpu:acc
cmpw @_CALC
brle :_int_0000
movw $1 %_cpu:acc
bra :_int_0001
:_int_0000
movw $0 %_cpu:acc
:_int_0001
stwaw $0
# LOOP_CTRL:<program.LoopControl 13, name:While, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $0
brz :_Control_13_else
# CTRL_MARKER:<program.ControlMarker marker:13 While end>
bra :_Control_13_start
:_Control_13_else
:_Control_13_end
# CALL:<program.Call name:endOfCalibrationSound with args:[]>
stinc $2
suba ::_fun_endOfCalibrationSound
stdec $2
# UAssign:<program.UAssign <program.Value name:int> = UAdd <program.Value const:0>>
movw $0 @int
# CTRL_MARKER:<program.ControlMarker marker:14 While start>
:_Control_14_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:TONE_COUNT> Sub <program.Value const:1>>
movw @TONE_COUNT %_cpu:acc
subw $1
stwaw $0
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:int> Lt <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $0
movw %_cpu:acc @_CALC
movw @int %_cpu:acc
cmpw @_CALC
brle :_int_0002
movw $1 %_cpu:acc
bra :_int_0003
:_int_0002
movw $0 %_cpu:acc
:_int_0003
# OPTIMISED OUT (STACK_WRITE): stwaw $1
# LOOP_CTRL:<program.LoopControl 14, name:While, test:<program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $1
brz :_Control_14_else
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:int> Add <program.Value const:1>>
movw @int %_cpu:acc
addw $1
stwaw $0
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:density[TEMP-0]> Add <program.Value name:density[int]>>
movw @int %_cpu:acc
addw @density
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
movw %_cpu:acc @_CALC
straw $0
addw @density
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
addw @_CALC
# OPTIMISED OUT (STACK_WRITE): stwaw $1
# BAssign:<program.BAssign <program.Value name:TEMP-2> = <program.Value name:TEMP-1> Div <program.Value const:2>>
# OPTIMISED OUT (STACK_READ): straw $1
divw $2
# OPTIMISED OUT (STACK_WRITE): stwaw $2
# UAssign:<program.UAssign <program.Value name:interval[int]> = UAdd <program.Value name:TEMP-2>>
# OPTIMISED OUT (STACK_READ): straw $2
movw %_cpu:acc %_index:16b1window
movw @int %_cpu:acc
addw @interval
convl
movb %_cpu:acc %_index:16b1cursor
bitset $1 %_index:action
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:int> Add <program.Value const:1>>
movw @int %_cpu:acc
addw $1
stwaw $0
# UAssign:<program.UAssign <program.Value name:int> = UAdd <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $0
movw %_cpu:acc @int
# CTRL_MARKER:<program.ControlMarker marker:14 While end>
bra :_Control_14_start
:_Control_14_else
:_Control_14_end
# Ed.RegisterEventHandler:<program.Call name:Ed.RegisterEventHandler with args:[<program.Value const:10>, <program.Value const:"scanAndPlayNewTone">]>
# CTRL_MARKER:<program.ControlMarker marker:15 While start>
:_Control_15_start
# LOOP_CTRL:<program.LoopControl 15, name:While, test:<program.Value const:1>>
movw $1 %_cpu:acc
brz :_Control_15_else
# CTRL_MARKER:<program.ControlMarker marker:15 While end>
bra :_Control_15_start
:_Control_15_else
:_Control_15_end
stop
:_end___main__

# FUNCTION:scanAndPlayNewTone
::_fun_scanAndPlayNewTone
# CALL:<program.Call name:Ed.PlayTone with args:[<program.Value const:100>, <program.Value const:1>]>
stinc $2
movw $100 %_cpu:acc
stwaw $0
movw $1 %_cpu:acc
stwaw $1
suba ::_fun_Ed.PlayTone
stdec $2
# CALL:<program.Call <program.Value name:tr> = name:Ed.ReadLineTracker with args:[]>
stinc $1
suba ::_fun_Ed.ReadLineTracker
straw $0
stwaw $4
stdec $1
# CTRL_MARKER:<program.ControlMarker marker:0 If start>
:_Control_0_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:tr> Gt <program.Value name:interval[3]>>
movw @interval %_cpu:acc
addw $3
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
movw %_cpu:acc @_CALC
straw $3
cmpw @_CALC
brge :_int_0004
movw $1 %_cpu:acc
bra :_int_0005
:_int_0004
movw $0 %_cpu:acc
:_int_0005
# OPTIMISED OUT (STACK_WRITE): stwaw $5
# LOOP_CTRL:<program.LoopControl 0, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $5
brz :_Control_0_else
# CTRL_MARKER:<program.ControlMarker marker:1 If start>
:_Control_1_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:tr> Gt <program.Value name:interval[7]>>
movw @interval %_cpu:acc
addw $7
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
movw %_cpu:acc @_CALC
straw $3
cmpw @_CALC
brge :_int_0006
movw $1 %_cpu:acc
bra :_int_0007
:_int_0006
movw $0 %_cpu:acc
:_int_0007
# OPTIMISED OUT (STACK_WRITE): stwaw $5
# LOOP_CTRL:<program.LoopControl 1, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $5
brz :_Control_1_else
# CTRL_MARKER:<program.ControlMarker marker:2 If start>
:_Control_2_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:tr> Gt <program.Value name:interval[9]>>
movw @interval %_cpu:acc
addw $9
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
movw %_cpu:acc @_CALC
straw $3
cmpw @_CALC
brge :_int_0008
movw $1 %_cpu:acc
bra :_int_0009
:_int_0008
movw $0 %_cpu:acc
:_int_0009
# OPTIMISED OUT (STACK_WRITE): stwaw $5
# LOOP_CTRL:<program.LoopControl 2, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $5
brz :_Control_2_else
# CTRL_MARKER:<program.ControlMarker marker:3 If start>
:_Control_3_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:tr> Gt <program.Value name:interval[10]>>
movw @interval %_cpu:acc
addw $10
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
movw %_cpu:acc @_CALC
straw $3
cmpw @_CALC
brge :_int_0010
movw $1 %_cpu:acc
bra :_int_0011
:_int_0010
movw $0 %_cpu:acc
:_int_0011
# OPTIMISED OUT (STACK_WRITE): stwaw $5
# LOOP_CTRL:<program.LoopControl 3, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $5
brz :_Control_3_else
# UAssign:<program.UAssign <program.Value name:new_tone> = UAdd <program.Value const:11>>
movw $11 %_cpu:acc
stwaw $4
# CTRL_MARKER:<program.ControlMarker marker:3 If else>
bra :_Control_3_end
:_Control_3_else
# UAssign:<program.UAssign <program.Value name:new_tone> = UAdd <program.Value const:10>>
movw $10 %_cpu:acc
stwaw $4
# CTRL_MARKER:<program.ControlMarker marker:3 If end>
:_Control_3_end
# CTRL_MARKER:<program.ControlMarker marker:2 If else>
bra :_Control_2_end
:_Control_2_else
# CTRL_MARKER:<program.ControlMarker marker:4 If start>
:_Control_4_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:tr> Gt <program.Value name:interval[8]>>
movw @interval %_cpu:acc
addw $8
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
movw %_cpu:acc @_CALC
straw $3
cmpw @_CALC
brge :_int_0012
movw $1 %_cpu:acc
bra :_int_0013
:_int_0012
movw $0 %_cpu:acc
:_int_0013
# OPTIMISED OUT (STACK_WRITE): stwaw $5
# LOOP_CTRL:<program.LoopControl 4, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $5
brz :_Control_4_else
# UAssign:<program.UAssign <program.Value name:new_tone> = UAdd <program.Value const:9>>
movw $9 %_cpu:acc
stwaw $4
# CTRL_MARKER:<program.ControlMarker marker:4 If else>
bra :_Control_4_end
:_Control_4_else
# UAssign:<program.UAssign <program.Value name:new_tone> = UAdd <program.Value const:8>>
movw $8 %_cpu:acc
stwaw $4
# CTRL_MARKER:<program.ControlMarker marker:4 If end>
:_Control_4_end
# CTRL_MARKER:<program.ControlMarker marker:2 If end>
:_Control_2_end
# CTRL_MARKER:<program.ControlMarker marker:1 If else>
bra :_Control_1_end
:_Control_1_else
# CTRL_MARKER:<program.ControlMarker marker:5 If start>
:_Control_5_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:tr> Gt <program.Value name:interval[5]>>
movw @interval %_cpu:acc
addw $5
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
movw %_cpu:acc @_CALC
straw $3
cmpw @_CALC
brge :_int_0014
movw $1 %_cpu:acc
bra :_int_0015
:_int_0014
movw $0 %_cpu:acc
:_int_0015
# OPTIMISED OUT (STACK_WRITE): stwaw $5
# LOOP_CTRL:<program.LoopControl 5, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $5
brz :_Control_5_else
# CTRL_MARKER:<program.ControlMarker marker:6 If start>
:_Control_6_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:tr> Gt <program.Value name:interval[6]>>
movw @interval %_cpu:acc
addw $6
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
movw %_cpu:acc @_CALC
straw $3
cmpw @_CALC
brge :_int_0016
movw $1 %_cpu:acc
bra :_int_0017
:_int_0016
movw $0 %_cpu:acc
:_int_0017
# OPTIMISED OUT (STACK_WRITE): stwaw $5
# LOOP_CTRL:<program.LoopControl 6, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $5
brz :_Control_6_else
# UAssign:<program.UAssign <program.Value name:new_tone> = UAdd <program.Value const:7>>
movw $7 %_cpu:acc
stwaw $4
# CTRL_MARKER:<program.ControlMarker marker:6 If else>
bra :_Control_6_end
:_Control_6_else
# UAssign:<program.UAssign <program.Value name:new_tone> = UAdd <program.Value const:6>>
movw $6 %_cpu:acc
stwaw $4
# CTRL_MARKER:<program.ControlMarker marker:6 If end>
:_Control_6_end
# CTRL_MARKER:<program.ControlMarker marker:5 If else>
bra :_Control_5_end
:_Control_5_else
# CTRL_MARKER:<program.ControlMarker marker:7 If start>
:_Control_7_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:tr> Gt <program.Value name:interval[4]>>
movw @interval %_cpu:acc
addw $4
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
movw %_cpu:acc @_CALC
straw $3
cmpw @_CALC
brge :_int_0018
movw $1 %_cpu:acc
bra :_int_0019
:_int_0018
movw $0 %_cpu:acc
:_int_0019
# OPTIMISED OUT (STACK_WRITE): stwaw $5
# LOOP_CTRL:<program.LoopControl 7, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $5
brz :_Control_7_else
# UAssign:<program.UAssign <program.Value name:new_tone> = UAdd <program.Value const:5>>
movw $5 %_cpu:acc
stwaw $4
# CTRL_MARKER:<program.ControlMarker marker:7 If else>
bra :_Control_7_end
:_Control_7_else
# UAssign:<program.UAssign <program.Value name:new_tone> = UAdd <program.Value const:4>>
movw $4 %_cpu:acc
stwaw $4
# CTRL_MARKER:<program.ControlMarker marker:7 If end>
:_Control_7_end
# CTRL_MARKER:<program.ControlMarker marker:5 If end>
:_Control_5_end
# CTRL_MARKER:<program.ControlMarker marker:1 If end>
:_Control_1_end
# CTRL_MARKER:<program.ControlMarker marker:0 If else>
bra :_Control_0_end
:_Control_0_else
# CTRL_MARKER:<program.ControlMarker marker:8 If start>
:_Control_8_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:tr> Gt <program.Value name:interval[1]>>
movw @interval %_cpu:acc
addw $1
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
movw %_cpu:acc @_CALC
straw $3
cmpw @_CALC
brge :_int_0020
movw $1 %_cpu:acc
bra :_int_0021
:_int_0020
movw $0 %_cpu:acc
:_int_0021
# OPTIMISED OUT (STACK_WRITE): stwaw $5
# LOOP_CTRL:<program.LoopControl 8, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $5
brz :_Control_8_else
# CTRL_MARKER:<program.ControlMarker marker:9 If start>
:_Control_9_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:tr> Gt <program.Value name:interval[2]>>
movw @interval %_cpu:acc
addw $2
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
movw %_cpu:acc @_CALC
straw $3
cmpw @_CALC
brge :_int_0022
movw $1 %_cpu:acc
bra :_int_0023
:_int_0022
movw $0 %_cpu:acc
:_int_0023
# OPTIMISED OUT (STACK_WRITE): stwaw $5
# LOOP_CTRL:<program.LoopControl 9, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $5
brz :_Control_9_else
# UAssign:<program.UAssign <program.Value name:new_tone> = UAdd <program.Value const:3>>
movw $3 %_cpu:acc
stwaw $4
# CTRL_MARKER:<program.ControlMarker marker:9 If else>
bra :_Control_9_end
:_Control_9_else
# UAssign:<program.UAssign <program.Value name:new_tone> = UAdd <program.Value const:2>>
movw $2 %_cpu:acc
stwaw $4
# CTRL_MARKER:<program.ControlMarker marker:9 If end>
:_Control_9_end
# CTRL_MARKER:<program.ControlMarker marker:8 If else>
bra :_Control_8_end
:_Control_8_else
# CTRL_MARKER:<program.ControlMarker marker:10 If start>
:_Control_10_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:tr> Gt <program.Value name:interval[0]>>
movw @interval %_cpu:acc
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
movw %_cpu:acc @_CALC
straw $3
cmpw @_CALC
brge :_int_0024
movw $1 %_cpu:acc
bra :_int_0025
:_int_0024
movw $0 %_cpu:acc
:_int_0025
# OPTIMISED OUT (STACK_WRITE): stwaw $5
# LOOP_CTRL:<program.LoopControl 10, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $5
brz :_Control_10_else
# UAssign:<program.UAssign <program.Value name:new_tone> = UAdd <program.Value const:1>>
movw $1 %_cpu:acc
stwaw $4
# CTRL_MARKER:<program.ControlMarker marker:10 If else>
bra :_Control_10_end
:_Control_10_else
# UAssign:<program.UAssign <program.Value name:new_tone> = UAdd <program.Value const:0>>
movw $0 %_cpu:acc
stwaw $4
# CTRL_MARKER:<program.ControlMarker marker:10 If end>
:_Control_10_end
# CTRL_MARKER:<program.ControlMarker marker:8 If end>
:_Control_8_end
# CTRL_MARKER:<program.ControlMarker marker:0 If end>
:_Control_0_end
# CALL:<program.Call name:Ed.TimeWait with args:[<program.Value const:50>, <program.Value const:1>]>
stinc $3
movw $50 %_cpu:acc
stwaw $0
movw $1 %_cpu:acc
stwaw $1
suba ::_fun_Ed.TimeWait
stdec $3
# CALL:<program.Call name:Ed.PlayTone with args:[<program.Value name:tones[new_tone]>, <program.Value const:30000>]>
stinc $2
straw $6
addw @tones
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
stwaw $0
movw $30000 %_cpu:acc
stwaw $1
suba ::_fun_Ed.PlayTone
stdec $2
ret
:_end_scanAndPlayNewTone

# FUNCTION:endOfCalibrationSound
::_fun_endOfCalibrationSound
# UAssign:<program.UAssign <program.Value name:count> = UAdd <program.Value const:0>>
movw $0 %_cpu:acc
stwaw $3
# CTRL_MARKER:<program.ControlMarker marker:11 While start>
:_Control_11_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:count> Lt <program.Value const:6>>
straw $3
cmpw $6
brle :_int_0026
movw $1 %_cpu:acc
bra :_int_0027
:_int_0026
movw $0 %_cpu:acc
:_int_0027
# OPTIMISED OUT (STACK_WRITE): stwaw $4
# LOOP_CTRL:<program.LoopControl 11, name:While, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $4
brz :_Control_11_else
# CALL:<program.Call name:Ed.PlayTone with args:[<program.Value const:5000>, <program.Value const:80>]>
stinc $2
movw $5000 %_cpu:acc
stwaw $0
movw $80 %_cpu:acc
stwaw $1
suba ::_fun_Ed.PlayTone
stdec $2
# CALL:<program.Call name:Ed.PlayTone with args:[<program.Value const:100>, <program.Value const:50>]>
stinc $2
movw $100 %_cpu:acc
stwaw $0
movw $50 %_cpu:acc
stwaw $1
suba ::_fun_Ed.PlayTone
stdec $2
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:count> Add <program.Value const:1>>
straw $3
addw $1
# OPTIMISED OUT (STACK_WRITE): stwaw $4
# UAssign:<program.UAssign <program.Value name:count> = UAdd <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $4
stwaw $3
# CTRL_MARKER:<program.ControlMarker marker:11 While end>
bra :_Control_11_start
:_Control_11_else
:_Control_11_end
ret
:_end_endOfCalibrationSound

# FUNCTION:calibrateTone
::_fun_calibrateTone
# CTRL_MARKER:<program.ControlMarker marker:12 If start>
:_Control_12_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:tone> GtE <program.Value name:TONE_COUNT>>
movw @TONE_COUNT %_cpu:acc
movw %_cpu:acc @_CALC
movw @tone %_cpu:acc
cmpw @_CALC
brgr :_int_0028
movw $1 %_cpu:acc
bra :_int_0029
:_int_0028
movw $0 %_cpu:acc
:_int_0029
# OPTIMISED OUT (STACK_WRITE): stwaw $4
# LOOP_CTRL:<program.LoopControl 12, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $4
brz :_Control_12_else
# RETURN:<program.Return None>
ret
# CTRL_MARKER:<program.ControlMarker marker:12 If end>
:_Control_12_else
:_Control_12_end
# CALL:<program.Call <program.Value name:tracker> = name:Ed.ReadLineTracker with args:[]>
stinc $1
suba ::_fun_Ed.ReadLineTracker
straw $0
stwaw $4
stdec $1
# UAssign:<program.UAssign <program.Value name:density[tone]> = UAdd <program.Value name:tracker>>
straw $3
movw %_cpu:acc %_index:16b1window
movw @tone %_cpu:acc
addw @density
convl
movb %_cpu:acc %_index:16b1cursor
bitset $1 %_index:action
# CALL:<program.Call name:Ed.PlayTone with args:[<program.Value name:tones[tone]>, <program.Value const:300>]>
stinc $2
movw @tone %_cpu:acc
addw @tones
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
stwaw $0
movw $300 %_cpu:acc
stwaw $1
suba ::_fun_Ed.PlayTone
stdec $2
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:tone> Add <program.Value const:1>>
movw @tone %_cpu:acc
addw $1
# OPTIMISED OUT (STACK_WRITE): stwaw $4
# UAssign:<program.UAssign <program.Value name:tone> = UAdd <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $4
movw %_cpu:acc @tone
ret
:_end_calibrateTone

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

# FUNCTION:Ed.TimeWait
::_fun_Ed.TimeWait
# BAssign:<program.BAssign <program.Value name:units> = <program.Value name:units> BitAnd <program.Value const:1>>
straw $4
andw $1
stwaw $4
# CTRL_MARKER:<program.ControlMarker marker:18 If start>
:_Control_18_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:units> Eq <program.Value const:0>>
straw $4
cmpw $0
brne :_int_0030
movw $1 %_cpu:acc
bra :_int_0031
:_int_0030
movw $0 %_cpu:acc
:_int_0031
# OPTIMISED OUT (STACK_WRITE): stwaw $5
# LOOP_CTRL:<program.LoopControl 18, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $5
brz :_Control_18_else
# BAssign:<program.BAssign <program.Value name:time> = <program.Value name:time> Mult <program.Value const:100>>
straw $3
mulw $100
stwaw $3
# CTRL_MARKER:<program.ControlMarker marker:18 If else>
bra :_Control_18_end
:_Control_18_else
# BAssign:<program.BAssign <program.Value name:time> = <program.Value name:time> Div <program.Value const:10>>
straw $3
divw $10
stwaw $3
# CTRL_MARKER:<program.ControlMarker marker:18 If end>
:_Control_18_end
# Ed.WriteModuleRegister16Bit:<program.Call name:Ed.WriteModuleRegister16Bit with args:[<program.Value const:14>, <program.Value const:2>, <program.Value name:time>]>
straw $3
movw %_cpu:acc %e2
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:14>, <program.Value const:1>, <program.Value const:2>]>
movb $2 %e1
ret
:_end_Ed.TimeWait

# FUNCTION:Ed.PlayTone
::_fun_Ed.PlayTone
# BAssign:<program.BAssign <program.Value name:durationMs> = <program.Value name:durationMs> Div <program.Value const:10>>
straw $4
divw $10
stwaw $4
# Ed.WriteModuleRegister16Bit:<program.Call name:Ed.WriteModuleRegister16Bit with args:[<program.Value const:6>, <program.Value const:2>, <program.Value name:freqCode>]>
straw $3
movw %_cpu:acc %62
# Ed.WriteModuleRegister16Bit:<program.Call name:Ed.WriteModuleRegister16Bit with args:[<program.Value const:6>, <program.Value const:4>, <program.Value name:durationMs>]>
straw $4
movw %_cpu:acc %64
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:6>, <program.Value const:1>, <program.Value const:2>]>
movb $2 %61
ret
:_end_Ed.PlayTone

# FUNCTION:Ed.ReadLineTracker
::_fun_Ed.ReadLineTracker
# Ed.ReadModuleRegister16Bit:<program.Call <program.Value name:TEMP-0> = name:Ed.ReadModuleRegister16Bit with args:[<program.Value const:0>, <program.Value const:2>]>
movw %02 %_cpu:acc
stwaw $3
# RETURN:<program.Return <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $3
stwaw $3
ret
# OPTIMISED OUT (DBL-RET): ret
:_end_Ed.ReadLineTracker
stop
END MAIN
BEGIN EVENT %_devices:status, 1, 1
bitclr $0 %_devices:status
pushw @_CALC
stinc $2
suba ::_fun_calibrateTone
stdec $2
popw @_CALC
stop
END EVENT
BEGIN EVENT %_devices:status, 4, 4
bitclr $2 %_devices:status
pushw @_CALC
stinc $3
suba ::_fun_scanAndPlayNewTone
stdec $3
popw @_CALC
stop
END EVENT
FINISH
