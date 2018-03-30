build:
	node_modules/.bin/webpack

deploy:
	# aws s3 sync --acl public-read site/ s3://preview.data.humancellatlas.org/
	aws s3 sync --acl public-read --exclude index.html site/ s3://preview.data.humancellatlas.org/
	aws s3 cp --acl public-read site/index.html s3://preview.data.humancellatlas.org/index2.html
