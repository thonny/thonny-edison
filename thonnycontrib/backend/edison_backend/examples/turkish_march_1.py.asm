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
DATW tones-object, 4, 46, 32396, 30578, 28862, 27242, 25713, 24270, 22908, 21622, 20408, 19263, 18181, 17161, 16202, 15289, 14431, 13622, 12856, 12135, 11457, 10811, 10207, 9631, 9090, 8581, 8099, 7645, 7215, 6810, 6428, 6067, 5727, 5405, 5102, 4816, 4545, 4290, 4050, 3822, 3608, 3405, 3214, 3034, 2863, 2703, 2551, 2408
DATW tones, 50, 1, 11780
DATW TRANSPOSITION 51 1
DATW LENGTH_0 52 1
DATW LENGTH_1 53 1
DATW LENGTH_2 54 1
DATW LENGTH_4 55 1
DATW LENGTH_8 56 1
DATW LENGTH_16 57 1
DATW repeat 58 1
stinc $2

# FUNCTION:__main__
::_fun___main__
# Set intial tempo
movw $70 %68
# UAssign:<program.UAssign <program.Value name:TRANSPOSITION> = UAdd <program.Value const:-10>>
movw $-10 @TRANSPOSITION
# UAssign:<program.UAssign <program.Value name:LENGTH_0> = UAdd <program.Value const:0>>
movw $0 @LENGTH_0
# UAssign:<program.UAssign <program.Value name:LENGTH_1> = UAdd <program.Value const:129>>
movw $129 @LENGTH_1
# UAssign:<program.UAssign <program.Value name:LENGTH_2> = UAdd <program.Value const:130>>
movw $130 @LENGTH_2
# UAssign:<program.UAssign <program.Value name:LENGTH_4> = UAdd <program.Value const:132>>
movw $132 @LENGTH_4
# UAssign:<program.UAssign <program.Value name:LENGTH_8> = UAdd <program.Value const:136>>
movw $136 @LENGTH_8
# UAssign:<program.UAssign <program.Value name:LENGTH_16> = UAdd <program.Value const:144>>
movw $144 @LENGTH_16
# Ed.WriteModuleRegister16Bit:<program.Call name:Ed.WriteModuleRegister16Bit with args:[<program.Value const:14>, <program.Value const:2>, <program.Value const:20>]>
movw $20 %e2
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:14>, <program.Value const:1>, <program.Value const:2>]>
movb $2 %e1
# Ed.ClearModuleRegisterBit:<program.Call name:Ed.ClearModuleRegisterBit with args:[<program.Value const:6>, <program.Value const:0>, <program.Value const:2>]>
bitclr 2 %60
# CTRL_MARKER:<program.ControlMarker marker:1 While start>
:_Control_1_start
# Ed.ReadModuleRegister8Bit:<program.Call <program.Value name:TEMP-0> = name:Ed.ReadModuleRegister8Bit with args:[<program.Value const:6>, <program.Value const:0>]>
movb %60 %_cpu:acc
conv
# OPTIMISED OUT (STACK_WRITE): stwaw $0
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:TEMP-0> NotEq <program.Value const:4>>
# OPTIMISED OUT (STACK_READ): straw $0
cmpw $4
bre :_int_0000
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
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:26>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $26 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:26>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $26 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:26>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $26 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:26>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $26 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:26>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $26 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:26>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $26 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:26>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $26 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:26>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $26 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# UAssign:<program.UAssign <program.Value name:repeat> = UAdd <program.Value const:0>>
movw $0 @repeat
# CTRL_MARKER:<program.ControlMarker marker:2 While start>
:_Control_2_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:repeat> Lt <program.Value const:2>>
movw @repeat %_cpu:acc
cmpw $2
brle :_int_0002
movw $1 %_cpu:acc
bra :_int_0003
:_int_0002
movw $0 %_cpu:acc
:_int_0003
# OPTIMISED OUT (STACK_WRITE): stwaw $0
# LOOP_CTRL:<program.LoopControl 2, name:While, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $0
brz :_Control_2_else
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:24>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $24 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:22>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $22 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:21>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $21 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:22>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $22 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_4>, <program.Value const:25>]>
stinc $6
movw @LENGTH_4 %_cpu:acc
stwaw $0
movw $25 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:25>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $25 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:25>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $25 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:25>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $25 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:27>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $27 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:25>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $25 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:24>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $24 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:25>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $25 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_4>, <program.Value const:29>]>
stinc $6
movw @LENGTH_4 %_cpu:acc
stwaw $0
movw $29 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:29>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $29 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:29>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $29 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:29>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $29 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:30>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $30 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:29>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $29 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:28>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $28 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:29>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $29 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:36>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $36 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:34>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $34 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:33>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $33 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:34>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $34 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:36>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $36 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:34>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $34 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:33>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $33 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:34>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $34 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_4>, <program.Value const:37>]>
stinc $6
movw @LENGTH_4 %_cpu:acc
stwaw $0
movw $37 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:37>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $37 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:37>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $37 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:37>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $37 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:34>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $34 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:34>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $34 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:37>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $37 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:37>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $37 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:36>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $36 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:36>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $36 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:34>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $34 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:34>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $34 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:32>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $32 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:32>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $32 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:34>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $34 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:34>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $34 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:36>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $36 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:36>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $36 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:34>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $34 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:34>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $34 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:32>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $32 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:32>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $32 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:34>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $34 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:34>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $34 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:36>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $36 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:36>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $36 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:34>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $34 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:34>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $34 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:32>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $32 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:32>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $32 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:31>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $31 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:31>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $31 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_4>, <program.Value const:29>]>
stinc $6
movw @LENGTH_4 %_cpu:acc
stwaw $0
movw $29 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:29>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $29 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:29>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $29 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:29>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $29 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:repeat> Add <program.Value const:1>>
movw @repeat %_cpu:acc
addw $1
# OPTIMISED OUT (STACK_WRITE): stwaw $0
# UAssign:<program.UAssign <program.Value name:repeat> = UAdd <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $0
movw %_cpu:acc @repeat
# CTRL_MARKER:<program.ControlMarker marker:2 While end>
bra :_Control_2_start
:_Control_2_else
:_Control_2_end
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:29>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $29 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:29>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $29 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:30>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $30 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:30>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $30 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:32>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $32 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:32>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $32 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:32>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $32 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:32>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $32 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:34>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $34 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:32>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $32 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:30>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $30 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:29>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $29 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_4>, <program.Value const:27>]>
stinc $6
movw @LENGTH_4 %_cpu:acc
stwaw $0
movw $27 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:27>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $27 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:27>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $27 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:27>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $27 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:29>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $29 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:29>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $29 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:30>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $30 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:30>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $30 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:32>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $32 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:32>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $32 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:32>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $32 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:32>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $32 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:34>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $34 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:32>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $32 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:30>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $30 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:29>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $29 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_4>, <program.Value const:27>]>
stinc $6
movw @LENGTH_4 %_cpu:acc
stwaw $0
movw $27 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:27>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $27 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:27>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $27 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:27>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $27 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:25>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $25 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:25>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $25 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:27>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $27 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:27>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $27 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:29>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $29 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:29>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $29 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:29>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $29 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:29>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $29 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:30>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $30 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:29>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $29 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:27>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $27 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:25>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $25 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_4>, <program.Value const:24>]>
stinc $6
movw @LENGTH_4 %_cpu:acc
stwaw $0
movw $24 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:24>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $24 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:24>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $24 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:24>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $24 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:25>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $25 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:25>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $25 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:27>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $27 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:27>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $27 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:29>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $29 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:29>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $29 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:29>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $29 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:29>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $29 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:30>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $30 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:29>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $29 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:27>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $27 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:25>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $25 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_4>, <program.Value const:24>]>
stinc $6
movw @LENGTH_4 %_cpu:acc
stwaw $0
movw $24 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:24>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $24 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:24>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $24 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:24>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $24 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:24>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $24 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:22>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $22 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:21>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $21 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:22>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $22 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_4>, <program.Value const:25>]>
stinc $6
movw @LENGTH_4 %_cpu:acc
stwaw $0
movw $25 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:25>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $25 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:25>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $25 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:25>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $25 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:27>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $27 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:25>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $25 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:24>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $24 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:25>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $25 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_4>, <program.Value const:29>]>
stinc $6
movw @LENGTH_4 %_cpu:acc
stwaw $0
movw $29 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:29>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $29 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:29>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $29 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:29>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $29 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:30>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $30 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:29>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $29 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:28>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $28 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:29>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $29 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:36>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $36 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:34>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $34 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:33>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $33 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:34>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $34 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:36>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $36 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:34>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $34 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:33>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $33 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:34>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $34 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_4>, <program.Value const:37>]>
stinc $6
movw @LENGTH_4 %_cpu:acc
stwaw $0
movw $37 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:37>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $37 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:37>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $37 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:37>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $37 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:34>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $34 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:34>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $34 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:36>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $36 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:36>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $36 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:37>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $37 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:37>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $37 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:36>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $36 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:36>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $36 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:34>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $34 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:34>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $34 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:33>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $33 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:33>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $33 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:34>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $34 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:34>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $34 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:29>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $29 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:29>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $29 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:30>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $30 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:30>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $30 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:27>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $27 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:27>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $27 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_4>, <program.Value const:25>]>
stinc $6
movw @LENGTH_4 %_cpu:acc
stwaw $0
movw $25 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:25>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $25 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:25>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $25 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:25>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $25 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_2>, <program.Value const:24>]>
stinc $6
movw @LENGTH_2 %_cpu:acc
stwaw $0
movw $24 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:24>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $24 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:22>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $22 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_1>, <program.Value const:24>]>
stinc $6
movw @LENGTH_1 %_cpu:acc
stwaw $0
movw $24 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_4>, <program.Value const:22>]>
stinc $6
movw @LENGTH_4 %_cpu:acc
stwaw $0
movw $22 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:22>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $22 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:22>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $22 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
# CALL:<program.Call name:playTone with args:[<program.Value name:LENGTH_0>, <program.Value const:22>]>
stinc $6
movw @LENGTH_0 %_cpu:acc
stwaw $0
movw $22 %_cpu:acc
stwaw $1
suba ::_fun_playTone
stdec $6
stop
:_end___main__

# FUNCTION:playTone
::_fun_playTone
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:length> RShift <program.Value const:7>>
straw $3
shrw $7
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value name:TEMP-0>]>
# OPTIMISED OUT (STACK_READ): straw $6
conv
movb %_cpu:acc %b1
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:length> RShift <program.Value const:7>>
straw $3
shrw $7
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:1>, <program.Value const:1>, <program.Value name:TEMP-0>]>
# OPTIMISED OUT (STACK_READ): straw $6
conv
movb %_cpu:acc %11
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:tone> Add <program.Value name:TRANSPOSITION>>
movw @TRANSPOSITION %_cpu:acc
movw %_cpu:acc @_CALC
straw $4
addw @_CALC
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# Ed.WriteModuleRegister16Bit:<program.Call name:Ed.WriteModuleRegister16Bit with args:[<program.Value const:6>, <program.Value const:2>, <program.Value name:tones[TEMP-0]>]>
# OPTIMISED OUT (STACK_READ): straw $6
addw @tones
convl
movb %_cpu:acc %_index:16b1cursor
bitset $2 %_index:action
movw %_index:16b1window %_cpu:acc
movw %_cpu:acc %62
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:length> BitAnd <program.Value const:127>>
straw $3
andw $127
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:TEMP-0> Mult <program.Value const:7>>
# OPTIMISED OUT (STACK_READ): straw $6
mulw $7
# OPTIMISED OUT (STACK_WRITE): stwaw $7
# BAssign:<program.BAssign <program.Value name:TEMP-2> = <program.Value name:TEMP-1> Add <program.Value const:1>>
# OPTIMISED OUT (STACK_READ): straw $7
addw $1
# OPTIMISED OUT (STACK_WRITE): stwaw $8
# Ed.WriteModuleRegister16Bit:<program.Call name:Ed.WriteModuleRegister16Bit with args:[<program.Value const:6>, <program.Value const:4>, <program.Value name:TEMP-2>]>
# OPTIMISED OUT (STACK_READ): straw $8
movw %_cpu:acc %64
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:length> RShift <program.Value const:6>>
straw $3
shrw $6
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:6>, <program.Value const:1>, <program.Value name:TEMP-0>]>
# OPTIMISED OUT (STACK_READ): straw $6
conv
movb %_cpu:acc %61
# UAssign:<program.UAssign <program.Value name:t> = UAdd <program.Value const:0>>
movw $0 %_cpu:acc
stwaw $5
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:11>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %b1
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:1>, <program.Value const:1>, <program.Value const:0>]>
movb $0 %11
# CTRL_MARKER:<program.ControlMarker marker:0 While start>
:_Control_0_start
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:t> Lt <program.Value const:5>>
straw $5
cmpw $5
brle :_int_0004
movw $1 %_cpu:acc
bra :_int_0005
:_int_0004
movw $0 %_cpu:acc
:_int_0005
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# LOOP_CTRL:<program.LoopControl 0, name:While, test:<program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $6
brz :_Control_0_else
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:t> Add <program.Value const:1>>
straw $5
addw $1
# OPTIMISED OUT (STACK_WRITE): stwaw $6
# UAssign:<program.UAssign <program.Value name:t> = UAdd <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $6
stwaw $5
# CTRL_MARKER:<program.ControlMarker marker:0 While end>
bra :_Control_0_start
:_Control_0_else
:_Control_0_end
ret
:_end_playTone
stop
END MAIN
FINISH
