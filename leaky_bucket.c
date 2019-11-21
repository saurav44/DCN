#include<stdio.h>
#include<stdlib.h>
#define bktsz 700
int count = 0, c = 0;
void bktip(int a,int b,int i)
{
	if(a > bktsz - c){
	printf("bucket overflow and non-conforming packets\n");
	}
	else
	{
		sleep(1);
		while(a>b){
		printf("%d bytes outputed\n",b);
		a = a-b;
		sleep(1);
		count++;
		}
		if(a>0)
		{
			c = c+a;
			if(count == 0){
			printf("last %d bytes outputed\n",c);
			c = 0;
			printf("%d bytes stored\n",c);
			}
			else{
			if(c==b){
			printf("%d bytes stored is outputed\n",b);
			c = 0;
			}
			if(c>b){
			printf("%d bytes stored is outputed\n",b);
			c = c-b;
			printf("%d bytes stored\n",c);
			}
			else
				printf("%d bytes stored\n",c);
			}
			printf("conforming packets\n");
		}
	}
	if((i==5)&&(c!=0)){
	printf("%d bytes stored is outputed\n",c);
	}
}
int main()
{
	int opr,pktsz,i;
	printf("enter output rate\n");
	scanf("%d",&opr);
	for(i=1;i<=5;i++){
	printf("Enter packet size\n");
	scanf("%d",&pktsz);
	printf("packet no %d, packet size %d\n",i,pktsz);
	bktip(pktsz,opr,i);
	}
	return 0;
}
		
