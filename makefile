CK=docker run -v $(PWD):/root/local -w /root/local --rm --entrypoint "/root/cirkit/build/cli/cirkit" cirkit-latest 

build-container:
	docker build . -t cirkit-latest

connect-to-container:
	docker run -ti --rm cirkit-latest /bin/bash

