# Asterisk-server-install
Voice over Internet Protocol (VoIP), is a technology that allows you to make voice calls using a broadband Internet connection instead of a regular (or analog) phone line. Some VoIP services may only allow you to call other people using the same service, but others may allow you to call anyone who has a telephone number - including local, long distance, mobile, and international numbers. Also, while some VoIP services only work over your computer or a special VoIP phone, other services allow you to use a traditional phone connected to a VoIP adapter. SIP client and server on a computer network via port 5060. Port 5060 is default port which gets open when VoIP is activated making calls.
The following are examples of functionality commonly used within VoIP installations that are not common in legacy telephony networks:
•	Usage of multiple lines and extensions
•	Voicemail systems
•	Voice recording
•	Administrative Control
•	Register calls
•	Modular Configurations
•	IVR 
Understanding the SIP Protocol
The Session Initiation Protocol (SIP) allows us to establish, end or change voice or video calls. The voice or video traffic is transmitted via the Real Time Protocol (RTP) protocol.
SIP is an application layer protocol that uses UDP or TCP for traffic. By default, SIP uses port 5060 UDP/TCP for unencrypted traffic or port 5061 for TLS encrypted traffic. As we will see later, Man-in-the-Middle (MITM) attack vectors exist for all types of communication, including VoIP/SIP. Therefore, encryption is a necessary compensating control to have in place regardless of the environment or service method.
SIP is ASCII based and very similar to the HTTP protocol as it uses a Request/Response Model. Requests to the SIP client are made through SIP URI via a user-agent similar to an HTTP request made by a web browser.

#Documentation
#Installation
sh iinstall.sh

