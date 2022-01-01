# -------------Setup----------------

import Ed

Ed.EdisonVersion = Ed.V2

Ed.DistanceUnits = Ed.TIME
Ed.Tempo = Ed.TEMPO_MEDIUM

# --------Your code below-----------


while True:
    Ed.PlayBeep()
    Ed.LeftLed(Ed.OFF)
    Ed.RightLed(Ed.ON)
    Ed.Drive(Ed.SPIN_RIGHT, 5, 350)
    Ed.TimeWait(20, Ed.TIME_MILLISECONDS)
    Ed.PlayBeep()
    Ed.LeftLed(Ed.ON)
    Ed.RightLed(Ed.OFF)
    Ed.Drive(Ed.SPIN_LEFT, 5, 350)
    Ed.TimeWait(20, Ed.TIME_MILLISECONDS)
