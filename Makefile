all:
	rm -rf ./ChatSanity
	mkdir -p ./ChatSanity
	cp ChatSanity.* ./ChatSanity/
	zip -r ChatSanity-v`git describe --tags`.zip ./ChatSanity

clean:
	rm -rf ./ChatSanity
	rm -f ./ChatSanity-v*.zip
