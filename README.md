# RisingWorldServerGUI
A VERY basic GUI for the survival game 'Rising World'.

'Rising World' is a sandbox survival game which deserves a better following, with nice graphics, farming, mining, fishing, and a construction process using blocks with multitudes of shapes, including round and angled blocks. Simply put, it's a pleasure to immerse yourself in.

This is also the reason why I felt it deserves a better server handler than a .bat file.

I have developed this GUI in Embarcadero Delphi Community Edition 10.3 with the following dependencies:
* VCL project - sorry, I'll consider an FMX version soon to replace it (I'm after a proof of concept first)
* TDosCommand component freely available via the internal GetIt Package Manager (Note: This is a Windows-only component)

# To Do:
* Automated/Scheduled restarting of the server after a certain amount of time
* Easy Start/Stop of a server
* Automated backups of the server world
* Stored server logs
* Replace TDosCommand with a cross-platform equivalent (necessary for cross-platform)
* Create/Convert to an FMX version
* Application as a service(?)
* Multiple servers(?) - this is a big step as each server becomes instantiated
* Memory/CPU usage statistics(?) - my thoughts would be collecting server process stats
