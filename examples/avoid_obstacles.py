# -------------Setup----------------

import Ed

Ed.EdisonVersion = Ed.V2

Ed.DistanceUnits = Ed.CM
Ed.Tempo = Ed.TEMPO_MEDIUM

# --------Your code below-----------

# turn on obstacle detection
Ed.ObstacleDetectionBeam(Ed.ON)
# set up veriables
SideTurn = 0
obstacle = 0

# loop forever
while True:
    # start Edison driving, without a duration, so Edison is moving while checking for obstacles
    Ed.Drive(Ed.FORWARD, Ed.SPEED_5, Ed.DISTANCE_UNLIMITED)
    # read obstacle detection state into a variable
    obstacle = Ed.ReadObstacleDetection()
    # check if any obstacle has been detected
    if obstacle > Ed.OBSTACLE_NONE:
        # turn on both LEDs and back up
        Ed.LeftLed(Ed.ON)
        Ed.RightLed(Ed.ON)
        Ed.PlayBeep()
        Ed.Drive(Ed.BACKWARD, Ed.SPEED_5, 3)
        # look at where the obstacle is and turn away from it (if obstacle ahead turn a random direction)
        if obstacle == Ed.OBSTACLE_LEFT:
            Ed.Drive(Ed.SPIN_RIGHT, Ed.SPEED_5, 90)
        elif obstacle == Ed.OBSTACLE_RIGHT:
            Ed.Drive(Ed.SPIN_LEFT, Ed.SPEED_5, 90)
        elif obstacle == Ed.OBSTACLE_AHEAD:
            if SideTurn == 1:
                Ed.Drive(Ed.SPIN_RIGHT, Ed.SPEED_5, 90)
            else:
                Ed.Drive(Ed.SPIN_LEFT, Ed.SPEED_5, 90)
    # after the obstacle has been avoided turn the LEDs off
    Ed.LeftLed(Ed.OFF)
    Ed.RightLed(Ed.OFF)
    # change the direction varible, when no obstacle is being detected, this value changes rapidly, giving a sudo random direction when used
    if SideTurn == 1:
        SideTurn = 0
    else:
        SideTurn = 1
