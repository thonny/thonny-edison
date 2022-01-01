
#-------------Setup----------------

import Ed

Ed.EdisonVersion = Ed.V2

Ed.DistanceUnits = Ed.CM
Ed.Tempo = Ed.TEMPO_MEDIUM

#--------Your code below-----------

#loop forever
while True:
	if Ed.ReadLeftLightLevel()>Ed.ReadRightLightLevel():
		#If the left light level is higher, drive to the left
		Ed.Drive(Ed.FORWARD_LEFT, Ed.SPEED_4, Ed.DISTANCE_UNLIMITED)
	else:
		#otherwise, the light is on the right so drive to the right
		Ed.Drive(Ed.FORWARD_RIGHT, Ed.SPEED_4, Ed.DISTANCE_UNLIMITED)

#To use this code with Edison Version 1:
#change the version in the setup to Ed.EdisonVersion = Ed.V1
#change Ed.DistanceUnits = Ed.CM to Ed.DistanceUnits = Ed.TIME
