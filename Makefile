GMSSL_REPO=git@github.com:guanzhi/GmSSL.git

docker: GmSSL
docker: GMSSL_BRANCH=$(shell cd GmSSL && git rev-parse --abbrev-ref HEAD)
docker: GMSSL_COMMIT=$(shell cd GmSSL && git rev-parse --short HEAD)
docker:
	docker build . -t weiliy/gmssl:$(GMSSL_BRANCH)-$(GMSSL_COMMIT)

GmSSL:
	git clone $(GMSSL_REPO) GmSSL
