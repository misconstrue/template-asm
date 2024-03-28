extern unsigned long int* UART_BASE_ADDR;



int main()
{
	unsigned long int temp = *(unsigned long int*)UART_BASE_ADDR;
	unsigned long int temp2 = temp + temp;
	return (int)temp2;
}
