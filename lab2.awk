BEGIN{
tcp = 0;
udp = 0;
}
{
if($1 == "r" && $3 == "2" && $4 == "3" && $5 == "tcp")
tcp++;
if($1 == "r" && $3 == "2" && $4 == "3" && $5 == "cbr")
udp++;
}
END{
printf("No. of packets sent by tcp = %d\n",tcp);
printf("No. of packets sent by from udp = %d\n",udp);
}
