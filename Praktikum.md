#Digitale Forensic Praktikum

**Übung 1**

1.1)

Windows verwendet als Dateisystem NFTS. Dieses stellt zu jeder Datei Attribute anhand des Master File Table(MFT) dar! Hier werden Metadaten und Speicherinformationen über die Datei gespeichert.
Teil der Metadaten ist der MACB Zeitstempel. Dieser setzt sich aus 4 wieteren Zeitstempeln zusammen:  
  
M --> "Modified written time". Letzte Modifikation bzw. Schreibzugriff  
A --> "Last Accessed Date". Wann die Datei zuletzt gelesen bzw. Zugegriffen wurde  
C --> "MFT Entry modified". Wann Metadaten zuletzt geändert wurden.  
B --> "Birt creating time". Wann eine Datei erstellt wurde

Bei Windows wird die Datei- und Ordner- Zeit als ein 64Bit Wert gespeichert mit einer Genauigkeit von 100 Nanosekunden.

Änderung von Windows Timestamps: 
Ändern Sie das Erstellungsdatum / den Zeitstempel einer Datei mit dem Namen log1.txt:

(Get-Item "D: \ Test \ log1.txt"). CreationTime = ("3. August 2019 17:00:00") 

  

Linux verwendet das ext4 Linux file system. Dieses bietet bei jeder Datei 3 Timestamps.  
atime --> Access timestamp. Wann wurde die Datei zuletzt gelesen. Nicht aber verändert etc. 
mtime --> Modified timestamp. Wann wurde die Datei intern zuletzt verändert.
ctime --> Changed timestamp. Wann wurden Metadaten wie berechtigungen etc. der Datei zuletzt 				  geändert.

Die Zeitstempel setzten sich aus Nummern zusammen die ab dem Start der Unix Zeitepoche(1.1.1970) hochzählen.
	
Anzeige von Timestamps in Linux:  
modified time: ls -la  
access time:   ls -lu
change time:   ls -lc

All timestampd: stat filename

Set the times on a file to a specific date and time:
touch -t YYYYMMDDHHMM.SS filename


1.2) 




