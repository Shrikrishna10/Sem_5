# Abbreviations
ISP -> Internet Service Provider
CO -> Central Office
DSL -> Digital Subscriber line
DSAM -> DSL Access Multiplexer
TDM -> Time Division Multiplexing
FDM -> Frequency(freq.) Division Multiplexing

IP -> Internet Protocol
TCP -> Transmission Control Protocol
OSI -> Open System Interconnect
MAC -> Media Access Control


QoS -> Quality of Service

HTTP -> Hyper Text Transfer Protocol
HTML -> Hyper Text Markup Language
URL -> Uniform Resource Locator
CDN -> Content Delivery Networks
DNS-> Domain Name Server
BIND -> Berkeley Internet Name Domain
UDP ->User Datagram Protocol
TLD -> Top Level Domain
SMTP -> Simple Mail Transfer Protocol
ASCII -> American Standard Code of International Interchange
DASH -> Dynamic Adaptive Streaming over HTTP
RDT -> Reliable Data Transfer 


# What is a Network?
A network is simply defined as an arrangement of intersecting horizontal and vertical lines.
- But our definitions can be tailored in such a fashion as follows:
	- a group or system of interconnected people or things.

# What is a Computer Network?
A computer network can be defined as a group or groups of interconnected nodes or systems that share and/or exchange data and resources.
	Here the systems can be computational devices or other edge devices.
- These networks follow certain pre-set rules which is recognised by both the sender and receiver systems.
	- This system of rules are collectively called the communication protocols.
- These networks can be either physical or wireless.

- It is a graph consisting of end-systems or hosts connected to one another via communication links & some **packet switches** 
- End-Systems or hosts run applications which generate or receive data in the form of packets(i.e. collection of bits.).
- A sequence of packet switches & communication links are called route or path.
- A computer network is usually administered by one entity which configures & maintains the operation.
>[!Note]
>Hosts connect to the internet via ISPs.



# How does a Computer Network Work???
Nodes & links are the basic building blocks in computer networking. 
- A **network node** may be a Data Communication equipment(**DCE**) such as:
	- Modem, Hub, switch, Data Terminal equipment(DTE) such as 2 or more computers, printers, etc.
- A **link** refers to the **transmission media** connecting 2 nodes. It can be:
	- Cable wires, optical fibres, free space.
#### Extra
In a working computer network, nodes follow a set of rules or protocols that define how to send and receive electronic data via the links. The computer network architecture defines the design of these physical and logical components. It provides the specifications for the network’s physical components, functional organization, protocols, and procedures.

# What do Computer Networks do? 
Created for the Military, an efficient data transmission method for time critical information.
It is the biggest boon to society when it was adapted for it current applications. 
Nowadays they are more than a connectivity set-up, and do more than just transfer information over a long distance the same way as it was originally intended to.
The things that the network carries may not have changed but the use of this has.
Modern Computer Networks can:
1. Operate virtually
2. Integrate on a **large scale**
3. Respond quickly to changing conditions
4. Provide Data Security.
	1. Originally the internet didn't have a proper security system but a lot of the protocols now days have made sure that your data on the internet is encrypted.

# Computer Network Architecture:
1. Client - Server Architecture:
	In this type of Computer Network, nodes may be servers or clients. Server nodes provide resources like memory, processing power, data to client nodes. Server nodes may also manage client node behaviour. Clients may communicate with each other, but they do not share resources. For Eg. some computer devices in enterprise networks store data & config settings. These devices are the servers in the network. Clients may access this data by making a request to the server machine.
2. Peer-to-Peer Architecture:
	In Peer-to-Peer (P2P) architecture, connected computers have equal powers and privileges. There is no central server for coordination. Each device in the computer network can act as either client or server. Each peer may share some of its resources, like memory and processing power, with the entire computer network. For example, some companies use P2P architecture to host memory-consuming applications, such as 3-D graphic rendering, across multiple digital devices.


# What is the Internet?
The **Internet** is a worldwide system of interconnected computer networks & electronic devices that communicate with each other using an established set of protocols.
![[Pasted image 20240915164611.png]]
Above is a visualisation of the internet.

One way is to describe the nuts and bolts of the Internet, that is, **the basic hardware and software components that make up the Internet**. Another way is to describe the Internet in terms of a networking infrastructure that provides services to distributed applications. #todo 

# Who owns/controls the Internet?
- ISP (Internet Service Provider): is a business entity or company which provides internet access to the end-systems in which return for a subscription fee.
- The place where end-systems connect to an ISP is referred to as point-of-presence(PoP).
- The number of PoPs (typically in 1000s) held by an ISP tells about its outreach in the internet.
- PoP consists of routers, link layer switches, MPLS and communication links.
- ISP Eg: Telecom operators, Cable TV operators, Fibre optic operators.

## Hierarchy
![[Pasted image 20240915180311.png]]
![[Pasted image 20240915180352.png]]

## Revenue Generation is as follows:
- End users pay access ISPs.
- Access ISPs pay to regional ISPs
- Regional ISPs pay to Teir 1 ISPs
-  #todo not sure if it is important moving on 

# How does the internet provide services for distributed applications? 
- Distributed means that the applications run independently on the host or end systems.
- **Messages** are exchanged by the hosts using the **internet socket interfaces** of their respective applications
- **Protocols define the format & the order of messages exchanged between 2 or more hosts.** #important 
- **Protocols** also define the actions taken on the transmission &/or receipt of a message or other event.
- **Services**(eg. Reliability, guaranteed rate) are provided by the hardware or software associated with the devices.
- ![[Pasted image 20240916123137.png]]

# Network Edge
- Computer networks that sit on the **periphery of the internet** constitute the **network edge** or the **access network**. 
- End-systems can be further classified as **clients & servers**.
- **Router** which connect an access network to a regional/access ISP is referred to as **gateway**.
- **Access network nomenclature**
- Based on size: Local are networks(LAN), home networks, wide area networks(WAN), etc.
- Based on Physical media: Free space(wireless) or Wired - DSL, Cable, Fibre.

## Home Access Network
- The devices in the home are connected to the internet via a LAN or Wifi router.
- Different physical media could be provided by different access ISPs to connect the home network with the internet.
- Below is an eg. of a home network. This network consists of a laptop, multiple internet-connected devices who is being supplied by one router.
- ![[Pasted image 20240916173110.png]]
	- A **home router** that connects the wireless access point, & any other **wired home devices** to the internet.
	- This network allows household members to have **broadband access** to the internet with one member roaming from the kitchen to the backyard to the bedrooms.
- ![[Pasted image 20240916173056.png]]
	- Above is a general architecture of a network


## DSL
DSL -> Digital Subscriber line
![[Pasted image 20240916193347.png]]

### DSL Internet access
![[Pasted image 20240916193522.png]]
- DSL is used when a customer's telephone company is also its ISP.
- Each Customer's DSL modem uses the existing telephone line exchange data with a digital subscriber line access multiplexer (DSLAM) located in telephone company's local central office.
- The home's DSL modem takes digital data & translates it into high freq. tones for transmission over telephone wires to the CO; 
- The analogue signals from many such houses are translated back into digital format at the DSLAM.
- A hybrid fibre coaxial access network: Fibre Optics connect the cable head end to neighbourhood-lvl junctions, from which traditional coaxial cable is then used to reach individual houses.
- Each of these junctions support upto 5K homes, both fibre & coaxial cable are employed in this system which gives it the name **Hybrid Fibre Coax**.
- ![[Screenshot from 2024-09-16 19-45-14.png]]
- Above is a representation.
- At the cable head end, the **cable modem termination system(CMTS)** serves a similar function as the DSL network's DSLAM - turn the analogue signal sent from the cable modems in many downstream homes back into digital format.
- Below figure shows **Fibre to the Home(FTTH)** using **Passive Optical Networks(PON)** distributed architecture.
- ![[Pasted image 20240916201851.png]]
- Each home has an **optical network Terminator(OLT)** which is connected by dedicated optical fibre to a neighbourhood splitter.
- Splitters combine a number of homes into a single shared optical fibre, which connects to an OLT in the telephone company's central office.
- The OLT, providing the conversion between optical & electrical signals, connects to the internet via a telco router.

## Enterprise Access networks
- ISP can be telecom operator
- Built using Ethernet Cables, switches & hubs
- Ethernet switches are preferred over routers in a LAN
- Routers are used for separating the network into subnets
- ![[Pasted image 20240916202753.png]]
- Ethernet users use the twist-pair Cu wires to connect to an Ethernet switch.
- The Ethernet switch, or a network or such interconnected switches is then connected into the larger internet.
- Ethernet has a varied speeds for transmission.

## Wireless Networks
- Wifi or Cellular based.
- Classified according to radio access technologies
	- Spread spectrum, freq. hoping, random access, polling methods, etc.
- They are supported by ISPs and span from a few meters to several kilometers.
- Wireless networks have undergone tremendous evolution recently due to the spike in users.

# Protocol Layers
