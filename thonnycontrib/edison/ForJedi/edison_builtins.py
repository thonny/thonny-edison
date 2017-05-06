def abs(int):
    """Parameters:
~~~~~~~~~~~

***int***

an integer value between +/- 32767

Returns:
~~~~~~~~

the mathematical absolute value of the input

Explanation:
~~~~~~~~~~~~

Flips the sign of any negative number input, returns a positive number
without change.

Examples:
~~~~~~~~~

Change negative 30 to positive 30 and check

::

    #--------Your code below-----------
    x=-30
    x=abs(x)

    if x==30:
        Ed.PlayBeep();

Watch out for:
~~~~~~~~~~~~~~

Abs() is a native python function, so it does not need the "Ed." prefix

"""

def len(list):
    """Parameters:
~~~~~~~~~~~

***list***

****\ An EdPy list.

Returns:
~~~~~~~~

The number of elements in the EdPy list.

Explanation:
~~~~~~~~~~~~

Returns the maximum number of integers that can be stored in the given
list.

Examples:
~~~~~~~~~

Loop through a created list and beep when a 2 is found.

::

    #--------Your code below-----------

    exampleList = Ed.List(6,[1,2,3,3,2,1])

    listSize=len(exampleList)

    for x in range(listSize)
        if exampleList[x]==2:
            Ed.PlayBeep()
            Ed.TimeWait(500, Ed.TIME_MILLISECONDS)

Watch out for:
~~~~~~~~~~~~~~

len() returns the value you entered as the size of the list when it was
created, even if you have not assigned values to all of the intergers.

"""

def range(limit):
    """Parameters:
~~~~~~~~~~~

***Limit***

the value to count up to

Returns:
~~~~~~~~

the values from 0 to limit in sequence.

Explanation:
~~~~~~~~~~~~

Only valid in "for" loops, to control the number of times the code loops
around.

Produces values of 0 to limit-1 for a for loop.

Examples:
~~~~~~~~~

Loop through a created list and beep when a 2 is found.

::

    #--------Your code below-----------

    exampleList = Ed.List(6,[1,2,3,3,2,1])

    listSize=len(exampleList)

    for x in range(listSize)
        if exampleList[x]==2:
            Ed.PlayBeep()
            Ed.TimeWait(500, Ed.TIME_MILLISECONDS)

Watch out for:
~~~~~~~~~~~~~~

Limit makes a for loop count up from zero, to one value under the limit.
the for loop does not use the number entered as the limit

"""

