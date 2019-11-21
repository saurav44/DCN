#include<stdio.h>
#include<stdlib.h>
#define infinity 999
void dijkstra(int cost[20][20], int n, int d[20],int p[20],int visited[20], int src, int dest){
int u,v,min,i,j;
for(i=0;i<n;i++){
d[i] = cost[src][i];
p[i] = src;
visited[i] = 0;
}
for(i=0;i<n;i++){
min = infinity;
for(j=0;j<n;j++){
if((visited[j] == 0)&&(d[j]<min)){
min = d[j];
u = j;
}
}
visited[u] = 1;
for(v=0;v<n;v++){
if((visited[v] == 0)&& (d[v]>(d[u]+cost[u][v]))){
d[v] = d[u] + cost[u][v];
p[v] = u;
}
}
} 
}
int main(){
int a[20][20],n,d[20],src,dest,i,j,visited[20],p[20];
printf("Enter the no. of nodes\n");
scanf("%d",&n);
printf("Enter the cost adjacency matrix\n");
for(i=0;i<n;i++)
for(j=0;j<n;j++)
scanf("%d",&a[i][j]);
printf("Enter the source node\n");
scanf("%d",&src);
for(dest=0;dest<n;dest++){
dijkstra(a,n,d,p,visited,src,dest);
if(d[dest] == infinity){
printf("node %d cannot be reached from %d\n",dest,src);
return 0;
}
else{
printf("path from %d to %d: ",dest,src);
i = dest;
while(i!=src){
printf("%d <-",i);
i = p[i];
}
printf("%d\n",i);
printf("Distance = %d\n",d[dest]);
}
}
}

