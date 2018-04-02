build:
	node_modules/.bin/webpack

shadow-deploy:
	aws s3 sync --acl public-read --exclude index.html site/ s3://preview.data.humancellatlas.org/
	aws s3 cp --acl public-read site/index.html s3://preview.data.humancellatlas.org/index2.html

shadow-deploy-cc:
	aws s3 sync --acl public-read --exclude index.html site/ s3://preview.data.humancellatlas.org/ --profile hca
	aws s3 cp --acl public-read site/index.html s3://preview.data.humancellatlas.org/index2.html --profile hca

deploy:
	aws s3 sync --acl public-read site/ s3://preview.data.humancellatlas.org/
