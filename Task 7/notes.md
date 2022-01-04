# Goal:
*Provide a hex dump of the plaintext packet (not frame) contents a client would send to initialize a session with the provided UUID:* 58c80187-bba5-4fc4-b872-af14ed9694f0


# Static Strat

## mucytenzelakd
*INPUT:*
ip = `198.51.100.83`
port = `6666`
output = *empty*
length = 0

*Function Run*
local_310 = `198.51.100.83`
local_320 = *empty*
local_328 = 0
local_314 = `6666`
local_20 = *memory addr of pointer* FS
result = *filler* 0xffffffff
sock = *filler* 0xffffffff
my_uuid = *address of pointer?*   
$RAX = holds the addr stored in `my_uuid`
port = `16`
ip = the uuid??

## kdovfwaafohzy
1. local_16c = sock `6666`
2. lcoal_178 = fp `t`
3. 



# Dynamic Strat
+ The protocol includes an initial crypt followed by a series of client-generated requests

+ `sudo dockerd`
+ `sudo docker run -it panic-nightly-test /bin/sh`
+ `apk add gdb`
+ `gdb /usr/bin/make`

+ `adduser -u 58c80187-bba5-4fc4-b872-af14ed9694f0`

## Break points during dynamic analysis

+ `b fducupwveyvwe()` *Run program to here , then set the `$pc`  (program counter) to after the if statement jump.*
  + The instruction after `jne  0x560d711ff394 <_Z10gitGrabberv+382>`
+ `b mucytenzelakd(char const*, unsigned short, char const*, unsigned long)` *Should be able to continue program to here after previous step*
+ `watch my_uuid`
  + *Do only after entering the `mucytenzelakd` function*
+ `b *mucytenzelakd(char const*, unsigned short, char const*, unsigned long) + 91`
+ `b qnkqqydwzesmi(unsigned long)`
+ `b cywbunaodtzjq(char const*, unsigned short)` *Opens up the sockets.  Just force return a value greater than -1 here*
+ `b uzfzzqiiqrfrr(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >)`

b fducupwveyvwe()
b mucytenzelakd(char const\*, unsigned short, char const\*, unsigned long)
b cywbunaodtzjq(char const\*, unsigned short) 
b kdovfwaafohzy(int, std::\__cxx11::basic_string\<char, std::char_traits\<char\>, std::allocator\<char\> \>)
b xxfbtgbhbhily(int, void const\*, unsigned long)
maybe? - b uzfzzqiiqrfrr(std::\__cxx11::basic_string\<char, std::char_traits\<char\>, std::allocator\<char\> \>)
b xfftjvidcoyrn(int, std::\__cxx11::basic_string\<char, std::char_traits\<char\>, std::allocator\<char\> \>)
b vrjphweseayjh(int)


run
finish
set $pc= *Address after the JNE \<_Z10gitGrabberv+382\>*
c
c
return
set sock=4
c
c
*break at some addr before JAE <_Z13xxfbtgbhbhilyiPKvm+140>*
return
finish
set result=0
set $pc= *Address after the JNE <_Z13mucytenzelakdPKctS0_m+1394>*

**Now in the While loop**
c
c
*snag the data to be sent*
return
set $pc= *Address after the JNE <_Z13mucytenzelakdPKctS0_m+1397>*
c
return
*Set address of the JNE <_Z13mucytenzelakdPKctS0_m+1400> to be NOP*

# Answer


# EXTRA NOTES
-------------------------------------------------------------------------------------------
## Previous Task results: 

### IP

198.51.100.83

### PubKey

'7ÎýþÐÏçÓj÷v°Ø+.© ï\*·cfXÏ]î\`

### Version

1.3.1.3-XVT

### Port:

6666

##### *Victim Id we'll be using (from the `victim_id` file):*

58c80187-bba5-4fc4-b872-af14ed9694f0

+ The initial connection function is `cywbunaodtzjq("198.51.100.83", 6666)`
+ Plaintext output of `fingerprint` function should be like this: 
  + username=unknown,version=1.3.1.3-XVT,os=Linux,timestamp=`results of tv_sec`
    + *Script to find the os info [from IBM site](https://www.ibm.com/docs/en/zos/2.2.0?topic=functions-uname-display-current-operating-system-name):*
    + *Below is my modified version to work on the docker image*
  + From this discovery, it seems that the malware builds all the info and then attempts connection with the function `cywbunaodtzjq`


### All content from the text-mapping function `nxlqkwqfbgjnw`:

| stringID	  | Results 	|
| ----------- | ----------- |
| 1      	  | os |
| 2   		  | version|
| 3      	  | username |
| 4   		  | timestamp |
| 5      	  | unknown |
| 6   		  | /tmp/.gglock |
| 7      	  | usr/local/src/repo |
| 8   		  | pidof git |
| 9      	  | Commit:  |
| 10   		  | Author:  |
| 11      	  | Email:  |
| 12   		  | Time:  |
| 13      	  | No data available |
| 14   		  | ninja |
| 15      	  | %Y-%m-%d |
| 16   		  | nightly-exfil |
| 17      	  | 1.3.1.3-XVT |
| 18   		  | '7ÎýþÐÏçÓj÷v°Ø+.© ï\*·cfXÏ]î\` |
| 19      	  | 198.51.100.8 |

### `fp` pointer in the arguments from `kdovfwaafohzy` has the following data Base64 encoded:
*Timestamp changes value whenever called, of course*

```
username=unknown,version=1.3.1.3-XVT,os=Linux,timestamp=1633983216
```
