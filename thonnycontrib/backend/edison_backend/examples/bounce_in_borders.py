# -------------Setup----------------

import Ed

Ed.EdisonVersion = Ed.V2

Ed.DistanceUnits = Ed.CM
Ed.Tempo = Ed.TEMPO_MEDIUM

# --------Your code below-----------

# turn on line tracker
Ed.LineTrackerLed(Ed.ON)

# loop forever
while True:
    # start driving forwards
    Ed.Drive(Ed.FORWARD, Ed.SPEED_5, Ed.DISTANCE_UNLIMITED)
    # while Edison is on a white surface continue forwards
    while Ed.ReadLineState() == Ed.LINE_ON_WHITE:
        pass
    # when Edison is not on a white surface back up and turn around
    Ed.Drive(Ed.BACKWARD, Ed.SPEED_5, 2)
    Ed.Drive(Ed.SPIN_LEFT, Ed.SPIN_LEFT, 180)

# To use this code with Edison Version 1:
# change the version in the setup to Ed.EdisonVersion = Ed.V1
# change Ed.DistanceUnits = Ed.CM to Ed.DistanceUnits = Ed.TIME
# change the duration for backwards drive and turn to a larger value
