#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define PI 3.14
#define G 0.0000000000667


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
            system("cls");
            main();
            break;
        case 2:
            VolumeCylinder();
            system("cls");
            main();
            break;
        case 3:
            CharacterEncode ();
            system("cls");
            main();
            break;
        case 4:
            GravityCalc ();
            system("cls");
            main();
            break;
        case 5:
            ResDiv ();
            system("cls");
            main();
            break;
        case 6:
            TwoPoint ();
            system("cls");
            main();
            break;
        case 7:
            GenEq ();
            system("cls");
            main();
            break;
        case 8:
            break;
        default:
            printf ("Invalid Input\n");
            system("pause");
            system("cls");
            main();
    }

    return 0;
}
/*
1.
*/
void NewtonSecondLaw()
{
    double f = 0, m = 0, a = 0;
    char decision = '\0';

    system("cls");

    printf ("Newton\'s Second Law of Motion");
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
        NewtonSecondLaw();
    }
}

/*
2.
*/
void VolumeCylinder()
{
    double v = 0, r = 0, h = 0;
    char decision = '\0';

    system("cls");

    printf ("Volume of a cylinder");
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
        VolumeCylinder();
    }
}

/*
3.
*/
void CharacterEncode ()
{
    char p = '\0', e = '\0', decision = '\0';

    system("cls");

    printf ("Character encoding");
    printf ("\nEncoded Character: shift the plaintext -a then shift +A");

    printf ("\nEnter the plaintext character: ");
    scanf (" %c", &p);

    e = (p - 'a') + 'A';

    printf ("\nPlaintext character: %c, Encoded character: %c", p, e);

    printf ("\nWould you like to encode another example (y/n)? ");
    scanf (" %c", &decision);

    printf ("\n%c", decision);
    if (decision == 'y')
    {
        CharacterEncode();
    }
}

/*
4.
*/
void GravityCalc ()
{
    double f = 0, m1 = 0, m2 = 0, d = 0;
    char decision = '\0';

    system("cls");

    printf ("Gravitational force between two bodies");
    printf ("\nForce = G * mass1 * mass2 / distance^2");

    printf ("\nEnter the mass for the first body in kg: ");
    scanf ("%lf", &m1);

    printf ("\nEnter the mass for the second body in kg: ");
    scanf("%lf", &m2);

    printf ("\nEnter the distance between the two bodies in km: ");
    scanf ("%lf", &d);

    f = (G * m1 * m2) / (d * d);

    printf ("\nForce = G * mass1 * mass2 / distance^2 = 6.67*10^-11 * %.2lf kg * %.2lf kg / %.2lf^2 km = %.2lf N", G, m1, m2, d, f);

    printf ("\nWould you like to calculate another example (y/n)? ");
    scanf (" %c", &decision);

    printf ("\n%c", decision);
    if (decision == 'y')
    {
        GravityCalc();
    }
}

/*
5.
*/
void ResDiv ()
{
    double vo = 0, r1 = 0, r2 = 0, vi = 0;
    char decision = '\0';

    system("cls");

    printf ("Resistive Divider Calculation");
    printf ("\nVo = R2 / (R1 + R2) * Vi");

    printf ("\nEnter value of the first resistor (ohm): ");
    scanf ("%lf", &r1);

    printf ("\nEnter value of the second resistor (ohm): ");
    scanf ("%lf", &r2);

    printf ("\nEnter value of the input voltage (V): ");
    scanf ("%lf", &vi);

    vo = (r2 / (r1 + r2)) * vi;

    printf ("\nVo = R2 / (R1 + R2) * Vi = %.2lf / (%.2lf + %.2lf) * %.2lf = %.2lf", r2, r1, r2, vi, vo);

    printf ("\nWould you like to calculate another example (y/n)? ");
    scanf (" %c", &decision);

    printf ("\n%c", decision);
    if (decision == 'y')
    {
        ResDiv();
    }
}

/*
6.
*/
void TwoPoint ()
{
    double d = 0;
    int x1 = 0, x2 = 0, y1 = 0, y2 = 0;
    char decision = '\0';

    system ("cls");

    printf ("Distance between two points");
    printf ("\ndistance = sqrt((x1 - x2)^2 + (y1 - y2)^2)");

    printf ("\nEnter the x-coordinate (x1, x2), separated by a space: ");
    scanf ("%d%d", &x1, &x2);

    printf ("\nEnter the y-coordinate (y1, y2), separated by a space: ");
    scanf("%d%d", &y1, &y2);

    d = sqrt(((x1 * x1) + ((-2) * x1 * x2) + (x2 * x2)) + ((y1 * y1) + ((-2) * y1 * y2) + (y2 * y2)));

    printf ("distance = sqrt((x1 - x2)^2 + (y1 - y2)^2) = sqrt((%d - %d)^2 + (%d - %d)^2)= %.2lf", x1, x2, y1, y2, d);

    printf ("\nWould you like to calculate another example (y/n)? ");
    scanf (" %c", &decision);

    printf ("\n%c", decision);
    if (decision == 'y')
    {
        TwoPoint();
    }
}

/*
7.
*/
void GenEq ()
{

}
