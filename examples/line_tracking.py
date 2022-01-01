
#-------------Setup----------------

import Ed

Ed.EdisonVersion = Ed.V2

Ed.DistanceUnits = Ed.CM
Ed.Tempo = Ed.TEMPO_MEDIUM

#--------Your code below-----------

Ed.LineTrackerLed(Ed.ON)

while True:
	if Ed.ReadLineState()==Ed.LINE_ON_WHITE:
		Ed.Drive(Ed.FORWARD_RIGHT, Ed.SPEED_1, Ed.DISTANCE_UNLIMITED)
	else:
		Ed.Drive(Ed.FORWARD_LEFT, Ed.SPEED_1, Ed.DISTANCE_UNLIMITED)
