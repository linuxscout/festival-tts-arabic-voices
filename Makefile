# Makefile

VOICE_PACKAGE=ara_norm_ziad_hts
VOICE=ara_norm_ziad_hts
FESTIVAL_VOICES_DIR=/usr/share/festival/voices
FESTIVAL_LANGUAGES_DIR=/usr/share/festival/languages
MISHKAL=mishkal
all: test build

test:
	echo "السَّلَامُ عَلَيْكُمْ" | text2wave -eval "(voice_$(VOICE))"  -o /tmp/out.ar_ziad.wav
	play /tmp/out.ar_ziad.wav

test_tashkeel:
	$(MISHKAL) "مرحبا أهلا بكم" |text2wave -eval "(voice_$(VOICE))" -o /tmp/out.ar_ziad.wav
	play /tmp/out.ar_ziad.wav
test_file:
	$(MISHKAL) -f tests/samples/text1.txt |text2wave -eval "(voice_$(VOICE))" -o /tmp/out.ar_ziad.wav
	play /tmp/out.ar_ziad.wav
tashkeel:
	$(MISHKAL) "مرحبا أهلا بكم"
build: 

install:
	# Installing shared data
	echo "install"
	sudo cp languages/language_arabic.scm  $(FESTIVAL_LANGUAGES_DIR)

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
