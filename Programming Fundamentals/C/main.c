#include <stdio.h>
#include <stdlib.h>

int main ()
{
    int input = 0;

    printf ("Select an option\n");
    printf ("1. Newton\'s Second Law of Motion\n");
    printf ("2. Volume of a Cylinder\n");
    printf ("3. Character Encoding\n");
    printf ("4. Gravity\n");
    printf ("5. Resistive Divider\n");
    printf ("6. Distance between two points\n");
    printf ("7. General Equation\n");
    printf("8. Quit\n");
    scanf("%d", input);

    switch (input)
    {
        case 1:
            NewtonSecondLaw();
            break;
        case 2:
            VolumeCylinder();
            break;
        case 3:
            CharacterEncode ();
            break;
        case 4:
            GravityCalc ();
            break;
        case 5:
            ResDiv ();
            break;
        case 6:
            TwoPoint ();
            break;
        case 7:
            GenEq ();
            break;
        case 8:
            return 0;
            break;
        default:
            printf ("Invalid Input\n");
    }

    return 0;
}

void NewtonSecondLaw()
{

}

void VolumeCylinder()
{

}

void CharacterEncode ()
{

}

void GravityCalc ()
{

}

void ResDiv ()
{

}

void TwoPoint ()
{

}

void GenEq ()
{

}
