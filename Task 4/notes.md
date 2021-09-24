## How to emulate the NTUSER.DAT file with Windows (using Powershell)

1. Load the NTUSER.DAT file into a temporary subkey with:

``reg load HKLM\<temp-subkey> <NTUSER.DAT file>``

*Now the data is visible in the Native Windows registry; just look at ``HKEY_LOCAL_MACHINE`` with  ``regedit``*

2. Start searching/browsing with:

``reg query <whatever folder you want>``

*Additionally, we can browse that registry through ``Set-Location HKLM:\<temp-subkey>``.  This will allow us to use more commands to analyze further*

3. Once done, remove the temporary key with:

``reg unload HKLM\<temp-subkey>``

## Alternatively, use [Eric Zimmerman's Registry Explorer Tool](https://ericzimmerman.github.io/#!index.md)

It has a great UI and is easy to use.  Definitely a great tool for forensics.

# From analyzing NTUSER.DAT, we found:

### Putty accounts found (grep for the PuTTY path ending in the malicious code)
+ dkr_prd10 - *builder01*
+ dkr_prd47 - *rktbot100*
+ dkr_prd55 - *tester_06*
+ dkr_tst25 - *builder04*
+ dkr_tst42 - *dockerbot*

### WinSCP (grep for the WinSCP path ending)
+ dkr_prd10 - *builder01*
	+ Was deleted
+ dkr_prd55 - *tester_06*
	+ Has an extra value *RemoteDirectory* with the data *Microsoft.SkyDrive* 
+ dkr_tst42 - *dockerbot*
	+ Was deleted

### Other important discoveries: 
1. Many deleted files in the `Search` and `WinSCP` directories.
	+ Deleted Jumplist with information relating to what files were taken while searching the PuTTY directory
```
Registry file: *\NTUSER.DAT
Key: Software\Microsoft\Windows\CurrentVersion\Search\JumplistData
Last write: 2021-04-29 11:51:15
Value: SimonTatham.PuTTY (RegQword)
Data: 132641706751588483
Slack: F8-8A-0E-00-08-00-00-00-F0-E3-09-00
```

2. ***Unassociated deleted value relating to the file `dkr_tst25.ppk`***

3. It was the user *builder04* on the host *dkr_tst25*