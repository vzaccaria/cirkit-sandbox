
build-container:
	docker build . -t cirkit-latest

# MOO=docker run -v $(PWD):/root/local -w /root/local --rm --entrypoint "/root/moore/target/debug/moore" llhd-latest run

# all: keccak.llhd

# %.llhd: %.v
# 	$(MOO) $< -e "keccak_sbox" > $@

# clean: 
# 	rm -f *.llhd

