Well we start with using the ipconfig function in the terminal.
after which we will ping the google dns
then we will run the wireshark application and try to capture the packets that are being sent 

#1 Since this is a linux system the # of pings that is sent is not a defined thing & is the number of times that it is being pinged by the system and how long it ran before it was stopped.
#2 the size of the data was 48
#3 the time taken for the round trip of the 1st packet sent was 30ms 
#4 type is shown as 8 in wireshark
#5 14 panda@pop-os:~$ traceroute 8.8.8.8
traceroute to 8.8.8.8 (8.8.8.8), 30 hops max, 60 byte packets
 1  _gateway (10.1.16.1)  2.961 ms  4.444 ms  4.519 ms
 2  192.168.5.1 (192.168.5.1)  4.498 ms  4.739 ms  6.290 ms
 3  192.168.254.1 (192.168.254.1)  6.271 ms  6.251 ms  7.071 ms
 4  1.6.222.153 (1.6.222.153)  14.797 ms  39.733 ms  39.815 ms
 5  100.70.137.132 (100.70.137.132)  46.710 ms  46.690 ms  46.670 ms
 6  100.70.136.115 (100.70.136.115)  46.651 ms *  8.498 ms
 7  100.70.136.109 (100.70.136.109)  10.237 ms  10.206 ms *
 8  100.70.138.77 (100.70.138.77)  10.145 ms * 172.31.167.46 (172.31.167.46)  18.356 ms
 9  100.70.136.28 (100.70.136.28)  10.093 ms  10.073 ms  10.044 ms
10  * * *
11  * 100.70.136.25 (100.70.136.25)  9.939 ms  8.975 ms
12  72.14.219.169 (72.14.219.169)  28.170 ms  28.083 ms  28.041 ms
13  * * *
14  dns.google (8.8.8.8)  24.706 ms  21.141 ms  27.395 ms

#6 throughput = 107.9979757