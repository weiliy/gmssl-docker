GMSSL_REPO=git@github.com:guanzhi/GmSSL.git

docker: docker-build

docker-%: GmSSL
docker-%: GMSSL_BRANCH=$(shell cd GmSSL && git rev-parse --abbrev-ref HEAD)
docker-%: GMSSL_COMMIT=$(shell cd GmSSL && git rev-parse --short HEAD)
docker-build:
	docker build . -t weiliy/gmssl:$(GMSSL_BRANCH)-$(GMSSL_COMMIT) -t weiliy/gmssl:latest

docker-push: docker-build
	docker push weiliy/gmssl:$(GMSSL_BRANCH)-$(GMSSL_COMMIT)
	docker push weiliy/gmssl:latest

GmSSL:
	git clone $(GMSSL_REPO) GmSSL
