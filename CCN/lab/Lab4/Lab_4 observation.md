1. What is the client port number in the UDP segment? What is the value of the Length field?
 -> Port: 8000;  Lenght:
2. What is the value of the checksum in the UDP segment sent by the client? What is the value of the checksum in the UDP segment sent by the server?
->
3. What are the TCP segments observed for opening the TCP connection? What are the flags set in these segments?
->
4.  What is the source port number in the TCP segment sent by the client?
->
5. What is the value of the Header Length field?
->
6.  What are the TCP segments observed for closing the TCP connection? What are the flags set in these segments?
->
7.  What are the flags set in the remaining TCP segments which carry the data?
->
8.  What is the round trip time observed by the client during the TCP connection?
->


Analysis
1. What is the client port number in the UDP segment? What is the value of the Length field?
-Destination Port: 8000 
Length: 13

2. What is the value of the checksum in the UDP segment sent by the client? What is the value
of the checksum in the UDP segment sent by the server?
-client Checksum: 0xfe20 [unverified]
sever Checksum: 0xfe20 [unverified]

3. What are the TCP segments observed for opening the TCP connection? What are the flags set
in these segments?
-Flags: 0x012 (SYN, ACK)

4. What is the source port number in the TCP segment sent by the client?
Source Port: 35468

5. What is the value of the Header Length field?
Header Length: 40 bytes (10)

6. What are the TCP segments observed for closing the TCP connection? What are the flags set
in these segments?
-Flags: 0x012 (SYN, ACK)


7. What are the flags set in the remaining TCP segments which carry the data?
-Flags: 0x018 (PSH, ACK)

8. What is the round trip time observed by the client during the TCP connection? 
-10
