#include<stdio.h>
#include<stdlib.h>
struct node{
unsigned dist[20];
unsigned from[20];
}rt[10];
int main()
{
	int i,j,k,count,n,dmat[20][20];
	printf("Enter the no. of nodes\n");
	scanf("%d",&n);
	printf("Enter cost matrix\n");
	for(i=0;i<n;i++)
	{
		for(j=0;j<n;j++)
		{
			scanf("%d",&dmat[i][j]);
			dmat[i][i] = 0;
			rt[i].from[j] = i;
			rt[i].dist[j] = dmat[i][j];
		}
	}
	do
	{
		count = 0;
		for(i=0;i<n;i++)
		for(j=0;j<n;j++)
		for(k=0;k<n;k++)
		{
			if(rt[i].dist[j]>(dmat[i][k]+rt[k].dist[j])){
			rt[i].dist[j] = rt[i].dist[k]+rt[k].dist[j];
			rt[i].from[j] = k;
			count++;
			}
		}
	}
	while(count!=0);
	for(i=0;i<n;i++)
	{
		printf("\nstate value of node %d\n",i+1);
		for(j=0;j<n;j++){
		printf("\t\n to %d via %d, distance = %d\n",j+1,rt[i].from[j]+1,rt[i].dist[j]);
	}}
	return 0;
}
