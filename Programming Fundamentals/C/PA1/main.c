#include <stdio.h>
#include <stdlib.h>

#define PI 3.14


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
    scanf("%d", &input);

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
    double f = 0, m = 0, a = 0;
    char decision = "\0";

    printf ("\nNewton\'s Second Law of Motion");
    printf ("\nF = ma");
    printf ("\nEnter the mass in kilograms: ");
    scanf ("%lf", &m);

    printf ("\nEnter the acceleration in meters per second: ");
    scanf ("%lf", &a);

    f = m * a;
    printf ("\nF = m * a = %.2lf kg * %.2lf m/s/s = %.2lf N", m, a, f);

    printf ("\nWould you like to calculate another example (y/n)? ");
    scanf (" %c", &decision);

    printf ("\n%c", decision);
    if (decision == 'y')
    {
        system("cls");
        NewtonSecondLaw();
    }
}

void VolumeCylinder()
{
    double v = 0, r = 0, h = 0;
    char decision = "\0";

    printf ("\nVolume of a cylinder");
    printf ("\nVolume = PI * radius squared * height");

    printf ("\nEnter the radius: ");
    scanf ("%lf", &r);

    printf ("\nEnter the height: ");
    scanf ("%lf", &h);

    v = PI * (r * r) * h;

    printf ("\nVolume = PI * radius squared * height = %.2lf * %.2lf^2 * %.2lf = %.2lf", PI, r, h, v);

    printf ("\nWould you like to calculate another example (y/n)? ");
    scanf (" %c", &decision);

    printf ("\n%c", decision);
    if (decision == 'y')
    {
        system("cls");
        VolumeCylinder();
    }
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
