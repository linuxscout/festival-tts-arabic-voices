#  Arabic voices for Festival TTS

HTS Arabic voice for Festival TTS: is an arabic voice trained by [HTS technologie](http://hts.sp.nitech.ac.jp/)  to work on [Festival TTS system](http://www.cstr.ed.ac.uk/projects/festival/onlinedemo.html).

The voice is HMM trained on [Nawar Arabic Speech Corpus.](http://en.arabicspeechcorpus.com/) 


Features |   value
---------|---------------------------------------------------------------------------------
Authors  | [Authors.md](https://github.com/linuxscout/festival-tts-arabic-voices/master/AUTHORS.md)
Release  | 1.0
License  |[GPL](https://github.com/linuxscout/festival-tts-arabic-voices/master/LICENSE)
Tracker  |[linuxscout/festival-tts-arabic-voices/Issues](https://github.com/linuxscout/festival-tts-arabic-voices/issues)
Source  |[Github](http://github.com/linuxscout/festival-tts-arabic-voices)


## Samples 

-  [المثال الأول](https://soundcloud.com/linuxscout/arabic-voice-for-festival-text-to-speech-system)
-   [المثال الثاني](https://soundcloud.com/linuxscout/arabic-voice-for-festival-text-to-speech-system-1)
-  [المثال الثالث](https://soundcloud.com/linuxscout/arabic-voice-for-festival-text-to-speech-system-2)

##Setup


### Debian/Ubuntu Linux

1. Install necessary packages:

```
```

2. Clone festival-tts-arabic-voices project from GitHub:

```
git clone https://github.com/linuxscout/festival-tts-arabic-voices.git
```

## Usage
=====

 ```
 $echo "السلام عليكم " |festival --tts --language arabic
 ```
or
```
echo "السَّلَامُ عَلَيْكُمْ" | text2wave -eval "(voice_ara_norm_ziad_hts)"  -o /tmp/out.ar_ziad.w
```
## Diacritizer

In order to improve arabic Text to Speech, we propose to use a diacritizer. Arabic text comes usaully without short vowels, for this reason, we need to add short vowels to it, this process is called diacritizion.

The Idea is to use diacritizer as a wraper, it take text, diacritize it, before passing by the TTS system.

We will use [Mishkal: open source Arabic text diacritizer](http://tahadz.com/mishkal); Mishkal is written by Python langaue, it's open source. it has console, desktop and web interfaces.

We will use i as console command.

To install it, download it from [http://mishkal.sourceforge.net](http://mishkal.sourceforge.net), in many packaging versions for your distribution, or get it from github.

```
$ git clone https://github.com/linuxscout/mishkal.git
```

copy the files into a directory, I choose here to put it in my home user directory

```
/home/me/mishkal-master/
```

You need to install requirments

```
pip install /home/me/mishkal-master/requirements.txt
```



You can test it by python 2.7 or python3


To test it with text

```
$python mishkal-master/bin/mishkal-console.py  "السلام عليكم"
 السِّلَام عَلَيْكُمْ
```


Also, You can run it as web server, this option allow you to run it like the online website

```
$python mishkal-master/interfaces/web/mishkal-webserver.py
serving on 0.0.0.0:8080 view at http://127.0.0.1:8080
```

Then, run your browser on URL :  [http://127.0.0.1:8080](http://127.0.0.1:8080)


The webserver provide an API, to be used for developement of other apps.

## Integration

Now, we can proceed to integrate Diacritizer with TTS.

First, we test Festival TTS with Mishkal by using pipe

```
$mishkal "مرحبا أهلا بكم" |text2wave -eval "(voice_ara_norm_ziad_hts)" -o /tmp/out.ar_ziad.wav
$play /tmp/out.ar_ziad.wav

```
## Similar Projects
* [espeak-ng ](http://github.com/espeak-ng/espeak-ng) espeak-ng TTS based on formant, it supports Arabic since 1.49 version 
*[Abdullah Alrajeh](https://github.com/asrajeh/arabic-tts)  Abdullah Alrajeh Arabic TTS for Festival and Flite
[Arabic Tacotron TTS by  Youssef Sharief ](https://github.com/youssefsharief/arabic-tacotron-tts)
[Voice on Mozilla](voice.mozilla.org) 
## Tutorials

#### Add a shortcut for festival TTS to read selection
https://www.youtube.com/watch?v=4uKTamXonPs 