void printChar(int i,int j,char c,int color)
{
	char* video_mem = (char*) 0xb8000;
	video_mem += (80*i + j)*2+3;
	*video_mem = c;
	video_mem += 1;
	*video_mem = color;
}

void printStr(int i,int j,char *s,int color)
{
	while(*s!='\0')
	{
		printChar(i,j,*s,color);
		j++;
		s++;
	}
}

void clrscr()
{
	for ( int r = 0 ; r < 25 ; r++ )
	{
		for ( int c = 0 ; c < 80 ; c++ )
		{
			printChar(r, c, ' ',49);
		}
	}
}

void delay(int n)
{
	for(int i=0; i<100000000*n; i++)
	{
		
	}
}
