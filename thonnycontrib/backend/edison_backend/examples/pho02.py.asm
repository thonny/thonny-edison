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
DATW DENSITY_COUNT 4 1
DATW density-object, 5, 6, 0, 0, 0, 0, 0, 0
DATW density, 11, 1, 1541
DATW interval-object, 12, 4, 0, 0, 0, 0
DATW interval, 16, 1, 1036
DATW tones-object, 17, 9, 15289, 13622, 12135, 11457, 10207, 9090, 8099, 7644, 100
DATW tones, 26, 1, 2321
DATW MESSAGE_EMPTY 27 1
DATW MESSAGE_CALIBRATE 28 1
DATW MESSAGE_LOW 29 1
DATW MESSAGE_HIGH 30 1
DATW MESSAGE_PAUSE 31 1
DATW processingLock 32 1
DATW densityIndex 33 1
stinc $1

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
# UAssign:<program.UAssign <program.Value name:DENSITY_COUNT> = UAdd <program.Value const:6>>
movw $6 @DENSITY_COUNT
# UAssign:<program.UAssign <program.Value name:MESSAGE_EMPTY> = UAdd <program.Value const:0>>
movw $0 @MESSAGE_EMPTY
# UAssign:<program.UAssign <program.Value name:MESSAGE_CALIBRATE> = UAdd <program.Value const:1>>
movw $1 @MESSAGE_CALIBRATE
# UAssign:<program.UAssign <program.Value name:MESSAGE_LOW> = UAdd <program.Value const:2>>
movw $2 @MESSAGE_LOW
# UAssign:<program.UAssign <program.Value name:MESSAGE_HIGH> = UAdd <program.Value const:3>>
movw $3 @MESSAGE_HIGH
# UAssign:<program.UAssign <program.Value name:MESSAGE_PAUSE> = UAdd <program.Value const:4>>
movw $4 @MESSAGE_PAUSE
# Ed.RegisterEventHandler:<program.Call name:Ed.RegisterEventHandler with args:[<program.Value const:2>, <program.Value const:"readMessage">]>
# UAssign:<program.UAssign <program.Value name:processingLock> = UAdd <program.Value const:0>>
movw $0 @processingLock
# UAssign:<program.UAssign <program.Value name:densityIndex> = UAdd <program.Value const:0>>
movw $0 @densityIndex
# CTRL_MARKER:<program.ControlMarker marker:21 While start>
:_Control_21_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:densityIndex> Lt <program.Value name:DENSITY_COUNT>>
movw @DENSITY_COUNT %_cpu:acc
movw %_cpu:acc @_CALC
movw @densityIndex %_cpu:acc
cmpw @_CALC
brle :_int_0000
movw $1 %_cpu:acc
bra :_int_0001
:_int_0000
movw $0 %_cpu:acc
:_int_0001
# OPTIMISED OUT (STACK_WRITE): stwaw $0
# LOOP_CTRL:<program.LoopControl 21, name:While, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $0
brz :_Control_21_else
# CTRL_MARKER:<program.ControlMarker marker:21 While end>
bra :_Control_21_start
:_Control_21_else
:_Control_21_end
# CALL:<program.Call name:endOfCalibrationSound with args:[]>
stinc $2
suba ::_fun_endOfCalibrationSound
stdec $2
# CALL:<program.Call name:convertDensitiesToInterval with args:[]>
stinc $8
suba ::_fun_convertDensitiesToInterval
stdec $8
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:1>]>
movb $1 %b1
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:1>, <program.Value const:1>, <program.Value const:1>]>
movb $1 %11
# CTRL_MARKER:<program.ControlMarker marker:22 While start>
:_Control_22_start
# LOOP_CTRL:<program.LoopControl 22, name:While, test:<program.Value const:1>>
movw $1 %_cpu:acc
brz :_Control_22_else
# CTRL_MARKER:<program.ControlMarker marker:22 While end>
bra :_Control_22_start
:_Control_22_else
:_Control_22_end
stop
:_end___main__

# FUNCTION:endOfCalibrationSound
::_fun_endOfCalibrationSound
# UAssign:<program.UAssign <program.Value name:count> = UAdd <program.Value const:0>>
movw $0 %_cpu:acc
stwaw $3
# CTRL_MARKER:<program.ControlMarker marker:0 While start>
:_Control_0_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:count> Lt <program.Value const:10>>
straw $3
cmpw $10
brle :_int_0002
movw $1 %_cpu:acc
bra :_int_0003
:_int_0002
movw $0 %_cpu:acc
:_int_0003
# OPTIMISED OUT (STACK_WRITE): stwaw $4
# LOOP_CTRL:<program.LoopControl 0, name:While, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $4
brz :_Control_0_else
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
# CTRL_MARKER:<program.ControlMarker marker:0 While end>
bra :_Control_0_start
:_Control_0_else
:_Control_0_end
ret
:_end_endOfCalibrationSound

# FUNCTION:calibrateDensities
::_fun_calibrateDensities
# CTRL_MARKER:<program.ControlMarker marker:1 If start>
:_Control_1_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:densityIndex> GtE <program.Value name:DENSITY_COUNT>>
movw @DENSITY_COUNT %_cpu:acc
movw %_cpu:acc @_CALC
movw @densityIndex %_cpu:acc
cmpw @_CALC
brgr :_int_0004
movw $1 %_cpu:acc
bra :_int_0005
:_int_0004
movw $0 %_cpu:acc
:_int_0005
# OPTIMISED OUT (STACK_WRITE): stwaw $4
# LOOP_CTRL:<program.LoopControl 1, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $4
brz :_Control_1_else
# RETURN:<program.Return None>
ret
# CTRL_MARKER:<program.ControlMarker marker:1 If end>
:_Control_1_else
:_Control_1_end
# CALL:<program.Call <program.Value name:tracker> = name:Ed.ReadLineTracker with args:[]>
stinc $1
suba ::_fun_Ed.ReadLineTracker
straw $0
stwaw $4
stdec $1
# UAssign:<program.UAssign <program.Value name:density[densityIndex]> = UAdd <program.Value name:tracker>>
straw $3
movw %_cpu:acc %_index:16b1window
movw @densityIndex %_cpu:acc
addw @density
convl
movb %_cpu:acc %_index:16b1cursor
bitset $1 %_index:action
# CALL:<program.Call name:Ed.PlayTone with args:[<program.Value name:tones[0]>, <program.Value const:200>]>
stinc $2
movw @tones %_cpu:acc
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
stwaw $0
movw $200 %_cpu:acc
stwaw $1
suba ::_fun_Ed.PlayTone
stdec $2
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:densityIndex> Add <program.Value const:1>>
movw @densityIndex %_cpu:acc
addw $1
# OPTIMISED OUT (STACK_WRITE): stwaw $4
# UAssign:<program.UAssign <program.Value name:densityIndex> = UAdd <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $4
movw %_cpu:acc @densityIndex
ret
:_end_calibrateDensities

# FUNCTION:convertDensitiesToInterval
::_fun_convertDensitiesToInterval
# UAssign:<program.UAssign <program.Value name:lowerDensity> = UAdd <program.Value const:32000>>
movw $32000 %_cpu:acc
stwaw $3
# UAssign:<program.UAssign <program.Value name:index> = UAdd <program.Value const:0>>
movw $0 %_cpu:acc
stwaw $4
# UAssign:<program.UAssign <program.Value name:startIndex> = UAdd <program.Value const:0>>
movw $0 %_cpu:acc
stwaw $5
# CTRL_MARKER:<program.ControlMarker marker:2 While start>
:_Control_2_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:index> Lt <program.Value name:DENSITY_COUNT>>
movw @DENSITY_COUNT %_cpu:acc
movw %_cpu:acc @_CALC
straw $4
cmpw @_CALC
brle :_int_0006
movw $1 %_cpu:acc
bra :_int_0007
:_int_0006
movw $0 %_cpu:acc
:_int_0007
# OPTIMISED OUT (STACK_WRITE): stwaw $9
# LOOP_CTRL:<program.LoopControl 2, name:While, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $9
brz :_Control_2_else
# CTRL_MARKER:<program.ControlMarker marker:3 If start>
:_Control_3_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:density[index]> Lt <program.Value name:lowerDensity>>
straw $3
movw %_cpu:acc @_CALC
straw $4
addw @density
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
cmpw @_CALC
brle :_int_0008
movw $1 %_cpu:acc
bra :_int_0009
:_int_0008
movw $0 %_cpu:acc
:_int_0009
# OPTIMISED OUT (STACK_WRITE): stwaw $9
# LOOP_CTRL:<program.LoopControl 3, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $9
brz :_Control_3_else
# UAssign:<program.UAssign <program.Value name:lowerDensity> = UAdd <program.Value name:density[index]>>
straw $4
addw @density
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
stwaw $3
# UAssign:<program.UAssign <program.Value name:startIndex> = UAdd <program.Value name:index>>
straw $4
stwaw $5
# CTRL_MARKER:<program.ControlMarker marker:3 If end>
:_Control_3_else
:_Control_3_end
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:index> Add <program.Value const:1>>
straw $4
addw $1
# OPTIMISED OUT (STACK_WRITE): stwaw $9
# UAssign:<program.UAssign <program.Value name:index> = UAdd <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $9
stwaw $4
# CTRL_MARKER:<program.ControlMarker marker:2 While end>
bra :_Control_2_start
:_Control_2_else
:_Control_2_end
# UAssign:<program.UAssign <program.Value name:int> = UAdd <program.Value const:0>>
movw $0 %_cpu:acc
stwaw $6
# CTRL_MARKER:<program.ControlMarker marker:4 While start>
:_Control_4_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:DENSITY_COUNT> Sub <program.Value const:2>>
movw @DENSITY_COUNT %_cpu:acc
subw $2
# OPTIMISED OUT (STACK_WRITE): stwaw $9
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:int> Lt <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $9
movw %_cpu:acc @_CALC
straw $6
cmpw @_CALC
brle :_int_0010
movw $1 %_cpu:acc
bra :_int_0011
:_int_0010
movw $0 %_cpu:acc
:_int_0011
# OPTIMISED OUT (STACK_WRITE): stwaw $10
# LOOP_CTRL:<program.LoopControl 4, name:While, test:<program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $10
brz :_Control_4_else
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:int> Add <program.Value name:startIndex>>
straw $5
movw %_cpu:acc @_CALC
straw $6
addw @_CALC
# OPTIMISED OUT (STACK_WRITE): stwaw $9
# UAssign:<program.UAssign <program.Value name:firstIndex> = UAdd <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $9
stwaw $7
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:int> Add <program.Value name:startIndex>>
straw $5
movw %_cpu:acc @_CALC
straw $6
addw @_CALC
# OPTIMISED OUT (STACK_WRITE): stwaw $9
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:TEMP-0> Add <program.Value const:1>>
# OPTIMISED OUT (STACK_READ): straw $9
addw $1
# OPTIMISED OUT (STACK_WRITE): stwaw $10
# UAssign:<program.UAssign <program.Value name:secondIndex> = UAdd <program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $10
stwaw $8
# CTRL_MARKER:<program.ControlMarker marker:5 If start>
:_Control_5_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:DENSITY_COUNT> Sub <program.Value const:1>>
movw @DENSITY_COUNT %_cpu:acc
subw $1
# OPTIMISED OUT (STACK_WRITE): stwaw $9
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:firstIndex> Gt <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $9
movw %_cpu:acc @_CALC
straw $7
cmpw @_CALC
brge :_int_0012
movw $1 %_cpu:acc
bra :_int_0013
:_int_0012
movw $0 %_cpu:acc
:_int_0013
# OPTIMISED OUT (STACK_WRITE): stwaw $10
# LOOP_CTRL:<program.LoopControl 5, name:If, test:<program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $10
brz :_Control_5_else
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:firstIndex> Sub <program.Value name:DENSITY_COUNT>>
movw @DENSITY_COUNT %_cpu:acc
movw %_cpu:acc @_CALC
straw $7
subw @_CALC
# OPTIMISED OUT (STACK_WRITE): stwaw $9
# UAssign:<program.UAssign <program.Value name:firstIndex> = UAdd <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $9
stwaw $7
# CTRL_MARKER:<program.ControlMarker marker:5 If end>
:_Control_5_else
:_Control_5_end
# CTRL_MARKER:<program.ControlMarker marker:6 If start>
:_Control_6_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:DENSITY_COUNT> Sub <program.Value const:1>>
movw @DENSITY_COUNT %_cpu:acc
subw $1
# OPTIMISED OUT (STACK_WRITE): stwaw $9
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:secondIndex> Gt <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $9
movw %_cpu:acc @_CALC
straw $8
cmpw @_CALC
brge :_int_0014
movw $1 %_cpu:acc
bra :_int_0015
:_int_0014
movw $0 %_cpu:acc
:_int_0015
# OPTIMISED OUT (STACK_WRITE): stwaw $10
# LOOP_CTRL:<program.LoopControl 6, name:If, test:<program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $10
brz :_Control_6_else
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:secondIndex> Sub <program.Value name:DENSITY_COUNT>>
movw @DENSITY_COUNT %_cpu:acc
movw %_cpu:acc @_CALC
straw $8
subw @_CALC
# OPTIMISED OUT (STACK_WRITE): stwaw $9
# UAssign:<program.UAssign <program.Value name:secondIndex> = UAdd <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $9
stwaw $8
# CTRL_MARKER:<program.ControlMarker marker:6 If end>
:_Control_6_else
:_Control_6_end
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:density[firstIndex]> Add <program.Value name:density[secondIndex]>>
straw $8
addw @density
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
movw %_cpu:acc @_CALC
straw $7
addw @density
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
addw @_CALC
# OPTIMISED OUT (STACK_WRITE): stwaw $9
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:TEMP-0> Div <program.Value const:2>>
# OPTIMISED OUT (STACK_READ): straw $9
divw $2
# OPTIMISED OUT (STACK_WRITE): stwaw $10
# UAssign:<program.UAssign <program.Value name:interval[int]> = UAdd <program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $10
movw %_cpu:acc %_index:16b1window
straw $6
addw @interval
convl
movb %_cpu:acc %_index:16b1cursor
bitset $1 %_index:action
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:int> Add <program.Value const:1>>
straw $6
addw $1
# OPTIMISED OUT (STACK_WRITE): stwaw $9
# UAssign:<program.UAssign <program.Value name:int> = UAdd <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $9
stwaw $6
# CTRL_MARKER:<program.ControlMarker marker:4 While end>
bra :_Control_4_start
:_Control_4_else
:_Control_4_end
ret
:_end_convertDensitiesToInterval

# FUNCTION:readMessage
::_fun_readMessage
# CALL:<program.Call <program.Value name:message> = name:Ed.ReadIRData with args:[]>
stinc $1
suba ::_fun_Ed.ReadIRData
straw $0
stwaw $4
stdec $1
# CTRL_MARKER:<program.ControlMarker marker:7 If start>
:_Control_7_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:processingLock> Eq <program.Value const:0>>
movw @processingLock %_cpu:acc
cmpw $0
brne :_int_0016
movw $1 %_cpu:acc
bra :_int_0017
:_int_0016
movw $0 %_cpu:acc
:_int_0017
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# LOOP_CTRL:<program.LoopControl 7, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $6
brz :_Control_7_else
# UAssign:<program.UAssign <program.Value name:processingLock> = UAdd <program.Value const:1>>
movw $1 @processingLock
# CTRL_MARKER:<program.ControlMarker marker:8 If start>
:_Control_8_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:message> Eq <program.Value name:MESSAGE_EMPTY>>
movw @MESSAGE_EMPTY %_cpu:acc
movw %_cpu:acc @_CALC
straw $3
cmpw @_CALC
brne :_int_0018
movw $1 %_cpu:acc
bra :_int_0019
:_int_0018
movw $0 %_cpu:acc
:_int_0019
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# LOOP_CTRL:<program.LoopControl 8, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $6
brz :_Control_8_else
# CTRL_MARKER:<program.ControlMarker marker:8 If else>
bra :_Control_8_end
:_Control_8_else
# CTRL_MARKER:<program.ControlMarker marker:9 If start>
:_Control_9_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:message> Eq <program.Value name:MESSAGE_PAUSE>>
movw @MESSAGE_PAUSE %_cpu:acc
movw %_cpu:acc @_CALC
straw $3
cmpw @_CALC
brne :_int_0020
movw $1 %_cpu:acc
bra :_int_0021
:_int_0020
movw $0 %_cpu:acc
:_int_0021
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# LOOP_CTRL:<program.LoopControl 9, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $6
brz :_Control_9_else
# CALL:<program.Call name:Ed.PlayTone with args:[<program.Value const:100>, <program.Value const:1>]>
stinc $2
movw $100 %_cpu:acc
stwaw $0
movw $1 %_cpu:acc
stwaw $1
suba ::_fun_Ed.PlayTone
stdec $2
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:1>]>
movb $1 %b1
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:1>, <program.Value const:1>, <program.Value const:1>]>
movb $1 %11
# CTRL_MARKER:<program.ControlMarker marker:9 If else>
bra :_Control_9_end
:_Control_9_else
# CTRL_MARKER:<program.ControlMarker marker:10 If start>
:_Control_10_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:message> Eq <program.Value name:MESSAGE_CALIBRATE>>
movw @MESSAGE_CALIBRATE %_cpu:acc
movw %_cpu:acc @_CALC
straw $3
cmpw @_CALC
brne :_int_0022
movw $1 %_cpu:acc
bra :_int_0023
:_int_0022
movw $0 %_cpu:acc
:_int_0023
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# LOOP_CTRL:<program.LoopControl 10, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $6
brz :_Control_10_else
# CALL:<program.Call name:calibrateDensities with args:[]>
stinc $2
suba ::_fun_calibrateDensities
stdec $2
# CTRL_MARKER:<program.ControlMarker marker:10 If else>
bra :_Control_10_end
:_Control_10_else
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:1>]>
movb $1 %b1
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:1>, <program.Value const:1>, <program.Value const:1>]>
movb $1 %11
# CALL:<program.Call <program.Value name:tr> = name:Ed.ReadLineTracker with args:[]>
stinc $1
suba ::_fun_Ed.ReadLineTracker
straw $0
stwaw $5
stdec $1
# CTRL_MARKER:<program.ControlMarker marker:11 If start>
:_Control_11_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:tr> Gt <program.Value name:interval[3]>>
movw @interval %_cpu:acc
addw $3
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
movw %_cpu:acc @_CALC
straw $4
cmpw @_CALC
brge :_int_0024
movw $1 %_cpu:acc
bra :_int_0025
:_int_0024
movw $0 %_cpu:acc
:_int_0025
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# LOOP_CTRL:<program.LoopControl 11, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $6
brz :_Control_11_else
# CTRL_MARKER:<program.ControlMarker marker:12 If start>
:_Control_12_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:message> Eq <program.Value name:MESSAGE_LOW>>
movw @MESSAGE_LOW %_cpu:acc
movw %_cpu:acc @_CALC
straw $3
cmpw @_CALC
brne :_int_0026
movw $1 %_cpu:acc
bra :_int_0027
:_int_0026
movw $0 %_cpu:acc
:_int_0027
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# LOOP_CTRL:<program.LoopControl 12, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $6
brz :_Control_12_else
# UAssign:<program.UAssign <program.Value name:new_tone> = UAdd <program.Value const:4>>
movw $4 %_cpu:acc
stwaw $5
# CTRL_MARKER:<program.ControlMarker marker:12 If else>
bra :_Control_12_end
:_Control_12_else
# UAssign:<program.UAssign <program.Value name:new_tone> = UAdd <program.Value const:9>>
movw $9 %_cpu:acc
stwaw $5
# CTRL_MARKER:<program.ControlMarker marker:12 If end>
:_Control_12_end
# CTRL_MARKER:<program.ControlMarker marker:11 If else>
bra :_Control_11_end
:_Control_11_else
# CTRL_MARKER:<program.ControlMarker marker:13 If start>
:_Control_13_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:tr> Gt <program.Value name:interval[1]>>
movw @interval %_cpu:acc
addw $1
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
movw %_cpu:acc @_CALC
straw $4
cmpw @_CALC
brge :_int_0028
movw $1 %_cpu:acc
bra :_int_0029
:_int_0028
movw $0 %_cpu:acc
:_int_0029
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# LOOP_CTRL:<program.LoopControl 13, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $6
brz :_Control_13_else
# CTRL_MARKER:<program.ControlMarker marker:14 If start>
:_Control_14_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:tr> Gt <program.Value name:interval[2]>>
movw @interval %_cpu:acc
addw $2
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
movw %_cpu:acc @_CALC
straw $4
cmpw @_CALC
brge :_int_0030
movw $1 %_cpu:acc
bra :_int_0031
:_int_0030
movw $0 %_cpu:acc
:_int_0031
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# LOOP_CTRL:<program.LoopControl 14, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $6
brz :_Control_14_else
# CTRL_MARKER:<program.ControlMarker marker:15 If start>
:_Control_15_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:message> Eq <program.Value name:MESSAGE_LOW>>
movw @MESSAGE_LOW %_cpu:acc
movw %_cpu:acc @_CALC
straw $3
cmpw @_CALC
brne :_int_0032
movw $1 %_cpu:acc
bra :_int_0033
:_int_0032
movw $0 %_cpu:acc
:_int_0033
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# LOOP_CTRL:<program.LoopControl 15, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $6
brz :_Control_15_else
# UAssign:<program.UAssign <program.Value name:new_tone> = UAdd <program.Value const:3>>
movw $3 %_cpu:acc
stwaw $5
# CTRL_MARKER:<program.ControlMarker marker:15 If else>
bra :_Control_15_end
:_Control_15_else
# UAssign:<program.UAssign <program.Value name:new_tone> = UAdd <program.Value const:8>>
movw $8 %_cpu:acc
stwaw $5
# CTRL_MARKER:<program.ControlMarker marker:15 If end>
:_Control_15_end
# CTRL_MARKER:<program.ControlMarker marker:14 If else>
bra :_Control_14_end
:_Control_14_else
# CTRL_MARKER:<program.ControlMarker marker:16 If start>
:_Control_16_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:message> Eq <program.Value name:MESSAGE_LOW>>
movw @MESSAGE_LOW %_cpu:acc
movw %_cpu:acc @_CALC
straw $3
cmpw @_CALC
brne :_int_0034
movw $1 %_cpu:acc
bra :_int_0035
:_int_0034
movw $0 %_cpu:acc
:_int_0035
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# LOOP_CTRL:<program.LoopControl 16, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $6
brz :_Control_16_else
# UAssign:<program.UAssign <program.Value name:new_tone> = UAdd <program.Value const:2>>
movw $2 %_cpu:acc
stwaw $5
# CTRL_MARKER:<program.ControlMarker marker:16 If else>
bra :_Control_16_end
:_Control_16_else
# UAssign:<program.UAssign <program.Value name:new_tone> = UAdd <program.Value const:7>>
movw $7 %_cpu:acc
stwaw $5
# CTRL_MARKER:<program.ControlMarker marker:16 If end>
:_Control_16_end
# CTRL_MARKER:<program.ControlMarker marker:14 If end>
:_Control_14_end
# CTRL_MARKER:<program.ControlMarker marker:13 If else>
bra :_Control_13_end
:_Control_13_else
# CTRL_MARKER:<program.ControlMarker marker:17 If start>
:_Control_17_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:tr> Gt <program.Value name:interval[0]>>
movw @interval %_cpu:acc
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
movw %_cpu:acc @_CALC
straw $4
cmpw @_CALC
brge :_int_0036
movw $1 %_cpu:acc
bra :_int_0037
:_int_0036
movw $0 %_cpu:acc
:_int_0037
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# LOOP_CTRL:<program.LoopControl 17, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $6
brz :_Control_17_else
# CTRL_MARKER:<program.ControlMarker marker:18 If start>
:_Control_18_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:message> Eq <program.Value name:MESSAGE_LOW>>
movw @MESSAGE_LOW %_cpu:acc
movw %_cpu:acc @_CALC
straw $3
cmpw @_CALC
brne :_int_0038
movw $1 %_cpu:acc
bra :_int_0039
:_int_0038
movw $0 %_cpu:acc
:_int_0039
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# LOOP_CTRL:<program.LoopControl 18, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $6
brz :_Control_18_else
# UAssign:<program.UAssign <program.Value name:new_tone> = UAdd <program.Value const:1>>
movw $1 %_cpu:acc
stwaw $5
# CTRL_MARKER:<program.ControlMarker marker:18 If else>
bra :_Control_18_end
:_Control_18_else
# UAssign:<program.UAssign <program.Value name:new_tone> = UAdd <program.Value const:6>>
movw $6 %_cpu:acc
stwaw $5
# CTRL_MARKER:<program.ControlMarker marker:18 If end>
:_Control_18_end
# CTRL_MARKER:<program.ControlMarker marker:17 If else>
bra :_Control_17_end
:_Control_17_else
# CTRL_MARKER:<program.ControlMarker marker:19 If start>
:_Control_19_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:message> Eq <program.Value name:MESSAGE_LOW>>
movw @MESSAGE_LOW %_cpu:acc
movw %_cpu:acc @_CALC
straw $3
cmpw @_CALC
brne :_int_0040
movw $1 %_cpu:acc
bra :_int_0041
:_int_0040
movw $0 %_cpu:acc
:_int_0041
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# LOOP_CTRL:<program.LoopControl 19, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $6
brz :_Control_19_else
# UAssign:<program.UAssign <program.Value name:new_tone> = UAdd <program.Value const:0>>
movw $0 %_cpu:acc
stwaw $5
# CTRL_MARKER:<program.ControlMarker marker:19 If else>
bra :_Control_19_end
:_Control_19_else
# UAssign:<program.UAssign <program.Value name:new_tone> = UAdd <program.Value const:5>>
movw $5 %_cpu:acc
stwaw $5
# CTRL_MARKER:<program.ControlMarker marker:19 If end>
:_Control_19_end
# CTRL_MARKER:<program.ControlMarker marker:17 If end>
:_Control_17_end
# CTRL_MARKER:<program.ControlMarker marker:13 If end>
:_Control_13_end
# CTRL_MARKER:<program.ControlMarker marker:11 If end>
:_Control_11_end
# CTRL_MARKER:<program.ControlMarker marker:20 If start>
:_Control_20_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:new_tone> Lt <program.Value const:9>>
straw $5
cmpw $9
brle :_int_0042
movw $1 %_cpu:acc
bra :_int_0043
:_int_0042
movw $0 %_cpu:acc
:_int_0043
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# LOOP_CTRL:<program.LoopControl 20, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $6
brz :_Control_20_else
# CALL:<program.Call name:Ed.PlayTone with args:[<program.Value const:100>, <program.Value const:1>]>
stinc $2
movw $100 %_cpu:acc
stwaw $0
movw $1 %_cpu:acc
stwaw $1
suba ::_fun_Ed.PlayTone
stdec $2
# CALL:<program.Call name:Ed.TimeWait with args:[<program.Value const:30>, <program.Value const:1>]>
stinc $3
movw $30 %_cpu:acc
stwaw $0
movw $1 %_cpu:acc
stwaw $1
suba ::_fun_Ed.TimeWait
stdec $3
# CALL:<program.Call name:Ed.PlayTone with args:[<program.Value name:tones[new_tone]>, <program.Value const:30000>]>
stinc $2
straw $7
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
# CTRL_MARKER:<program.ControlMarker marker:20 If else>
bra :_Control_20_end
:_Control_20_else
# CALL:<program.Call name:Ed.TimeWait with args:[<program.Value const:30>, <program.Value const:1>]>
stinc $3
movw $30 %_cpu:acc
stwaw $0
movw $1 %_cpu:acc
stwaw $1
suba ::_fun_Ed.TimeWait
stdec $3
# CTRL_MARKER:<program.ControlMarker marker:20 If end>
:_Control_20_end
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:1>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %11
# CTRL_MARKER:<program.ControlMarker marker:10 If end>
:_Control_10_end
# CTRL_MARKER:<program.ControlMarker marker:9 If end>
:_Control_9_end
# CTRL_MARKER:<program.ControlMarker marker:8 If end>
:_Control_8_end
# CALL:<program.Call name:Ed.ReadIRData with args:[]>
stinc $1
suba ::_fun_Ed.ReadIRData
stdec $1
# CALL:<program.Call name:Ed.ReadIRData with args:[]>
stinc $1
suba ::_fun_Ed.ReadIRData
stdec $1
# UAssign:<program.UAssign <program.Value name:processingLock> = UAdd <program.Value const:0>>
movw $0 @processingLock
# CTRL_MARKER:<program.ControlMarker marker:7 If end>
:_Control_7_else
:_Control_7_end
ret
:_end_readMessage

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
# CTRL_MARKER:<program.ControlMarker marker:25 If start>
:_Control_25_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:units> Eq <program.Value const:0>>
straw $4
cmpw $0
brne :_int_0044
movw $1 %_cpu:acc
bra :_int_0045
:_int_0044
movw $0 %_cpu:acc
:_int_0045
# OPTIMISED OUT (STACK_WRITE): stwaw $5
# LOOP_CTRL:<program.LoopControl 25, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $5
brz :_Control_25_else
# BAssign:<program.BAssign <program.Value name:time> = <program.Value name:time> Mult <program.Value const:100>>
straw $3
mulw $100
stwaw $3
# CTRL_MARKER:<program.ControlMarker marker:25 If else>
bra :_Control_25_end
:_Control_25_else
# BAssign:<program.BAssign <program.Value name:time> = <program.Value name:time> Div <program.Value const:10>>
straw $3
divw $10
stwaw $3
# CTRL_MARKER:<program.ControlMarker marker:25 If end>
:_Control_25_end
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

# FUNCTION:Ed.ReadIRData
::_fun_Ed.ReadIRData
# Ed.ReadModuleRegister8Bit:<program.Call <program.Value name:data> = name:Ed.ReadModuleRegister8Bit with args:[<program.Value const:5>, <program.Value const:4>]>
movb %54 %_cpu:acc
conv
stwaw $3
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:5>, <program.Value const:4>, <program.Value const:0>]>
movb $0 %54
# Ed.ClearModuleRegisterBit:<program.Call name:Ed.ClearModuleRegisterBit with args:[<program.Value const:5>, <program.Value const:0>, <program.Value const:0>]>
bitclr 0 %50
# RETURN:<program.Return <program.Value name:data>>
# OPTIMISED OUT (USELESS_STACK_OP): straw $3
# OPTIMISED OUT (USELESS_STACK_OP): stwaw $3
ret
# OPTIMISED OUT (DBL-RET): ret
:_end_Ed.ReadIRData

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
BEGIN EVENT %IR_RECEIVER1:status, 1, 1
bitclr $0 %IR_RECEIVER1:status
pushw @_CALC
stinc $4
suba ::_fun_readMessage
stdec $4
popw @_CALC
stop
END EVENT
FINISH
