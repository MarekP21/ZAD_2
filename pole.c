/* pole.c */
#include <stdio.h>
void oblicz_pole()
{
    float bok=0;
    while(bok<=0){
        printf("Podaj dlugosc boku kwadratu: ");
        scanf("%f",&bok);
        if(bok<=0)
        {
            printf("Prosze podac wartosc nieujemna.\n");
            continue;
        }
        else break;
    }
    float pole=bok*bok;
    printf("Pole kwadratu o boku %.1f wynosi %.1f\n",bok,pole);
}

