# http://api.edwareapp.com/help?app=edpy

ON = 1
OFF = 0

V1 = 1
V2 = 2

NOTE_A_6 = 18181        # 1760 Hz 18181 count
NOTE_B_SHARP_6 = 17167  # 1864 Hz 17167 count
NOTE_B_6 = 16202        # 1975 Hz 16202 count
NOTE_C_7 = 15289        # 2093 Hz 15289 count
NOTE_D_SHARP_7 = 14433  # 2217 Hz 14433 count
NOTE_D_7 = 13622        # 2349 Hz 13622 count
NOTE_E_SHARP_7 = 12856  # 2489 Hz 12856 count
NOTE_E_7 = 12135        # 2637 Hz 12135 count
NOTE_F_7 = 11457        # 2793 Hz 11457 count
NOTE_G_SHARP_7 = 10814  # 2959 Hz 10814 count
NOTE_G_7 = 10207        # 3135 Hz 10207 count
NOTE_A_SHARP_7 = 9632   # 3322 Hz 9632 count
NOTE_A_7 = 9090         # 3520 Hz 9090 count
NOTE_B_SHARP_7 = 8581   # 3729 Hz 8581 count
NOTE_B_7 = 8099         # 3951 Hz 8099 count
NOTE_C_8 = 7644         # 4186 Hz 7644 count
NOTE_REST = 0

# In milliseconds using a whole note as 2 second
NOTE_SIXTEENTH = 125
NOTE_EIGHT =     250
NOTE_QUARTER =   500
NOTE_HALF =      1000
NOTE_WHOLE =     2000

TEMPO_VERY_SLOW = 1000
TEMPO_SLOW =      500
TEMPO_MEDIUM =    250
TEMPO_FAST =      70
TEMPO_VERY_FAST = 1


# Motor directions
STOP = 0

# with distance
FORWARD = 1
BACKWARD = 2

# with degrees
FORWARD_RIGHT = 3
BACKWARD_RIGHT = 4
FORWARD_LEFT = 5
BACKWARD_LEFT = 6

DIR_SPIN_START = 7

SPIN_RIGHT = 7
SPIN_LEFT = 8

SPEED_FULL = 0
SPEED_1 = 1
SPEED_2 = 2
SPEED_3 = 3
SPEED_4 = 4
SPEED_5 = 5
SPEED_6 = 6
SPEED_7 = 7
SPEED_8 = 8
SPEED_9 = 9
SPEED_10 = 10

DISTANCE_UNLIMITED = 0

MOTOR_LEFT =     0x00
MOTOR_RIGHT =    0x01

OBSTACLE_NONE =     0x00
OBSTACLE_DETECTED = 0x40
OBSTACLE_LEFT =     0x20
OBSTACLE_AHEAD =    0x10
OBSTACLE_RIGHT =    0x08
OBSTACLE_MASK =     0x78
OBSTACLE_OTHER_MASK = 0x07

LINE_ON_BLACK =      0x01
LINE_ON_WHITE =      0x00
LINE_MASK =          0x01
LINE_CHANGE_MASK =   0x02
LINE_CHANGE_BIT =    0x01
LINE_CHANGE_MASK =   0x02

KEYPAD_NONE =        0x00
KEYPAD_TRIANGLE =    0x01
KEYPAD_ROUND =       0x04
KEYPAD_MASK =        0x0f

CLAP_NOT_DETECTED =  0x00
CLAP_DETECTED =      0x04
CLAP_MASK =          0x04
DRIVE_STRAINED =     0x01
DRIVE_NO_STRAIN =    0x00
MUSIC_FINISHED =     0x01
MUSIC_NOT_FINISHED = 0x00
TUNE_NO_ERROR =      0x00
TUNE_ERROR =         0x01

REMOTE_CODE_0 = 0
REMOTE_CODE_1 = 1
REMOTE_CODE_2 = 2
REMOTE_CODE_3 = 3
REMOTE_CODE_4 = 4
REMOTE_CODE_5 = 5
REMOTE_CODE_6 = 6
REMOTE_CODE_7 = 7

REMOTE_CODE_NONE = 255

EVENT_TIMER_FINISHED = 0
EVENT_REMOTE_CODE = 1
EVENT_IR_DATA = 2
EVENT_CLAP_DETECTED = 3
EVENT_OBSTACLE_ANY = 4
EVENT_OBSTACLE_LEFT = 5
EVENT_OBSTACLE_RIGHT = 6
EVENT_OBSTACLE_AHEAD = 7
EVENT_DRIVE_STRAIN = 8
EVENT_KEYPAD_TRIANGLE = 9
EVENT_KEYPAD_ROUND = 10
EVENT_LINE_TRACKER_ON_WHITE = 11
EVENT_LINE_TRACKER_ON_BLACK = 12
EVENT_LINE_TRACKER_SURFACE_CHANGE = 13
EVENT_TUNE_FINISHED = 14

EVENT_LAST_EVENT = 14

CM =     0x00
INCH =   0x01
TIME =   0x02

TIME_SECONDS =       0x00
TIME_MILLISECONDS =  0x01

Tempo = TEMPO_MEDIUM
DistanceUnits = None
EdisonVersion = None   

def _explain():
    raise RuntimeError("\n\nYou can't simply run Edison program like this.\n"
                       + "Use 'Tools → Send current script to Edison' instead!")

def List(size, initialList=None):
    """Parameters:
~~~~~~~~~~~

***Size***

Positive integer - sets the number of integers in the new list.

Maximum size is 250 integers.

****\ *Initial List***

A python style list e.g. [1,2,3] - sets the initial value of the
integers in the new Ed.List.

**

Returns:
~~~~~~~~

N/A

Explanation:
~~~~~~~~~~~~

| Creates a list of Edison variables.

Examples:
~~~~~~~~~

Create an empty list and fill with zeros.

::

    #--------Your code below-----------
    zeros=Ed.List(5)
    for x in range(5):
        zeros[x]=0

Create a new list with pre-filled values.

::

    #--------Your code below-----------
    example=Ed.List(5,[1,2,3,4,5])

Watch out for:
~~~~~~~~~~~~~~

The maximum list size is 250.

Brand new elements cannot be added to the end of the list. The list is a
fixed size.

Python lists are "0 index" lists, meaning the first element in the list
is at index 0. For example using the pre-filled list from the above
example, the following code would flash Edison's LED once.

::

    while example[0]!=0:
        Ed.LeftLed(Ed.ON)
        Ed.TimeWait(500, Ed.TIME_MILLISECONDS)
        Ed.LeftLed(Ed.OFF)
        Ed.TimeWait(500, Ed.TIME_MILLISECONDS)
        example[0]=example[0]-1

"""
    return _explain()

def LeftLed(state):
    """Parameters:
~~~~~~~~~~~

***state***

-  Ed.ON – LED turns on
-  Ed.OFF – LED turns off

Returns:
~~~~~~~~

N/A

Explanation:
~~~~~~~~~~~~

Turns Edison’s left LED on or off.

Examples:
~~~~~~~~~

Quick flash.

::

    #--------Your code below-----------
    Ed.LeftLed(Ed.ON)
    Ed.TimeWait(500, Ed.TIME_MILLISECONDS)
    Ed.LeftLed(Ed.OFF)
    Ed.TimeWait(500, Ed.TIME_MILLISECONDS)

LED on while driving.

::

    #--------Your code below-----------
    Ed.LeftLed(Ed.ON)
    Ed.Drive(Ed.FORWARD, Ed.SPEED_5, 10)
    Ed.LeftLed(Ed.OFF)

Watch out for:
~~~~~~~~~~~~~~

If used to turn Edison's LED on, another function call is needed later
in the code to turn Edison's LED off.



"""
    _explain()

def RightLed(state):
    """Parameters:
~~~~~~~~~~~

***State***

-  Ed.ON – LED turns on
-  Ed.OFF – LED turns off

Returns:
~~~~~~~~

N/A

Explanation:
~~~~~~~~~~~~

Turns Edison’s Right LED on or off.

Examples:
~~~~~~~~~

Quick flash.

::

    #--------Your code below-----------
    Ed.RightLed(Ed.ON)
    Ed.TimeWait(500, Ed.TIME_MILLISECONDS)
    Ed.RightLed(Ed.OFF)
    Ed.TimeWait(500, Ed.TIME_MILLISECONDS)

LED on while driving.

::

    #--------Your code below-----------
    Ed.RightLed(Ed.ON)
    Ed.Drive(Ed.FORWARD, Ed.SPEED_5, 10)
    Ed.RightLed(Ed.OFF) 

` <https://meetedison.com/>`__

Watch out for:
~~~~~~~~~~~~~~

| If used to turn Edison's LED on, another function call is needed later
  in the code to turn Edison's LED off.

****

"""
    _explain()

def ObstacleDetectionBeam(state):
    """Parameters:
~~~~~~~~~~~

***state***

-  Ed.ON – Obstacle Detection functions are enabled.
-  Ed.OFF – Obstacle Detection functions are disabled.

Returns:
~~~~~~~~

N/A

Explanation:
~~~~~~~~~~~~

Makes Edison start or stop looking for obstacles.

Examples:
~~~~~~~~~

Turn on the obstacle detection beam and beep at obstacles.

::

    #--------Your code below-----------
    Ed.ObstacleDetectionBeam(Ed.ON)

    while True:
        if Ed.ReadObstacleDetection()>Ed.OBSTACLE_NONE:
            Ed.PlayBeep()

Watch out for:
~~~~~~~~~~~~~~

The obstacle detection beam needs to be turned on to detect an obstacle,
but this function is not used to detect obstacles, use
Ed.ReadObstacleDetection() to have Edison react to obstacles.

Edison's obstacle detection and IR messaging functions, use the same IR
LED's and IR receiver so Edison cannot send or receive messages from
other Edisons if the obstacle detection beam is turned on.

****

"""
    _explain()

def LineTrackerLed(state):
    """Parameters:
~~~~~~~~~~~

***state***

-  Ed.ON – LED turns on
-  Ed.OFF – LED turns off

Returns:
~~~~~~~~

N/A

Explanation:
~~~~~~~~~~~~

Turns Edison’s line tracker LED on or off. This is required to use other
line tracking functions.

Examples:
~~~~~~~~~

Turn on the line tracking LED and beep when a black surface is detected.

::

    #--------Your code below-----------
    Ed.LineTrackerLed(Ed.ON)


    while True:
        if Ed.ReadLineState()==Ed.LINE_ON_BLACK:
            Ed.PlayBeep() 

Watch out for:
~~~~~~~~~~~~~~

When Edison turns on the line tracking LED a reading from the line
tracking sensor is taken. This first reading is set to be a white
surface and the Ed.ReadLineState() function uses this as a baseline. If
the line tracking LED is turned on over a black line, this will cause an
error where Edison cannot find something which reflects less light, and
will therefore never return the LINE\_ON\_BLACK condition.

****

"""
    _explain()

def SendIRData(Byte):
    """Parameters:
~~~~~~~~~~~

***Byte***

an integer between 0-255 to send to all nearby Edisons,

Returns:
~~~~~~~~

N/A

Explanation:
~~~~~~~~~~~~

Sends one byte of data to another Edison via infrared.

Examples:
~~~~~~~~~

Send a simple value.

::

    #--------Your code below-----------
    Ed.SendIRData(10)

Send line tracking data.

::

    #--------Your code below-----------
    Ed.LineTrackerLed(Ed.ON)

    lineState = Ed.ReadLineState()
    Ed.SendIRData(lineState)

Watch out for:
~~~~~~~~~~~~~~

| Only 8-bit variables (range of 0-255) can be sent. EdPy uses 16-bit
  variables, as such this function ignores the top 8 bits of any input.

| 

****

"""
    _explain()

def RegisterEventHandler(event, function):
    """Parameters:
~~~~~~~~~~~

***state***

-  Ed.EVENT\_TIMER\_FINISHED - Calls the function when the countdown
   timer finishes.

-  Ed.EVENT\_REMOTE\_CODE - Calls the function when Edison receives a
   remote code.

-  Ed.EVENT\_IR\_DATA - Calls the function when Edison receives code
   from another Edison.

-  Ed.EVENT\_CLAP\_DETECTED - Calls the function when Edison detects a
   clap.

-  Ed.EVENT\_OBSTACLE\_ANY - Calls the function when Edison sees any
   obstacle.

-  Ed.EVENT\_OBSTACLE\_LEFT - Calls the function when Edison sees an
   obstacle to the left.

-  Ed.EVENT\_OBSTACLE\_RIGHT - Calls the function when Edison sees an
   obstacle to the right.

-  Ed.EVENT\_OBSTACLE\_AHEAD - Calls the function when Edison sees an
   obstacle straight ahead.

-  Ed.EVENT\_DRIVE\_STRAIN - Calls the function when Edison detect
   strain on the drive.

-  Ed.EVENT\_KEYPAD\_TRIANGLE - Calls the function when Edison detects a
   triangle button press.

-  Ed.EVENT\_KEYPAD\_ROUND - Calls the function when Edison detects a
   round button press.

-  Ed.EVENT\_LINE\_TRACKER\_ON\_WHITE - Calls the function when Edison
   detects a white surface under the line tracker.

-  Ed.EVENT\_LINE\_TRACKER\_ON\_BLACK - Calls the function when Edison
   detects a black surface under the line tracker.

-  Ed.EVENT\_LINE\_TRACKER\_SURFACE\_CHANGE - Calls the function when
   Edison detects a surface change under the line tracker.

-  Ed.EVENT\_TUNE\_FINISHED - Calls the function when Edison finishes
   playing a tune.

***function***

the string name of a user created function to be called when an event
occurs.

Returns:
~~~~~~~~

N/A

Explanation:
~~~~~~~~~~~~

Causes Edison to call a function when a given event happens. Setting
this function to be an "Event Handler".

Examples:
~~~~~~~~~

Flash LED and beep when an obstacle is detected.

::

    #--------Your code below-----------
    Ed.RegisterEventHandler(Ed.EVENT_OBSTACLE_ANY, "whenObsBeep")

    while True:
        Ed.LeftLed(Ed.ON)
        Ed.TimeWait(500, Ed.TIME_MILLISECONDS)
        Ed.LeftLed(Ed.OFF)
        Ed.TimeWait(500, Ed.TIME_MILLISECONDS)

    def whenObsBeep():
        Ed.PlayBeep()

Watch out for:
~~~~~~~~~~~~~~

Event handlers act as an interrupt, which means when the event occurs,
the main program is paused while the given function is run.

| 

****

"""
    _explain()

def PlayBeep():
    """Parameters:
~~~~~~~~~~~

N/A

Returns:
~~~~~~~~

N/A

Explanation:
~~~~~~~~~~~~

Sounds a single beep, Frequency: 3.5KHz, Duration: 50mS (0.05 Seconds).

Examples:
~~~~~~~~~

Play a beep.

::

    #--------Your code below-----------
    Ed.PlayBeep()

Watch out for:
~~~~~~~~~~~~~~

All of Edison's sounds occur in the background, as such, Edison moves
onto the next line of code as soon as the sound starts. To make Edison
wait for the sound to finish use the Ed.ReadMusicEnd() function in a
loop.

****

"""
    _explain()

def PlayMyBeep(pulses):
    """Parameters:
~~~~~~~~~~~

***pulse*\ *s***

The number of clock pulses Edison will power the speaker for. Changing
this number causes a change in the frequency of the sound played. To
work out the frequency that will be played use the formula pulses =
32000000/frequency.

Returns:
~~~~~~~~

N/A

Explanation:
~~~~~~~~~~~~

Sounds a single beep with a given pulse length, Duration: 50mS (0.05
Seconds).

Examples:
~~~~~~~~~

play a beep at 1Khz(32000 pulses).

::

    #--------Your code below-----------
    Ed.PlayMyBeep(32000)

Watch Out For:
~~~~~~~~~~~~~~

All of Edison's sounds occur in the background, as such, Edison moves
onto the next line of code as soon as the sound starts. To make Edison
wait for the sound to finish use the Ed.ReadMusicEnd() function in a
loop.

The largest number Edison can use is 32767, which means Edison cannot
handle the number 32000000 which is required to convert frequency to a
number of pulses. Therefore you will need to calculate the number of
pulses you want to play before programming Edison and add them as
numbers to your program.

****

"""
    _explain()

def PlayTune(Tune):
    """Parameters:
~~~~~~~~~~~

***Tune***

Takes in an Edison tune, use the Ed.TuneString() function to create new
a new tune.

A tune string looks like this: "ndndndndndnd...ndz" where n is a note
from the notes table, and d is duration from the duration table.

**Duration**

1 - whole note

2 - half note

4 - quarter note

8 - eight note

6 - sixteenth note

| **Notes**

m - A, sixth octave

M - A#

n - B

c - C, seventh octave

C - C#

d - D

D - D#

e - E

f - F

F - F#

g - G

G - G#

a - A

A - A#

b - B

o - C, eighth octave

**Other**

R - rest

z - end of tune

******

Returns:
~~~~~~~~

N/A

Explanation:
~~~~~~~~~~~~

Plays musical notes through the speaker. This is done by passing the
function in a string of notes in an Edison tune using the tables above
as a reference. You can change the speed you tune plays by changing the
Ed.Tempo in the setup.

Examples:
~~~~~~~~~

Play a simple tune

::

    #--------Your code below-----------

    simple = Ed.TuneString(25, "d4e4f4e4d4c4n2d4e4f4e4d1z")


    Ed.PlayTune(simple)
    while Ed.ReadMusicEnd()==Ed.MUSIC_NOT_FINISHED:
        pass

Watch out for:
~~~~~~~~~~~~~~

All tunes need to end with a "z" character to end correctly.

| 

| All of Edison's sounds occur in the back ground, as such, Edison moves
  onto the next line of code as soon as the sound starts. To make Edison
  wait for the sound to finish use the Ed.ReadMusicEnd() function in a
  loop.

| 

You can change the speed you tune plays by changing the Ed.Tempo in the
setup.

****

****

"""
    _explain()

def TuneString(size, initialTune=None):
    """Parameters:
~~~~~~~~~~~

***Size***

positive integer - sets the number of characters in the new string.

Maximum size is 250 characters.

***Initial List***

A python style string e.g. "a4g2z" - sets the initial value of the
integers in the new Ed.List.

A tune string looks like this: "ndndndndndnd...ndz" where n is a note
from the notes table, d is duration from the duration table and z is the
end of string character.

**Duration**

1 - whole note

2 - half note

4 - quarter note

8 - eight note

6 - sixteenth note

| **Notes**

m - A, sixth octave

M - A#

n - B

c - C, seventh octave

C - C#

d - D

D - D#

e - E

f - F

F - F#

g - G

G - G#

a - A

A - A#

b - B

o - C, eighth octave

**Other**

R - rest

z - end of the tune

| 

**

Returns:
~~~~~~~~

N/A

Explanation:
~~~~~~~~~~~~

| Creates a new tune string. You can change the speed you tune plays by
  changing the Ed.Tempo in the setup.

Examples:
~~~~~~~~~

Play a simple tune

::

    #--------Your code below-----------

    simple = Ed.TuneString(25, "d4e4f4e4d4c4n2d4e4f4e4d1z")


    Ed.PlayTune(simple)
    while Ed.ReadMusicEnd()==Ed.MUSIC_NOT_FINISHED:
        pass

Watch out for:
~~~~~~~~~~~~~~

The maximum tune size is 250 characters.

All tunes need to end with a "z" character to end correctly.

All of Edison's sounds occur in the background, as such, Edison moves
onto the next line of code as soon as the sound starts. To make Edison
wait for the sound to finish use the Ed.ReadMusicEnd() function in a
loop.

You can change the speed you tune plays by changing the Ed.Tempo in the
setup.

"""
    return _explain()

def Drive(direction,speed,distance):
    """Parameters:
~~~~~~~~~~~

***direction***

-  Ed.FORWARD - Edison drives forwards.
-  Ed.BACKWARD - Edison drives backwards.
-  Ed.FORWARD\_RIGHT - Edison uses one wheel to turn forwards right.
-  Ed.BACKWARD\_RIGHT - Edison uses one wheel to turn backwards right.
-  Ed.FORWARD\_LEFT - Edison uses one wheel to turn forwards left.
-  Ed.BACKWARD\_LEFT - Edison uses one wheel to turn backwards left.
-  Ed.SPIN\_RIGHT - Edison spins right on the spot.
-  Ed.SPIN\_LEFT - Edison spins left on the spot.
-  Ed.STOP - Stops Edison immediately.

***speed***

-  *speed* - An integer number between 1-10.
-  Ed.SPEED\_1 - PWM controlled speed 1.
-  Ed.SPEED\_2 - PWM controlled speed 2.
-  Ed.SPEED\_3 - PWM controlled speed 3.
-  Ed.SPEED\_4 - PWM controlled speed 4.
-  Ed.SPEED\_5 - PWM controlled speed 5.
-  Ed.SPEED\_6 - PWM controlled speed 6.
-  Ed.SPEED\_7 - PWM controlled speed 7.
-  Ed.SPEED\_8 - PWM controlled speed 8.
-  Ed.SPEED\_9 - PWM controlled speed 9.
-  Ed.SPEED\_10 - PWM controlled speed 10.
-  Ed.SPEED\_FULL - Full power to the motors (may not drive perfectly
   straight).

***distance***

An integer number for distance. The length of travel is set by this
number and the value set in Ed.DistanceUnits.

Edison will drive for the full distance supplied before moving on to the
next line of code.

-  Ed.DistanceUnits = Ed.CM - distance in centimetres (default for
   V2.0).
-  Ed.DistanceUnits = Ed.INCH - distance in inches .
-  Ed.DistanceUnits = Ed.TIME - distance in milliseconds(default for
   V1).

Maximum value 32767.

| When Edison is turning and Ed.DistanceUnits is set to CM or INCH,
  distance becomes the number of degrees to turn with a maximum value of
  360.

OR

-  Ed.DISTANCE\_UNLIMITED - turns on Edison's motors and moves on with
   the code (a stop will be needed later in the code).

Returns:
~~~~~~~~

N/A

Explanation:
~~~~~~~~~~~~

Controls both of Edison's motors to create movement. Can be set to move
for a set distance or time period and will drive the full distance
before moving onto the next line of code.

Examples:
~~~~~~~~~

Drive Edison forward for 3 cm at speed 5 (Edison V2.0 only).

::

    Ed.DistanceUnits = Ed.CM
    Ed.Tempo = Ed.TEMPO_MEDIUM

    #--------Your code below-----------
    Ed.Drive(Ed.FORWARD, Ed.SPEED_5, 3)

| Drive Edison forward for 5" at speed 5 (Edison V2.0 only).

::

    Ed.DistanceUnits = Ed.INCH
    Ed.Tempo = Ed.TEMPO_MEDIUM

    #--------Your code below-----------
    Ed.Drive(Ed.FORWARD, Ed.SPEED_5, 5)

Drive Edison forward for 2000 Milliseconds at speed 7 (2 seconds).

::

    Ed.DistanceUnits = Ed.TIME
    Ed.Tempo = Ed.TEMPO_MEDIUM

    #--------Your code below-----------
    Ed.Drive(Ed.FORWARD, Ed.SPEED_7, 2000)

Spin Edison left 90 degrees at speed 10.

::

    Ed.DistanceUnits = Ed.CM
    Ed.Tempo = Ed.TEMPO_MEDIUM

    #--------Your code below-----------
    Ed.Drive(Ed.SPIN_LEFT, 10, 90)

Set speed and distance with variables.

::

    Ed.DistanceUnits = Ed.CM
    Ed.Tempo = Ed.TEMPO_MEDIUM
    #--------Your code below-----------
    driveSpeed=5
    driveDistance=10

    Ed.Drive(Ed.FORWARD, driveSpeed, driveDistance)

Watch out for:
~~~~~~~~~~~~~~

Distance in CM and INCH is only available for Edison V2.0. Please make
sure that Ed.DistanceUnits = Ed.TIME if you are using an Edison V1.

Ed.DistanceUnits = Ed.TIME sets the distance to milliseconds, to drive
for 2 seconds, a distance of 2000 should be input.

When Edison is turning and Ed.DistanceUnits is set to CM or INCH,
distance becomes the number of degrees to turn with a maximum value of
360. If you put in a value above 360, the code will wrap the value
around and Edison will perform a shorter turn, e.g. an input of 380 will
cause Edison to turn 20 degrees.

Ed.SPEED\_FULL turns Edison's motors up to the maximum value, as such
Edison has no control over the speed and Edison V2.0's will not be able
to use their encoders to correct for driving drift.

Setting distance to 0 makes Edison turn on the motors and move on with
the code, an additional Ed.Drive will be required later in the code to
stop or change the direction of movement.

| 

"""
    _explain()

def DriveLeftMotor(direction, speed, distance):
    """Parameters:
~~~~~~~~~~~

***direction***

-  Ed.FORWARD - Edison's left motor drives forwards.
-  Ed.BACKWARD - Edison's left motor drives backwards.
-  Ed.STOP - Stops Edison's left motor immediately.

***speed***

-  *speed* - An integer number between 1-10.
-  Ed.SPEED\_1 - PWM controlled speed 1.
-  Ed.SPEED\_2 - PWM controlled speed 2.
-  Ed.SPEED\_3 - PWM controlled speed 3.
-  Ed.SPEED\_4 - PWM controlled speed 4.
-  Ed.SPEED\_5 - PWM controlled speed 5.
-  Ed.SPEED\_6 - PWM controlled speed 6.
-  Ed.SPEED\_7 - PWM controlled speed 7.
-  Ed.SPEED\_8 - PWM controlled speed 8.
-  Ed.SPEED\_9 - PWM controlled speed 9.
-  Ed.SPEED\_10 - PWM controlled speed 10.
-  Ed.SPEED\_FULL - Full power to the motor.

***distance***

An integer number for distance. The length of travel is set by this
number and the value set in Ed.DistanceUnits.

Edison will drive for the full distance supplied before moving on to the
next line of code.

-  Ed.DistanceUnits = Ed.CM - distance in centimetres (default for
   V2.0).
-  Ed.DistanceUnits = Ed.INCH - distance in inches .
-  Ed.DistanceUnits = Ed.TIME - distance in milliseconds(default for
   V1).

Maximum value 32767.

OR

-  Ed.DISTANCE\_UNLIMITED - turns on Edison's left motor and moves on
   with the code (a stop will be needed later in the code).

Returns:
~~~~~~~~

N/A

Explanation:
~~~~~~~~~~~~

Controls Edison's left motor to create movement. Can be set to move for
a set distance or time period and will drive the full distance before
moving onto the next line of code.

Examples:
~~~~~~~~~

Drive Edison's left motor forward for 3 cm at speed 5 (Edison V2.0
only).

::

    Ed.DistanceUnits = Ed.CM
    Ed.Tempo = Ed.TEMPO_MEDIUM

    #--------Your code below-----------
    Ed.DriveLeft(Ed.FORWARD, Ed.SPEED_5, 3)

| Drive Edison's left motor forward for 5" at speed 5 (Edison V2.0
  only).

::

    Ed.DistanceUnits = Ed.INCH
    Ed.Tempo = Ed.TEMPO_MEDIUM

    #--------Your code below-----------
    Ed.DriveLeft(Ed.FORWARD, Ed.SPEED_5, 5)

Drive Edison's left motor forward for 2000 Milliseconds at speed 7 (2
seconds).

::

    Ed.DistanceUnits = Ed.TIME
    Ed.Tempo = Ed.TEMPO_MEDIUM

    #--------Your code below-----------
    Ed.DriveLeft(Ed.FORWARD, Ed.SPEED_7, 2000)

Set speed and distance with variables.

::

    Ed.DistanceUnits = Ed.CM
    Ed.Tempo = Ed.TEMPO_MEDIUM
    #--------Your code below-----------
    driveSpeed=5
    driveDistance=10

    Ed.DriveLeft(Ed.FORWARD, driveSpeed, driveDistance)

Watch out for:
~~~~~~~~~~~~~~

Distance in CM and INCH is only available for Edison V2.0. Please make
sure that Ed.DistanceUnits = Ed.TIME if you are using an Edison V1.

Ed.DistanceUnits = Ed.TIME sets the distance to milliseconds, to drive
for 2 seconds, a distance of 2000 should be input.

Setting distance to 0 makes Edison turn on the left motor and move on
with the code, an additional Ed.Drive will be required later in the code
to stop or change the direction of movement.

"""
    _explain()

def DriveRightMotor(direction, speed, distance):
    """Parameters:
~~~~~~~~~~~

***direction***

-  Ed.FORWARD - Edison's right motor drives forwards.
-  Ed.BACKWARD - Edison's right motor drives backwards.
-  Ed.STOP - Stops Edison's right motor immediately.

***speed***

-  *speed* - An integer number between 1-10.
-  Ed.SPEED\_1 - PWM controlled speed 1.
-  Ed.SPEED\_2 - PWM controlled speed 2.
-  Ed.SPEED\_3 - PWM controlled speed 3.
-  Ed.SPEED\_4 - PWM controlled speed 4.
-  Ed.SPEED\_5 - PWM controlled speed 5.
-  Ed.SPEED\_6 - PWM controlled speed 6.
-  Ed.SPEED\_7 - PWM controlled speed 7.
-  Ed.SPEED\_8 - PWM controlled speed 8.
-  Ed.SPEED\_9 - PWM controlled speed 9.
-  Ed.SPEED\_10 - PWM controlled speed 10.
-  Ed.SPEED\_FULL - Full power to the right motor.

***distance***

An integer number for distance. The length of travel is set by this
number and the value set in Ed.DistanceUnits.

Edison will drive for the full distance supplied before moving on to the
next line of code.

-  Ed.DistanceUnits = Ed.CM - distance in centimetres (default for
   V2.0).
-  Ed.DistanceUnits = Ed.INCH - distance in inches.
-  Ed.DistanceUnits = Ed.TIME - distance in milliseconds(default for
   V1).

Maximum value 32767.

OR

-  Ed.DISTANCE\_UNLIMITED - turns on Edison's right motor and moves on
   with the code (a stop will be needed later in the code).

Returns:
~~~~~~~~

N/A

Explanation:
~~~~~~~~~~~~

Controls Edison's right motor to create movement. Can be set to move for
a set distance or time period and will drive the full distance before
moving onto the next line of code.

Examples:
~~~~~~~~~

Drive Edison's right motor forward for 3 cm at speed 5 (Edison V2.0
only).

::

    Ed.DistanceUnits = Ed.CM
    Ed.Tempo = Ed.TEMPO_MEDIUM

    #--------Your code below-----------
    Ed.DriveRight(Ed.FORWARD, Ed.SPEED_5, 3)

| Drive Edison's right motor forward for 5" at speed 5 (Edison V2.0
  only).

::

    Ed.DistanceUnits = Ed.INCH
    Ed.Tempo = Ed.TEMPO_MEDIUM

    #--------Your code below-----------
    Ed.DriveRight(Ed.FORWARD, Ed.SPEED_5, 5)

Drive Edison's right motor forward for 2000 Milliseconds at speed 7 (2
seconds).

::

    Ed.DistanceUnits = Ed.TIME
    Ed.Tempo = Ed.TEMPO_MEDIUM

    #--------Your code below-----------
    Ed.DriveRight(Ed.FORWARD, Ed.SPEED_7, 2000)

Set speed and distance with variables.

::

    Ed.DistanceUnits = Ed.CM
    Ed.Tempo = Ed.TEMPO_MEDIUM
    #--------Your code below-----------
    driveSpeed=5
    driveDistance=10

    Ed.DriveRight(Ed.FORWARD, driveSpeed, driveDistance)

Watch out for:
~~~~~~~~~~~~~~

Distance in CM and INCH is only available for Edison V2.0. Please make
sure that Ed.DistanceUnits = Ed.TIME if you are using an Edison V1.

Ed.DistanceUnits = Ed.TIME sets the distance to milliseconds, to drive
for 2 seconds, a distance of 2000 should be input.

Setting distance to 0 makes Edison turn on the right motor and move on
with the code, an additional Ed.Drive will be required later in the code
to stop or change the direction of movement.

"""
    _explain()

def ReadObstacleDetection():
    """Parameters:
~~~~~~~~~~~

N/A

Returns:
~~~~~~~~

-  Ed.OBSTACLE\_NONE - Edison cannot see an obstacle.
-  Ed.OBSTACLE\_RIGHT- Edison see's an obstacle on the right.
-  Ed.OBSTACLE\_LEFT - Edison see's an obstacle on the left.
-  Ed.OBSTACLE\_AHEAD - Edison see's an obstacle straight ahead.

Explanation:
~~~~~~~~~~~~

Read Edison's obstacle detection state, returns its value and clears it.
Ed.ObstacleDetectionBeam needs to be set to ON for this function to
return any value other than Ed.OBSTACLE\_NONE.

Examples:
~~~~~~~~~

Play a beep when any obstacle is detected.

::

    #--------Your code below-----------
    Ed.ObstacleDetectionBeam(Ed.ON)

    while True:
        if Ed.ReadObstacleDetection()>Ed.OBSTACLE_NONE:
            Ed.PlayBeep()

Drive until an obstacle is detected ahead.

::

    #--------Your code below-----------
    Ed.ObstacleDetectionBeam(Ed.ON)

    Ed.Drive(Ed.FORWARD, 5, Ed.DISTANCE_UNLIMITED)

    while Ed.ReadObstacleDetection() != Ed.OBSTACLE_AHEAD:
        pass
    Ed.Drive(Ed.STOP, 1, 1)

Clear the obstacle detection before waiting for a new obstacle to be
detected.

::

    #--------Your code below-----------
    Ed.ObstacleDetectionBeam(Ed.ON)

    Ed.TimeWait(3, Ed.TIME_SECONDS)

    Ed.ReadObstacleDetection()
    while Ed.ReadObstacleDetection() != Ed.OBSTACLE_AHEAD:
        pass
    Ed.PlayBeep()

Watch out for:
~~~~~~~~~~~~~~

 Ed.ObstacleDetectionBeam needs to be set to ON for this function to
return any value other than Ed.OBSTACLE\_NONE.

When the Obstacle Detection Beam ON Edison is constantly updating the
obstacle detection state, this function will read the state and may read
a detection from before the read function is called in your code.

The read function clears the obstacle detection state.

"""
    return _explain()

def ReadKeypad():
    """Parameters:
~~~~~~~~~~~

N/A

Returns:
~~~~~~~~

-  Ed.KEYPAD\_NONE - none of Edison's buttons have been pressed.
-  Ed.KEYPAD\_TRIANGLE- Edison's triangle button has been pressed.
-  Ed.KEYPAD\_ROUND - Edison's round button has been pressed.

Explanation:
~~~~~~~~~~~~

Read Edison's keypad state, returns its value and clears it. Edison's
keypad state will be set anytime a button is pressed regardless of what
the code is doing at the time.

Examples:
~~~~~~~~~

Play a beep when any button is pressed.

::

    #--------Your code below-----------
    while True:
        if Ed.ReadKeypad() != Ed.KEYPAD_NONE:
            Ed.PlayBeep()

Wait for the triangle button to be pressed.

::

    #--------Your code below-----------
    while if Ed.ReadKeypad() != Ed.KEYPAD_TRIANGLE:
        pass
    Ed.PlayBeep()

Clear the keypad state before waiting for a new button press.

::

    #--------Your code below-----------
    Ed.TimeWait(3, Ed.TIME_SECONDS)

    Ed.ReadKeypad()
    while Ed.ReadKeypad() == Ed.KEYPAD_NONE:
        pass
    Ed.PlayBeep()

Watch out for:
~~~~~~~~~~~~~~

| Edison is constantly updating the keypad state, this function will
  read the state and may read a button press from before the read
  function is called in your code.

The read function clears the keypad state after reading it.

"""
    return _explain()

def ReadClapSensor():
    """Parameters:
~~~~~~~~~~~

N/A

Returns:
~~~~~~~~

-  Ed.CLAP\_NOT\_DETECTED - Edison has not detected a clap.
-  Ed.CLAP\_DETECTED - Edison has detected a clap.

Explanation:
~~~~~~~~~~~~

Read Edison's clap detection state, returns its value and clears it.
Edison's clap detection state will be set anytime a clap is detected
regardless of what the code is doing at the time. Edison's motors cause
"claps" to be detected while in motion.

Examples:
~~~~~~~~~

Flash an LED when a clap is detected.

::

    #--------Your code below-----------
    Ed.ObstacleDetectionBeam(Ed.ON)

    while True:
        if ReadClapSensor()==Ed.CLAP_DETECTED:
            Ed.LeftLed(Ed.ON)
            Ed.TimeWait(50, Ed.TIME_MILLISECONDS)
            Ed.LeftLed(Ed.OFF)
            Ed.TimeWait(50, Ed.TIME_MILLISECONDS)

Detect a clap after a drive.

::

    #--------Your code below-----------
    Ed.Drive(Ed.FORWARD, 5, 10)

    #wait a short time and clear the clap that was detected during the drive
    Ed.TimeWait(350, Ed.TIME_MILLISECONDS)
    ReadClapSensor()

    #wait for a new clap
    while ReadClapSensor() == Ed.CLAP_NOT_DETECTED:
        pass

    Ed.PlayBeep()

Watch out for:
~~~~~~~~~~~~~~

| Edison is constantly updating the clap detection state, this function
  will read the state and may read clap from before the read function is
  called in your code.

The read function clears the keypad state after reading it.

Driving Edison will cause claps to be detected, make sure that you clear
the clap detection state a few milliseconds after the driving has
finished.



"""
    return _explain()

def ReadLineState():
    """Parameters:
~~~~~~~~~~~

N/A

Returns:
~~~~~~~~

-  Ed.LINE\_ON\_BLACK - Edison's line tracker is over a reflective
   surface.
-  Ed.LINE\_ON\_WHITE- Edison's line tracker is over a non-reflective
   surface.

Explanation:
~~~~~~~~~~~~

Reads the current line tracker status, Edison sets the LINE\_ON\_WHITE
status when the line tracking LED is turned on and determines the
LINE\_ON\_BLACK status by looking for a sharp drop off in reflected
light. If Edison is on a black line when the line tracking LED is turned
on Edison will mistakenly reference that value as LINE\_ON\_WHITE and
will be unable to see a sharp drop off causing an error where
LINE\_ON\_BLACK remains unset.

Examples:
~~~~~~~~~

Play a beep when a black surface is detected.

::

    #--------Your code below-----------
    Ed.LineTrackerLed(Ed.ON)

    while True:
        if Ed.ReadLineState() == Ed.LINE_ON_BLACK:
            Ed.PlayBeep()

Watch out for:
~~~~~~~~~~~~~~

Ed.LineTrackerLed needs to be set to ON for this function to return any
value.

When the line tracker LED is ON Edison is constantly updating the line
tracker state, this function will read the current state of the line
tracker.

When the line tracker LED is turned on, Edison reads the current
reflected light level and sets it as the "On White" state. If Edison is
not on a white surface when the line tracker LED is turned on Edison
will be unable to find black surfaces.

"""
    return _explain()

def ReadRemote():
    """Parameters:
~~~~~~~~~~~

N/A

Returns:
~~~~~~~~

-  Ed.REMOTE\_CODE\_NONE - Edison has not received a remote code.
-  REMOTE\_CODE\_0 - Edison has received remote code 0.
-  REMOTE\_CODE\_1 - Edison has received remote code 1.
-  REMOTE\_CODE\_2 - Edison has received remote code 2.
-  REMOTE\_CODE\_3 - Edison has received remote code 3.
-  REMOTE\_CODE\_4 - Edison has received remote code 4.
-  REMOTE\_CODE\_5 - Edison has received remote code 5.
-  REMOTE\_CODE\_6 - Edison has received remote code 6.
-  REMOTE\_CODE\_7 - Edison has received remote code 7.

Explanation:
~~~~~~~~~~~~

Reads the last received remote control and clears the remote control
register.

Examples:
~~~~~~~~~

Play a beep when each remote code is received in sequence.

::

    #--------Your code below-----------
    codes=Ed.List(8)
    codes[0]=Ed.REMOTE_CODE_0
    codes[1]=Ed.REMOTE_CODE_1
    codes[2]=Ed.REMOTE_CODE_2
    codes[3]=Ed.REMOTE_CODE_3
    codes[4]=Ed.REMOTE_CODE_4
    codes[5]=Ed.REMOTE_CODE_5
    codes[6]=Ed.REMOTE_CODE_6
    codes[7]=Ed.REMOTE_CODE_7


    for x in range(8):
        while Ed.ReadRemote() != codes[x]:
            pass
        Ed.PlayBeep()
        Ed.TimeWait(500, Ed.TIME_MILLISECONDS)

Drive forwards while remote code 1 is being received.

::

    #--------Your code below-----------
    while True:
        if Ed.ReadRemote() ==Ed.REMOTE_CODE_1:
            Ed.Drive(Ed.FORWARD, 5, Ed.DISTANCE_UNLIMITED)
            Ed.TimeWait(300, Ed.TIME_MILLISECONDS)
        else:
            Ed.Drive(Ed.STOP, 1, 1)   

Watch out for:
~~~~~~~~~~~~~~

Edison can only react to remote control codes that have been saved into
memory using the bar codes on page 20 of EdBook2.

Receiving remote control codes and obstacle detection use the same IR
receiver, so Ed.ObstacleDetectionBeam needs to be off for a remote code
to be received.

Edison is constantly updating the remote control register, this function
will read the register and may read a remote code from before the read
function is called in your code.

The read function clears the remote control register.

"""
    return _explain()

def ReadIRData():
    """Parameters:
~~~~~~~~~~~

N/A

Returns:
~~~~~~~~

Last received infrared data from another Edison.

Explanation:
~~~~~~~~~~~~

Reads the last received infrared data.

Examples:
~~~~~~~~~

Play a beep when a 10 is received from another Edison.

::

    #--------Your code below-----------
    while True:
        if Ed.ReadIRData()==10:
            Ed.PlayBeep()
            Ed.TimeWait(500, Ed.TIME_MILLISECONDS)

Watch out for:
~~~~~~~~~~~~~~

Receiving data from another Edison and obstacle detection use the same
IR receiver, so Ed.ObstacleDetectionBeam needs to be off for data to be
received.

Edison is constantly updating the data received register, this function
will read the register and may read data from before the read function
is called in your code.

The read function clears the data received register.

"""
    return _explain()

def ReadLeftLightLevel():
    """Parameters:
~~~~~~~~~~~

N/A

Returns:
~~~~~~~~

The current light level of the left light sensor.

Explanation:
~~~~~~~~~~~~

Reads the current light level of the left light sensor.

Examples:
~~~~~~~~~

Play a beep when the left light level is higher then the right light
level.

::

    #--------Your code below-----------
    while True:
        if Ed.ReadLeftLightLevel()>Ed.ReadRightLightLevel():
            Ed.PlayBeep()
            Ed.TimeWait(500, Ed.TIME_MILLISECONDS)

Watch out for:
~~~~~~~~~~~~~~

Edison reads the light level using an analogue to digital converter, so
the returned value can be between 0 and 32767.



"""
    return _explain()

def ReadRightLightLevel():
    """Parameters:
~~~~~~~~~~~

N/A

Returns:
~~~~~~~~

The current light level of the right light sensor.

Explanation:
~~~~~~~~~~~~

Reads the current light level of the right light sensor.

Examples:
~~~~~~~~~

Play a beep when the right light level is higher then the left light
level.

::

    #--------Your code below-----------
    while True:
        if Ed.ReadRightLightLevel()>Ed.ReadLeftLightLevel():
            Ed.PlayBeep()
            Ed.TimeWait(500, Ed.TIME_MILLISECONDS)

Watch out for:
~~~~~~~~~~~~~~

Edison reads the light level using an analogue to digital converter, so
the returned value can be between 0 and 32767.

"""
    return _explain()

def ReadLineTracker():
    """Parameters:
~~~~~~~~~~~

N/A

Returns:
~~~~~~~~

The current light level of the line tracking light sensor.

Explanation:
~~~~~~~~~~~~

Reads the current light level of the line tracking light sensor.

Examples:
~~~~~~~~~

Play a beep when the line tracking light level is drops below a
threshold buffer value.

::

    #--------Your code below-----------
    Ed.LineTrackerLed(Ed.ON)
    white=Ed.ReadLineTracker();
    buffer=150

    while True:
        if Ed.ReadLineTracker()<(white-buffer):
            Ed.PlayBeep()
            Ed.TimeWait(1, Ed.TIME_SECONDS)

Watch out for:
~~~~~~~~~~~~~~

Edison reads the light level using an analogue to digital converter, so
the returned value can be between 0 and 32767.

This function can be used without turning on the Line Tracking LED,
however values returned will be much lower and harder to distinguish. It
is reccommended to turn on the Line Tracking LED before using this read
function.

"""
    return _explain()

def ReadCountDown(units):
    """Parameters:
~~~~~~~~~~~

***Units***

-  Ed.TIME\_MILLISECONDS - Read the number of milliseconds left in the
   countdown timer.
-  Ed.TIME\_SECONDS - Read the number of seconds left in the countdown
   timer.

Returns:
~~~~~~~~

The number of seconds or milliseconds left on the countdown timer.

Explanation:
~~~~~~~~~~~~

Reads the number of seconds/milliseconds left on the countdown timer.

Examples:
~~~~~~~~~

Flash the left LED for 3000 Milliseconds.

::

    Ed.StartCountDown(3100, Ed.TIME_MILLISECONDS);

    while Ed.ReadCountDown(Ed.TIME_MILLISECONDS) > 100:
        Ed.LeftLed(Ed.ON)
        Ed.TimeWait(50, Ed.TIME_MILLISECONDS)
        Ed.LeftLed(Ed.OFF)
        Ed.TimeWait(50, Ed.TIME_MILLISECONDS)

Watch out for:
~~~~~~~~~~~~~~

The timer is NOT a clock so it doesn't tell the time! (Think of it as a
stopwatch).

An important point to note with the timer is that it counts DOWN (NOT
UP).

When reading the timer in Seconds, the read function will return an
integer value so Ed.ReadCountDown(Ed.TIME\_SECONDS) will return 0 if the
time left in the countdown is less than 1 second (i.e. 0.8 seconds)
whereas reading the timer in Milliseconds will read fine (returning 800
for our previous example).

"""
    return _explain()

def ReadMusicEnd():
    """Parameters:
~~~~~~~~~~~

N/A

Returns:
~~~~~~~~

-  Ed.MUSIC\_FINISHED - Edison has finished playing the tune, tone or
   beep
-  MUSIC\_NOT\_FINISHED - Edison is still playing tune, tone or beep

Explanation:
~~~~~~~~~~~~

Reads the current state of the sound being played from Edison's buzzer.

Examples:
~~~~~~~~~

Play a simple tune

::

    #--------Your code below-----------

    simple = Ed.TuneString(25, "d4e4f4e4d4c4n2d4e4f4e4d1z")


    Ed.PlayTune(simple)
    while Ed.ReadMusicEnd()==Ed.MUSIC_NOT_FINISHED:

Watch out for:
~~~~~~~~~~~~~~

All tunes need to end with a "z" character to end correctly.

| All of Edison's sounds occur in the background, as such, Edison moves
  onto the next line of code as soon as the sound starts. To make Edison
  wait for the sound to finish use the Ed.ReadMusicEnd() function in a
  loop.

You can change the speed you tune plays by changing the Ed.Tempo in the
setup.

"""
    return _explain()

def ReadDriveLoad():
    """Parameters:
~~~~~~~~~~~

N/A

Returns:
~~~~~~~~

-  

   DRIVE\_NO\_STRAIN - Edison's wheels are turning correctly.

-  DRIVE\_STRAINED - Edison's wheels are not turning.

Explanation:
~~~~~~~~~~~~

Reads the current state of Edison's drive strain.

Examples:
~~~~~~~~~

Drive until the Edison detects drive strain.

::

    #--------Your code below-----------
    Ed.Drive(Ed.FORWARD, 5, Ed.DISTANCE_UNLIMITED)
    while Ed.ReadDriveLoad()==Ed.DRIVE_NO_STRAIN:
        pass
    Ed.Drive(Ed.STOP, 1, 1)

Watch out for:
~~~~~~~~~~~~~~

when driving both wheels strain on either wheel will trigger the
DRIVE\_STRAINED condition, when driving a single wheel, only strain on
the moving wheel will trigger the DRIVE\_STRAINED condition.

"""
    return _explain()

def ReadDistance(side):
    """Parameters:
~~~~~~~~~~~

***Side***

-  Ed.MOTOR\_LEFT - the number of ticks remaining on the left distance
   register.
-  Ed.MOTOR\_RIGHT- the number of ticks remaining on the right distance
   register.

Returns:
~~~~~~~~

The number of ticks remaining on the left/right distance register.

Explanation:
~~~~~~~~~~~~

Reads the number of ticks remaining on the left/right distance register.

Examples:
~~~~~~~~~

Drive for 40 ticks.

::

    #--------Your code below-----------
    Ed.Drive(Ed.FORWARD, 5, 0)
    Ed.SetDistance(Ed.MOTOR_LEFT, 40)
    Ed.SetDistance(Ed.MOTOR_RIGHT, 40)
    while Ed.ReadDistance(Ed.MOTOR_LEFT)>0:
        pass
            
    Ed.PlayBeep()

Watch out for:
~~~~~~~~~~~~~~

This function is only compatible with Edison V2.0.

Reads values in ticks, a tick is 1.25mm.

"""
    return _explain()

def SetDistance(side, ticks):
    """Parameters:
~~~~~~~~~~~

***Side***

-  Ed.MOTOR\_LEFT - set the number of ticks in the left distance
   register.
-  Ed.MOTOR\_RIGHT- set the number of ticks in the right distance
   register.

***Ticks***

An integer number of ticks to set a distance register too. A tick is
one-quarter revolution of Edison V2.0's encoder wheel and equates to
1.25mm of travel.

Returns:
~~~~~~~~

N/A

Explanation:
~~~~~~~~~~~~

Sets one of Edison V2.0's distance registers, turning an unlimited drive
back into a distance limited drive. Allows access to the distance
registers in ticks, Edison's internal distance measurement.

Examples:
~~~~~~~~~

Drive for 40 ticks.

::

    #--------Your code below-----------
    Ed.Drive(Ed.FORWARD, 5, 0)
    Ed.SetDistance(Ed.MOTOR_LEFT, 40)
    Ed.SetDistance(Ed.MOTOR_RIGHT, 40)
    while Ed.ReadDistance(Ed.MOTOR_LEFT)>0:
        pass
            
    Ed.PlayBeep()

Watch out for:
~~~~~~~~~~~~~~

This function is only compatible with Edison V2.0.

Sets values in ticks, a tick is 1.25mm.

"""
    _explain()

def ResetDistance():
    """Parameters:
~~~~~~~~~~~

N/A

Returns:
~~~~~~~~

N/A

Explanation:
~~~~~~~~~~~~

Resets the number of ticks remaining on the both the left and right
distance registers to zero.

Examples:
~~~~~~~~~

Drive for 40 ticks or until an obstacle is encountered.

::

    #--------Your code below-----------
    Ed.ObstacleDetectionBeam(Ed.ON)

    Ed.Drive(Ed.FORWARD, 5, 0)
    Ed.SetDistance(Ed.MOTOR_LEFT, 40)
    Ed.SetDistance(Ed.MOTOR_RIGHT, 40)

    while Ed.ReadDistance(Ed.MOTOR_LEFT)>0:
        if Ed.ReadObstacleDetection()>Ed.OBSTACLE_NONE:
            Ed.ResetDistance()
            
    Ed.PlayBeep()

Watch out for:
~~~~~~~~~~~~~~

This function is only compatible with Edison V2.0.

Resets values in ticks, a tick is 1.25mm.

"""
    _explain()

