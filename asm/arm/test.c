#include "header.h"



int main()
{
	unsigned long int temp = *(unsigned long int*)UART_BASE;
	unsigned long int temp2 = temp + temp;
	return (int)temp2;
}
