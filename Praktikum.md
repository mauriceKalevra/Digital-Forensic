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
Alle Dateien besitzen die gleiche Uhrzeit... Die Uhrzeit der Datei wird ab Anlegung der Datei auf Basis der Systemzeit 'gestartet'

1.3)
Windows versucht automatisch alle Partitionen und Volumes die es endeckt mit Hilfe des Programms **Mountvol** einzubinden.  Die einbindung ist allerdings immer im Lese und Schreibmodus!
Mit dem Windows Kommando 'MOUNTVOL /N' wird das automatische Einbinden mit Mountvol deaktiviert. Nun kann man mit Tools wie Diskpart das Volume auf Read-only konfigurieren, mit : 'ATTRIBUTES VOLUME SET READONLY' 

Linux verwendet Mount um Volumes einzubinden. Wenn nicht anders Konfiguriert, wird auch hier automatisch im Read/Write modus einngebunden. So muss man angeschlossene Volumes 'remounten' wenn diese ReadOnly sein sollten. 
Volume zu readonly remounten: Name des Volumes heruaszufinden, zB. sda1 : $ lsblk -e 7  
			      Volume sda1 in readonly mounten		: $ sudo mount -r /dev/sda1 /location/to/mount/partition/
			        
Um dauerhaft Volumes und Dateisysteme mit Readonly zu mounten, muss das die Datei /etc/fstab entsprechen angepasst werden.
Hier muss für das jeweilige Volume die Readonly-Flag in der mount line hinzugefügt werden und das File anschließend gespeichert werden.

2.1) 
Virtuelles 50 mb Laufwerk mit dd erstellen: sudo dd if=/dev/zero of=Nameofimage.img bs=1M count=50
Dieses kann nun mit fdik Nameofimage.img eingebunden werden.

2.2) md5sum MyImage.img

2.3) Es wurden mehrere jpg Bilder gefunden, sowie Texte und Emails. 
