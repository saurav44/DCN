BEGIN{
count = 0;
}
{
if($1 == "d")
count++;
}
END{
printf("Total no. of packets dropped due to congestion is %d\n",count);
}
