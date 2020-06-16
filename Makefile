# Makefile

SCRIPTS = ""
VOICE_PACKAGE=ara_norm_ziad_hts
VOICE=ara_norm_ziad_hts
FESTIVAL_VOICES_DIR=/usr/share/festival/voices
MISHKAL=python3 ~/projects/mishkal-project/mishkal-2017-03-19/bin/mishkal-console.py
all: test build

test:
	echo "waraj~aHa Alt~aqoriyru Al~a*iy >aEad~ahu maEohadu >aboHaA^i haDabapi Alt~ibiti fiy Alo>akaAdiymiy~api AlS~iyniy~api liloEuluwmi sil >ano tasotamir~a darajaAtu AloHaraArapi wamusotawayaAtu Alr~uTuwbapi fiy Alo<irotifaAEi TawaAla ha*aA Aloqarono" | text2wave -eval "(voice_$(VOICE))" -o /tmp/out.ar_ziad.wav
	play /tmp/out.ar_ziad.wav
test2:
	$(MISHKAL) "مرحبا أهلا بكم" |text2wave -eval "(voice_$(VOICE))" -o /tmp/out.ar_ziad.wav
	play /tmp/out.ar_ziad.wav
test3:
	#$(MISHKAL) "مرحبا أهلا بكم" | xargs  -r0 python3 script/utf2tim.py | text2wave -eval "(voice_$(VOICE))" -o /tmp/out.ar_ziad.wav
	#play /tmp/out.ar_ziad.wav
test4:
	$(MISHKAL) -f tests/samples/text1.txt |text2wave -eval "(voice_$(VOICE))" -o /tmp/out.ar_ziad.wav
	play /tmp/out.ar_ziad.wav
test_mishkal:
	$(MISHKAL) "مرحبا أهلا بكم"
test_bw:
	python3 script/utf2tim.py "مرحبا أهلا بكم"
test_mishkal_bw:
	$(MISHKAL) "مرحبا أهلا بكم" | xargs  -r0 python3 script/utf2tim.py
build: 

install:
	# Installing shared data
	echo "install"
	cp releases/$(VOICE_PACKAGE).zip /tmp/
	cd /tmp; unzip /tmp/$(VOICE_PACKAGE).zip
	sudo mkdir -p $(FESTIVAL_VOICES_DIR)/arabic
	sudo cp  -r /tmp/$(VOICE_PACKAGE) $(FESTIVAL_VOICES_DIR)/arabic/
	rm -r /tmp/$(VOICE_PACKAGE)
uninstall:

	# Uninstalling shared data
	
		
	# Uninstalling executables
	
clean:

distclean:

reinstall: uninstall install
publish:
	git push origin master
