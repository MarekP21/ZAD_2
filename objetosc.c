/* objetosc.c */
#include <stdio.h>
void oblicz_objetosc()
{
    float krawedz=0;
    while(krawedz<=0){
        printf("Podaj dlugosc krawedzi szescianu: ");
        scanf("%f",&krawedz);
        if(krawedz<=0)
        {
            printf("Prosze podac wartosc nieujemna.\n");
            continue;
        }
        else break;
    }
    float objetosc=krawedz*krawedz*krawedz;
    printf("Objetosc szescianu o krawedzi %.1f wynosi %.1f\n",krawedz,objetosc);
}
