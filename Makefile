usage:
	@echo "Please choose a build target"

.PHONY: all clean clone website-up android-up iphone-up

all: website-pull android-pull iphone-pull 
	make -C booktrader-website/ all
	make -C booktrader-android-client/ all
	make -C booktrader-iphone-client/ all

clean:
	-make -C booktrader-website/ clean
	-make -C booktrader-android-client/ clean
	-make -C booktrader-iphone-client/ all

up: website-pull android-pull iphone-pull
	
website-pull: booktrader-website/.git/config
	cd booktrader-website && git pull

android-pull: booktrader-android-client/.git/config
	cd booktrader-android-client && git pull

iphone-pull: booktrader-android-client/.git/config
	cd booktrader-iphone-client && git pull

booktrader-website/.git/config:
	git clone git@github.com:BookTrader/booktrader-website.git

booktrader-android-client/.git/config:
	git clone git@github.com:BookTrader/booktrader-android-client.git

booktrader-iphone-client/.git/config:
	git clone git@github.com:BookTrader/booktrader-iphone-client.git

