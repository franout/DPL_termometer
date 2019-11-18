#include <stdio.h>
#include <stdlib.h>

int main ( void ) {
	


char *str[12]={"!","d","l","r","o","w"," ","o","l","l","e","h"};

// display ready  print hello world
for ( int  i=0;i<12 ;i++) {
    fprintf(stdout, "%c ", *str[i]);
    int tmp=*str[i];
    fprintf(stdout, "%d ",tmp );

        fprintf(stdout, "%d", (tmp & 0x00000080)>>7);

        fprintf(stdout, "%d", (tmp & 0x00000040)>>6);

        fprintf(stdout, "%d", (tmp & 0x00000020)>>5);
        fprintf(stdout, "%d", (tmp & 0x00000010)>>4);
        fprintf(stdout, "%d", (tmp & 0x00000008)>>3);
        fprintf(stdout, "%d", (tmp & 0x00000004)>>2);
        fprintf(stdout, "%d", (tmp & 0x00000002)>>1);
        fprintf(stdout, "%d", (tmp & 0x00000001)>>0);

    fprintf(stdout, "\n");

}


	return 0;
}