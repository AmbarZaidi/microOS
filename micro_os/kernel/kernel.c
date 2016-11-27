#include "../drivers/display.h"
#include "../drivers/main.h"

void main()
	{
		char* video_memory = (char*) 0xb8000;
		*video_memory = 'X';
		delay(50);		
		clrscr();
		aboutMe();
		
	}
