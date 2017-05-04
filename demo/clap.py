
#-------------Setup----------------

import Ed

Ed.EdisonVersion = Ed.V2

Ed.DistanceUnits = Ed.CM
Ed.Tempo = Ed.TEMPO_MEDIUM

#--------Your code below-----------

while True:
    #wait for a clap to be detected
    waitClap()
    #turn on LED to indicate a detection
    Ed.RightLed(Ed.ON)
    #wait a short amount of time so that the same clap is not detected twice
    Ed.TimeWait(100, Ed.TIME_MILLISECONDS)
    #clear the clap detection, so that the same clap is not detected twice
    Ed.ReadClapSensor()
    #wait a short amount of time to ensure the second clap has time to be detected
    Ed.TimeWait(250, Ed.TIME_MILLISECONDS)
    #test to see if a second clap has occured
    if Ed.ReadClapSensor() == Ed.CLAP_DETECTED:
        #A second clap has been found! turn on the other LED and drive forwards
        Ed.LeftLed(Ed.ON)
        Ed.Drive(Ed.FORWARD, Ed.SPEED_10, 15)
    else:
        #only one clap detected. spin to the right
        Ed.Drive(Ed.SPIN_RIGHT, Ed.SPEED_10, 90)
    # wait a short time and clears the clap detection before looping
    Ed.TimeWait(250, Ed.TIME_MILLISECONDS)
    Ed.RightLed(Ed.OFF)
    Ed.LeftLed(Ed.OFF)
    Ed.ReadClapSensor()




def waitClap():
    #loop around, waiting for a clap to be detected
    while Ed.ReadClapSensor() != Ed.CLAP_DETECTED:
        pass

#To use this code with Edison Version 1:
#change the version in the setup to Ed.EdisonVersion = Ed.V2
#change Ed.DistanceUnits = Ed.CM to Ed.DistanceUnits = Ed.TIME