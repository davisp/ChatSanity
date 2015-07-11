all:
	rm -rf ./ChatSannity
	mkdir -p ./ChatSannity
	cp ChatSannity.* ./ChatSannity/
	zip -r ChatSannity-v`git describe --tags`.zip ./ChatSannity

clean:
	rm -rf ./ChatSannity
	rm -f ./ChatSannity-v*.zip
