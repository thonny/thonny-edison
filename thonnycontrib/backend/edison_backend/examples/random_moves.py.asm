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
DATW CYCLE_DURATION 4 1
DATW SLOWING_DURATION 5 1
DATW START_SLOWING 6 1
DATW slowed_speed-object, 7, 12, 7, 5, 3, 2, 2, 1, 1, 1, 1, 1, 1, 1
DATW slowed_speed, 19, 1, 3079
DATW wait_before_stop-object, 20, 12, 0, 0, 1, 1, 1, 2, 2, 2, 2, 2, 1, 1
DATW wait_before_stop, 32, 1, 3092
DATW wait_after_stop-object, 33, 12, 0, 0, 0, 0, 0, 0, 0, 1, 1, 2, 3, 1
DATW wait_after_stop, 45, 1, 3105
DATW random_tone-object, 46, 60, 17760, 23702, 19728, 12610, 29920, 15091, 22218, 30597, 24572, 28980, 13945, 26002, 27356, 11480, 29480, 30795, 7709, 21920, 27717, 16533, 17680, 17448, 18267, 24537, 21275, 12184, 14040, 29837, 19640, 21484, 18761, 11112, 4543, 11516, 16146, 16742, 27671, 19214, 30124, 26473, 25378, 16269, 17322, 15099, 17302, 21210, 17089, 30756, 25741, 20141, 8506, 15029, 7337, 16583, 26826, 23275, 28513, 5391, 13426, 32000
DATW random_tone, 106, 1, 15406
DATW random_left_motor-object, 107, 60, 128, 128, 64, 64, 128, 64, 64, 128, 128, 64, 128, 64, 64, 64, 64, 64, 128, 128, 128, 64, 128, 128, 128, 64, 64, 128, 64, 128, 128, 64, 64, 64, 64, 64, 128, 128, 64, 64, 128, 64, 128, 128, 128, 128, 128, 64, 128, 64, 128, 128, 128, 64, 64, 64, 128, 64, 128, 128, 64, 128
DATW random_left_motor, 167, 1, 15467
DATW random_right_motor-object, 168, 60, 64, 128, 64, 128, 128, 64, 128, 128, 64, 128, 64, 128, 64, 64, 128, 128, 128, 64, 64, 128, 64, 128, 128, 64, 128, 64, 64, 128, 64, 128, 64, 128, 64, 128, 64, 64, 128, 128, 128, 64, 64, 128, 64, 128, 64, 128, 128, 128, 128, 64, 128, 128, 64, 128, 64, 128, 64, 128, 64, 64
DATW random_right_motor, 228, 1, 15528
DATW random_index 229 1
DATW random_value 230 1
stinc $2

# FUNCTION:__main__
::_fun___main__
# Set intial tempo
movw $250 %68
# UAssign:<program.UAssign <program.Value name:CYCLE_DURATION> = UAdd <program.Value const:60>>
movw $60 @CYCLE_DURATION
# UAssign:<program.UAssign <program.Value name:SLOWING_DURATION> = UAdd <program.Value const:12>>
movw $12 @SLOWING_DURATION
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:CYCLE_DURATION> Sub <program.Value name:SLOWING_DURATION>>
movw @SLOWING_DURATION %_cpu:acc
movw %_cpu:acc @_CALC
movw @CYCLE_DURATION %_cpu:acc
subw @_CALC
stwaw $0
# UAssign:<program.UAssign <program.Value name:START_SLOWING> = UAdd <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $0
movw %_cpu:acc @START_SLOWING
# UAssign:<program.UAssign <program.Value name:random_index> = UAdd <program.Value const:0>>
movw $0 @random_index
# UAssign:<program.UAssign <program.Value name:random_value> = UAdd <program.Value const:111>>
movw $111 @random_value
# CTRL_MARKER:<program.ControlMarker marker:10 While start>
:_Control_10_start
# LOOP_CTRL:<program.LoopControl 10, name:While, test:<program.Value const:1>>
movw $1 %_cpu:acc
brz :_Control_10_else
# Ed.WriteModuleRegister16Bit:<program.Call name:Ed.WriteModuleRegister16Bit with args:[<program.Value const:14>, <program.Value const:2>, <program.Value const:20>]>
movw $20 %e2
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:14>, <program.Value const:1>, <program.Value const:2>]>
movb $2 %e1
# CALL:<program.Call name:Ed.ReadClapSensor with args:[]>
stinc $3
suba ::_fun_Ed.ReadClapSensor
stdec $3
# CTRL_MARKER:<program.ControlMarker marker:11 While start>
:_Control_11_start
# CALL:<program.Call <program.Value name:TEMP-0> = name:Ed.ReadClapSensor with args:[]>
stinc $3
suba ::_fun_Ed.ReadClapSensor
straw $0
stwaw $3
stdec $3
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:TEMP-0> NotEq <program.Value const:4>>
straw $0
cmpw $4
bre :_int_0000
movw $1 %_cpu:acc
bra :_int_0001
:_int_0000
movw $0 %_cpu:acc
:_int_0001
# OPTIMISED OUT (STACK_WRITE): stwaw $1
# LOOP_CTRL:<program.LoopControl 11, name:While, test:<program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $1
brz :_Control_11_else
# CALL:<program.Call name:rewrite_random with args:[]>
stinc $8
suba ::_fun_rewrite_random
stdec $8
# CTRL_MARKER:<program.ControlMarker marker:11 While end>
bra :_Control_11_start
:_Control_11_else
:_Control_11_end
# CALL:<program.Call name:chaos with args:[]>
stinc $5
suba ::_fun_chaos
stdec $5
# CTRL_MARKER:<program.ControlMarker marker:10 While end>
bra :_Control_10_start
:_Control_10_else
:_Control_10_end
stop
:_end___main__

# FUNCTION:chaos
::_fun_chaos
# UAssign:<program.UAssign <program.Value name:index> = UAdd <program.Value const:0>>
movw $0 %_cpu:acc
stwaw $3
# UAssign:<program.UAssign <program.Value name:slowing_index> = UAdd <program.Value const:0>>
movw $0 %_cpu:acc
stwaw $4
# UAssign:<program.UAssign <program.Value name:speed> = UAdd <program.Value const:0>>
movw $0 %_cpu:acc
stwaw $5
# CTRL_MARKER:<program.ControlMarker marker:0 While start>
:_Control_0_start
# LOOP_CTRL:<program.LoopControl 0, name:While, test:<program.Value const:1>>
movw $1 %_cpu:acc
brz :_Control_0_else
# Ed.WriteModuleRegister16Bit:<program.Call name:Ed.WriteModuleRegister16Bit with args:[<program.Value const:6>, <program.Value const:2>, <program.Value name:random_tone[index]>]>
straw $3
addw @random_tone
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
movw %_cpu:acc %62
# Ed.WriteModuleRegister16Bit:<program.Call name:Ed.WriteModuleRegister16Bit with args:[<program.Value const:6>, <program.Value const:4>, <program.Value const:7>]>
movw $7 %64
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:6>, <program.Value const:1>, <program.Value const:2>]>
movb $2 %61
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:random_left_motor[index]> RShift <program.Value const:7>>
straw $3
addw @random_left_motor
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
shrw $7
# OPTIMISED OUT (STACK_WRITE): stwaw $7
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value name:TEMP-0>]>
# OPTIMISED OUT (STACK_READ): straw $7
conv
movb %_cpu:acc %b1
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:random_right_motor[index]> RShift <program.Value const:7>>
straw $3
addw @random_right_motor
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
shrw $7
# OPTIMISED OUT (STACK_WRITE): stwaw $7
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:1>, <program.Value const:1>, <program.Value name:TEMP-0>]>
# OPTIMISED OUT (STACK_READ): straw $7
conv
movb %_cpu:acc %11
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:random_left_motor[index]> BitOr <program.Value name:speed>>
straw $5
movw %_cpu:acc @_CALC
straw $3
addw @random_left_motor
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
orw @_CALC
# OPTIMISED OUT (STACK_WRITE): stwaw $7
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:8>, <program.Value const:1>, <program.Value name:TEMP-0>]>
# OPTIMISED OUT (STACK_READ): straw $7
conv
movb %_cpu:acc %81
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:random_right_motor[index]> BitOr <program.Value name:speed>>
straw $5
movw %_cpu:acc @_CALC
straw $3
addw @random_right_motor
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
orw @_CALC
# OPTIMISED OUT (STACK_WRITE): stwaw $7
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:3>, <program.Value const:1>, <program.Value name:TEMP-0>]>
# OPTIMISED OUT (STACK_READ): straw $7
conv
movb %_cpu:acc %31
# BAssign:<program.BAssign <program.Value name:index> = <program.Value name:index> Add <program.Value const:1>>
straw $3
addw $1
stwaw $3
# CTRL_MARKER:<program.ControlMarker marker:1 If start>
:_Control_1_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:index> Gt <program.Value name:START_SLOWING>>
movw @START_SLOWING %_cpu:acc
movw %_cpu:acc @_CALC
straw $3
cmpw @_CALC
brge :_int_0002
movw $1 %_cpu:acc
bra :_int_0003
:_int_0002
movw $0 %_cpu:acc
:_int_0003
# OPTIMISED OUT (STACK_WRITE): stwaw $7
# LOOP_CTRL:<program.LoopControl 1, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $7
brz :_Control_1_else
# UAssign:<program.UAssign <program.Value name:speed> = UAdd <program.Value name:slowed_speed[slowing_index]>>
straw $4
addw @slowed_speed
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
stwaw $5
# CTRL_MARKER:<program.ControlMarker marker:2 If start>
:_Control_2_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:wait_before_stop[slowing_index]> Gt <program.Value const:0>>
straw $4
addw @wait_before_stop
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
cmpw $0
brge :_int_0004
movw $1 %_cpu:acc
bra :_int_0005
:_int_0004
movw $0 %_cpu:acc
:_int_0005
# OPTIMISED OUT (STACK_WRITE): stwaw $7
# LOOP_CTRL:<program.LoopControl 2, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $7
brz :_Control_2_else
# Ed.WriteModuleRegister16Bit:<program.Call name:Ed.WriteModuleRegister16Bit with args:[<program.Value const:14>, <program.Value const:2>, <program.Value name:wait_before_stop[slowing_index]>]>
straw $4
addw @wait_before_stop
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
movw %_cpu:acc %e2
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:14>, <program.Value const:1>, <program.Value const:2>]>
movb $2 %e1
# CTRL_MARKER:<program.ControlMarker marker:2 If end>
:_Control_2_else
:_Control_2_end
# CTRL_MARKER:<program.ControlMarker marker:3 If start>
:_Control_3_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:wait_after_stop[slowing_index]> Gt <program.Value const:0>>
straw $4
addw @wait_after_stop
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
cmpw $0
brge :_int_0006
movw $1 %_cpu:acc
bra :_int_0007
:_int_0006
movw $0 %_cpu:acc
:_int_0007
# OPTIMISED OUT (STACK_WRITE): stwaw $7
# LOOP_CTRL:<program.LoopControl 3, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $7
brz :_Control_3_else
# Inline function for Ed.Drive_INLINE_UNLIMITED:<program.Call name:Ed.Drive_INLINE_UNLIMITED with args:[<program.Value const:0>, <program.Value const:1>, <program.Value const:1>]>
movb $192 %81
movb $192 %31
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:1>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %11
# UAssign:<program.UAssign <program.Value name:wait> = UAdd <program.Value const:0>>
movw $0 %_cpu:acc
stwaw $6
# CTRL_MARKER:<program.ControlMarker marker:4 While start>
:_Control_4_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:wait> Lt <program.Value name:wait_after_stop[slowing_index]>>
straw $4
addw @wait_after_stop
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
movw %_cpu:acc @_CALC
straw $6
cmpw @_CALC
brle :_int_0008
movw $1 %_cpu:acc
bra :_int_0009
:_int_0008
movw $0 %_cpu:acc
:_int_0009
# OPTIMISED OUT (STACK_WRITE): stwaw $7
# LOOP_CTRL:<program.LoopControl 4, name:While, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $7
brz :_Control_4_else
# BAssign:<program.BAssign <program.Value name:wait> = <program.Value name:wait> Add <program.Value const:1>>
straw $6
addw $1
stwaw $6
# CALL:<program.Call name:rewrite_random with args:[]>
stinc $8
suba ::_fun_rewrite_random
stdec $8
# CTRL_MARKER:<program.ControlMarker marker:4 While end>
bra :_Control_4_start
:_Control_4_else
:_Control_4_end
# CTRL_MARKER:<program.ControlMarker marker:3 If end>
:_Control_3_else
:_Control_3_end
# BAssign:<program.BAssign <program.Value name:slowing_index> = <program.Value name:slowing_index> Add <program.Value const:1>>
straw $4
addw $1
stwaw $4
# CTRL_MARKER:<program.ControlMarker marker:5 If start>
:_Control_5_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:index> Eq <program.Value name:CYCLE_DURATION>>
movw @CYCLE_DURATION %_cpu:acc
movw %_cpu:acc @_CALC
straw $3
cmpw @_CALC
brne :_int_0010
movw $1 %_cpu:acc
bra :_int_0011
:_int_0010
movw $0 %_cpu:acc
:_int_0011
# OPTIMISED OUT (STACK_WRITE): stwaw $7
# LOOP_CTRL:<program.LoopControl 5, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $7
brz :_Control_5_else
# RETURN:<program.Return <program.Value name:index>>
# OPTIMISED OUT (USELESS_STACK_OP): straw $3
# OPTIMISED OUT (USELESS_STACK_OP): stwaw $3
ret
# CTRL_MARKER:<program.ControlMarker marker:5 If end>
:_Control_5_else
:_Control_5_end
# CTRL_MARKER:<program.ControlMarker marker:1 If end>
:_Control_1_else
:_Control_1_end
# CTRL_MARKER:<program.ControlMarker marker:0 While end>
bra :_Control_0_start
:_Control_0_else
:_Control_0_end
ret
:_end_chaos

# FUNCTION:rewrite_random
::_fun_rewrite_random
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:random_value> Mult <program.Value const:35>>
movw @random_value %_cpu:acc
mulw $35
# OPTIMISED OUT (STACK_WRITE): stwaw $5
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:TEMP-0> Mod <program.Value const:509>>
# OPTIMISED OUT (STACK_READ): straw $5
modw $509
stwaw $6
# UAssign:<program.UAssign <program.Value name:random_value> = UAdd <program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $6
movw %_cpu:acc @random_value
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:random_value> Mod <program.Value const:2>>
movw @random_value %_cpu:acc
modw $2
# OPTIMISED OUT (STACK_WRITE): stwaw $5
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value const:2> Sub <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $5
movw %_cpu:acc @_CALC
movw $2 %_cpu:acc
subw @_CALC
stwaw $6
# BAssign:<program.BAssign <program.Value name:TEMP-2> = <program.Value name:TEMP-1> LShift <program.Value const:6>>
# OPTIMISED OUT (STACK_READ): straw $6
shlw $6
# OPTIMISED OUT (STACK_WRITE): stwaw $7
# UAssign:<program.UAssign <program.Value name:rnd_left> = UAdd <program.Value name:TEMP-2>>
# OPTIMISED OUT (STACK_READ): straw $7
stwaw $3
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:random_value> Div <program.Value const:2>>
movw @random_value %_cpu:acc
divw $2
# OPTIMISED OUT (STACK_WRITE): stwaw $5
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:TEMP-0> Mod <program.Value const:2>>
# OPTIMISED OUT (STACK_READ): straw $5
modw $2
stwaw $6
# BAssign:<program.BAssign <program.Value name:TEMP-2> = <program.Value const:2> Sub <program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $6
movw %_cpu:acc @_CALC
movw $2 %_cpu:acc
subw @_CALC
# OPTIMISED OUT (STACK_WRITE): stwaw $7
# BAssign:<program.BAssign <program.Value name:TEMP-3> = <program.Value name:TEMP-2> LShift <program.Value const:6>>
# OPTIMISED OUT (STACK_READ): straw $7
shlw $6
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# UAssign:<program.UAssign <program.Value name:rnd_right> = UAdd <program.Value name:TEMP-3>>
# OPTIMISED OUT (STACK_READ): straw $8
stwaw $4
# CTRL_MARKER:<program.ControlMarker marker:6 If start>
:_Control_6_start
# CTRL_MARKER:<program.ControlMarker marker:7 And start>
:_Control_7_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:random_index> GtE <program.Value name:START_SLOWING>>
movw @START_SLOWING %_cpu:acc
movw %_cpu:acc @_CALC
movw @random_index %_cpu:acc
cmpw @_CALC
brgr :_int_0012
movw $1 %_cpu:acc
bra :_int_0013
:_int_0012
movw $0 %_cpu:acc
:_int_0013
# OPTIMISED OUT (STACK_WRITE): stwaw $5
# BOOL_CHK:<program.BoolCheck 7 And check:<program.Value name:TEMP-0>, target<program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $5
brnz :_int_0014
movw $0 %_cpu:acc
stwaw $6
bra :_Control_7_end
:_int_0014
# BAssign:<program.BAssign <program.Value name:TEMP-2> = <program.Value name:random_index> Sub <program.Value const:1>>
movw @random_index %_cpu:acc
subw $1
# OPTIMISED OUT (STACK_WRITE): stwaw $7
# BAssign:<program.BAssign <program.Value name:TEMP-3> = <program.Value name:rnd_left> Eq <program.Value name:random_left_motor[TEMP-2]>>
# OPTIMISED OUT (STACK_READ): straw $7
addw @random_left_motor
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
movw %_cpu:acc @_CALC
straw $3
cmpw @_CALC
brne :_int_0015
movw $1 %_cpu:acc
bra :_int_0016
:_int_0015
movw $0 %_cpu:acc
:_int_0016
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# BOOL_CHK:<program.BoolCheck 7 And check:<program.Value name:TEMP-3>, target<program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $8
brnz :_int_0017
movw $0 %_cpu:acc
stwaw $6
bra :_Control_7_end
:_int_0017
# BAssign:<program.BAssign <program.Value name:TEMP-4> = <program.Value name:random_index> Sub <program.Value const:1>>
movw @random_index %_cpu:acc
subw $1
# OPTIMISED OUT (STACK_WRITE): stwaw $9
# BAssign:<program.BAssign <program.Value name:TEMP-5> = <program.Value name:rnd_right> Eq <program.Value name:random_right_motor[TEMP-4]>>
# OPTIMISED OUT (STACK_READ): straw $9
addw @random_right_motor
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
movw %_cpu:acc @_CALC
straw $4
cmpw @_CALC
brne :_int_0018
movw $1 %_cpu:acc
bra :_int_0019
:_int_0018
movw $0 %_cpu:acc
:_int_0019
# OPTIMISED OUT (STACK_WRITE): stwaw $10
# BOOL_CHK:<program.BoolCheck 7 And check:<program.Value name:TEMP-5>, target<program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $10
brnz :_int_0020
movw $0 %_cpu:acc
stwaw $6
bra :_Control_7_end
:_int_0020
# BOOL_CHK:<program.BoolCheck 7 Done check:<program.Value const:1>, target<program.Value name:TEMP-1>>
movw $1 %_cpu:acc
stwaw $6
# CTRL_MARKER:<program.ControlMarker marker:7 And end>
:_Control_7_else
:_Control_7_end
# LOOP_CTRL:<program.LoopControl 6, name:If, test:<program.Value name:TEMP-1>>
straw $6
brz :_Control_6_else
# RETURN:<program.Return None>
ret
# CTRL_MARKER:<program.ControlMarker marker:6 If end>
:_Control_6_else
:_Control_6_end
# UAssign:<program.UAssign <program.Value name:random_left_motor[random_index]> = UAdd <program.Value name:rnd_left>>
straw $3
movw %_cpu:acc %_index:16b1window
movw @random_index %_cpu:acc
addw @random_left_motor
convl
movb %_cpu:acc %_index:16b1cursor
bitset $1 %_index:action
# UAssign:<program.UAssign <program.Value name:random_right_motor[random_index]> = UAdd <program.Value name:rnd_right>>
straw $4
movw %_cpu:acc %_index:16b1window
movw @random_index %_cpu:acc
addw @random_right_motor
convl
movb %_cpu:acc %_index:16b1cursor
bitset $1 %_index:action
# CTRL_MARKER:<program.ControlMarker marker:8 If start>
:_Control_8_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:CYCLE_DURATION> Sub <program.Value const:1>>
movw @CYCLE_DURATION %_cpu:acc
subw $1
# OPTIMISED OUT (STACK_WRITE): stwaw $5
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:random_index> Eq <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $5
movw %_cpu:acc @_CALC
movw @random_index %_cpu:acc
cmpw @_CALC
brne :_int_0021
movw $1 %_cpu:acc
bra :_int_0022
:_int_0021
movw $0 %_cpu:acc
:_int_0022
stwaw $6
# LOOP_CTRL:<program.LoopControl 8, name:If, test:<program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $6
brz :_Control_8_else
# UAssign:<program.UAssign <program.Value name:random_tone[random_index]> = UAdd <program.Value const:32000>>
movw $32000 %_cpu:acc
movw %_cpu:acc %_index:16b1window
movw @random_index %_cpu:acc
addw @random_tone
convl
movb %_cpu:acc %_index:16b1cursor
bitset $1 %_index:action
# CTRL_MARKER:<program.ControlMarker marker:8 If else>
bra :_Control_8_end
:_Control_8_else
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:random_value> Mult <program.Value const:50>>
movw @random_value %_cpu:acc
mulw $50
# OPTIMISED OUT (STACK_WRITE): stwaw $5
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:TEMP-0> Add <program.Value const:4000>>
# OPTIMISED OUT (STACK_READ): straw $5
addw $4000
stwaw $6
# UAssign:<program.UAssign <program.Value name:random_tone[random_index]> = UAdd <program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $6
movw %_cpu:acc %_index:16b1window
movw @random_index %_cpu:acc
addw @random_tone
convl
movb %_cpu:acc %_index:16b1cursor
bitset $1 %_index:action
# CTRL_MARKER:<program.ControlMarker marker:8 If end>
:_Control_8_end
# BAssign:<program.BAssign <program.Value name:random_index> = <program.Value name:random_index> Add <program.Value const:1>>
movw @random_index %_cpu:acc
addw $1
movw %_cpu:acc @random_index
# CTRL_MARKER:<program.ControlMarker marker:9 If start>
:_Control_9_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:random_index> Eq <program.Value name:CYCLE_DURATION>>
movw @CYCLE_DURATION %_cpu:acc
movw %_cpu:acc @_CALC
movw @random_index %_cpu:acc
cmpw @_CALC
brne :_int_0023
movw $1 %_cpu:acc
bra :_int_0024
:_int_0023
movw $0 %_cpu:acc
:_int_0024
# OPTIMISED OUT (STACK_WRITE): stwaw $5
# LOOP_CTRL:<program.LoopControl 9, name:If, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $5
brz :_Control_9_else
# UAssign:<program.UAssign <program.Value name:random_index> = UAdd <program.Value const:0>>
movw $0 @random_index
# CTRL_MARKER:<program.ControlMarker marker:9 If end>
:_Control_9_else
:_Control_9_end
ret
:_end_rewrite_random

# FUNCTION:Ed.ReadClapSensor
::_fun_Ed.ReadClapSensor
# Ed.ReadModuleRegister8Bit:<program.Call <program.Value name:TEMP-0> = name:Ed.ReadModuleRegister8Bit with args:[<program.Value const:6>, <program.Value const:0>]>
movb %60 %_cpu:acc
conv
# OPTIMISED OUT (STACK_WRITE): stwaw $4
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:TEMP-0> BitAnd <program.Value const:4>>
# OPTIMISED OUT (STACK_READ): straw $4
andw $4
# OPTIMISED OUT (STACK_WRITE): stwaw $5
# UAssign:<program.UAssign <program.Value name:data> = UAdd <program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $5
stwaw $3
# CTRL_MARKER:<program.ControlMarker marker:94 If start>
:_Control_94_start
# LOOP_CTRL:<program.LoopControl 94, name:If, test:<program.Value name:data>>
straw $3
brz :_Control_94_else
# Ed.ClearModuleRegisterBit:<program.Call name:Ed.ClearModuleRegisterBit with args:[<program.Value const:6>, <program.Value const:0>, <program.Value const:2>]>
bitclr 2 %60
# CTRL_MARKER:<program.ControlMarker marker:94 If end>
:_Control_94_else
:_Control_94_end
# RETURN:<program.Return <program.Value name:data>>
# OPTIMISED OUT (USELESS_STACK_OP): straw $3
# OPTIMISED OUT (USELESS_STACK_OP): stwaw $3
ret
# OPTIMISED OUT (DBL-RET): ret
:_end_Ed.ReadClapSensor
stop
END MAIN
FINISH
