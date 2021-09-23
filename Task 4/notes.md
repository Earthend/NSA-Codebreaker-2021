## How to emulate the NTUSER.DAT file with Windows (used Powershell)

1. Load the NTUSER.DAT file into a temporary subkey with:
``reg load HKLM\<temp-subkey> <NTUSER.DAT file>``
*Now visible in registry, just look at ``HKEY_LOCAL_MACHINE`` with  ``regedit``*

2. Start searching/browsing with:
``reg query <whatever folder you want>``

3. Once done, remove the temporary key with:
``reg unload HKLM\<temp-subkey>``

# From analyzing NTUSER.DAT, we found:

### SID Processed Search Roots found (grep for "S-1-5-21-")



### Putty accounts found (grep for the PuTTY path ending in the malicious code)
+ dkr_prd10 - *builder01*
+ dkr_prd47 - *rktbot100*
+ dkr_prd55 - *tester_06*
+ dkr_tst25 - *buillder04*
+ dkr_tst42 - *dockerbot*

### WinSCP (grep for the WinSCP path ending)
+ dkr_prd10 - *builder01*
+ dkr_prd55 - *tester_06*
+ dkr_tst42 - *dockerbot*
