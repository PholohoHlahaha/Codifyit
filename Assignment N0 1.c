#include <stdio.h>

    int reversing_integers(int);
    void reversible_prime_sqrs();
    int is_prime(int);

int main()
{

    reversible_prime_sqrs();


    return 1;
}

int reversing_integers(int integer){
	int  reversing_integers = 0, remainder;
	while (integer != 0)
	{
		remainder = integer % 10;
		reversing_integers = reversing_integers * 10 + remainder;
		integer = integer / 10;
	}
 	return reversing_integers;
}


void reversible_prime_sqrs()
{
	for(int number = 1, count = 0; count < 10; number++){

		if(is_prime(number) == 1)
		{
			int square = number*number;
			int reversed = reversing_integers(square);
			if(square != reversed)
			{
				for(int i = 0; i < reversed/2; i++)
				{
					if(i*i == reversed)
					{
						if(is_prime(i) == 1)
						{
							printf("\n%d",square);
							count ++;
						}
					}
				}
			}
		}
	}
}




int is_prime(int integer)
{

	for(int i = 2; i < integer; i++)
	{
		if(integer % i == 0)
		{
			return 0;
		}
	}
	return 1;
}


