#include<stdio.h>
#include<string.h>
#define N strlen(g)
char t[128],cs[128],g[]="10001000000100001";
int a,e,c;
void xor()
{
	for(c=1;c<N;c++)
		cs[c] = ((cs[c]==g[c])?'0':'1');
}
void crc()
{
	for(e=0;e<N;e++)
		cs[e] = t[e];
	do{
	if(cs[0]=='1')
		xor();
	for(c=0;c<N-1;c++)
		cs[c] = cs[c+1];
	cs[c] = t[e++];
	}while(e<=a+N-1);
}
int main()
{
	printf("Enter polynomial\n");
	scanf("%s",t);
	printf("Generating polynomial: %s\n",g);
	a = strlen(t);
	for(e=a;e<a+N-1;e++)
		t[e] = '0';
	printf("Modified polynomial: %s\n",t);
	crc();
	printf("Checksum is: %s\n",cs);
	for(e=a;e<a+N-1;e++)
		t[e] = cs[e-a];
	printf("Final Codeword is: %s\n",t);
	printf("Test error Detection 0(yes) 1(n0)\n");
	scanf("%d",&e);
	if(e == 0)
	{
		printf("Enter the position where error is to be inserted\n");
		scanf("%d",&e);
		t[e] = ((t[e]=='0')?'1':'0');
		printf("Erronous data is %s\n",t);
	}
	crc();
	for(e=0;(e<N-1)&&(cs[e]!='1');e++);
	if(e<N-1) printf("error detected\n");
	else printf("no error detected\n");
	return 0;
}
	
