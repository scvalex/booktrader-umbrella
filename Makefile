BASE_URL:=$(shell dirname `git remote -v | grep fetch | cut -d'	' -f2 | cut -d' ' -f1`)

usage:
	@echo "Please choose a build target"

.PHONY: all clean clone verbose pull website-pull android-pull iphone-pull

all: website-pull android-pull iphone-pull 
	make -C booktrader-website/ all
	make -C booktrader-android-client/ all
	make -C booktrader-iphone-client/ all

clean:
	-make -C booktrader-website/ clean
	-make -C booktrader-android-client/ clean
	-make -C booktrader-iphone-client/ all

pull: website-pull android-pull iphone-pull
	
website-pull: booktrader-website/.git/config
	cd booktrader-website && git pull

android-pull: booktrader-android-client/.git/config
	cd booktrader-android-client && git pull

iphone-pull: booktrader-iphone-client/.git/config
	cd booktrader-iphone-client && git pull

booktrader-website/.git/config:
	git clone $(BASE_URL)/booktrader-website.git

booktrader-android-client/.git/config:
	git clone $(BASE_URL)/booktrader-android-client.git

booktrader-iphone-client/.git/config:
	git clone $(BASE_URL)/booktrader-iphone-client.git

verbose:
	@echo $(BASE_URL)

