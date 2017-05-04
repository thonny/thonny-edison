
#-------------Setup----------------

import Ed

Ed.EdisonVersion = Ed.V2

Ed.DistanceUnits = Ed.CM
Ed.Tempo = Ed.TEMPO_MEDIUM

#--------Your code below-----------
#set the funtions Edison runs when obstacles are detected
Ed.RegisterEventHandler(Ed.EVENT_OBSTACLE_AHEAD, 'detectForward')
Ed.RegisterEventHandler(Ed.EVENT_OBSTACLE_LEFT, 'detectLeft')
Ed.RegisterEventHandler(Ed.EVENT_OBSTACLE_RIGHT, 'detectRight')

#turn on the line tracker and the obstacle detection
Ed.LineTrackerLed(Ed.ON)
Ed.ObstacleDetectionBeam(Ed.ON)

#loop forever
while True:
    #start driving forwards
    Ed.Drive(Ed.FORWARD, Ed.SPEED_5, Ed.DISTANCE_UNLIMITED)
    #while Edison is on a white surface continue forwards
    while Ed.ReadLineState()==Ed.LINE_ON_WHITE:
        pass
    #when Edison is not on a white surface back up and turn around
    Ed.Drive(Ed.BACKWARD, Ed.SPEED_5, 4)
    Ed.Drive(Ed.SPIN_LEFT, Ed.SPIN_LEFT, 180)
    
    
#function called when Edison detects an object ahead
def detectForward():
    #play a beep and CHARGE!!!!!!
    Ed.PlayBeep()
    Ed.Drive(Ed.FORWARD, Ed.SPEED_10, Ed.DISTANCE_UNLIMITED)
    
#function called when Edison detects an object to the left
def detectLeft():
    #turn a little to the left and continue forwards
    Ed.LeftLed(Ed.ON)
    Ed.Drive(Ed.FORWARD_LEFT, Ed.SPEED_10, 30)
    Ed.Drive(Ed.FORWARD, Ed.SPEED_5, Ed.DISTANCE_UNLIMITED)
    Ed.LeftLed(Ed.OFF)
    
#function called when Edison detects an object to the left
def detectRight():
    #turn a little to the right and continue forwards
    Ed.RightLed(Ed.ON)
    Ed.Drive(Ed.FORWARD_RIGHT, Ed.SPEED_10, 30)
    Ed.Drive(Ed.FORWARD, Ed.SPEED_5, Ed.DISTANCE_UNLIMITED)
    Ed.RightLed(Ed.OFF)
    
#To use this code with Edison Version 1:
#change the version in the setup to Ed.EdisonVersion = Ed.V1
#change Ed.DistanceUnits = Ed.CM to Ed.DistanceUnits = Ed.TIME
#change the duration for backwards drive and drives in functions to a larger value