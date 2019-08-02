STAGING_BUCKET := s3://preview.staging.data.humancellatlas.org/
PRODUCTION_BUCKET := s3://preview.data.humancellatlas.org/

build:
	node_modules/.bin/webpack

deploy-prod:
	$(MAKE) build
	aws s3 sync --acl public-read site/ $(PRODUCTION_BUCKET) --profile hca
	@read -p "Enter production cloudfront distribution id: " DIST_ID; aws cloudfront create-invalidation --distribution-id $$DIST_ID --paths "/*" --profile hca-prod

deploy-staging:
	$(MAKE) build
	aws s3 sync --acl public-read site/ $(STAGING_BUCKET) --profile hca

deploy-staging-travis:
	aws s3 sync --acl public-read site/ $(STAGING_BUCKET)
	aws cloudfront create-invalidation --distribution-id ${DIST_ID} --paths "/*"

deploy-staging-local:
	$(MAKE) build
	aws s3 sync --acl public-read site/ $(STAGING_BUCKET) --profile hca-dev
	aws cloudfront create-invalidation --distribution-id E1EZZGGNHSUEIT --paths "/*" --profile hca-dev

deploy-prod-local:
	$(MAKE) build
	aws s3 sync --acl public-read site/ $(PRODUCTION_BUCKET) --profile hca-admin
	aws cloudfront create-invalidation --distribution-id E1YL6ZB4Q5JK1Y --paths "/*" --profile hca-admin