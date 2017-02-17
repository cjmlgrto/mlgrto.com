clean:
	@rm -rf _site/
	@rm -rf .sass-cache/

serve:
	@jekyll serve

build:
	@jekyll build
	@rm -rf .sass-cache/

push:
	@s3_website push

install:
	@touch .env
	@echo "S3_ID=" >> .env
	@echo "S3_SECRET=" >> .env
	@echo "S3_BUCKET=" >> .env
	@echo "S3_ENDPOINT=" >> .env
	@echo "CLOUDFRONT_DIST_ID=" >> .env
	@gem install jekyll
	@gem install s3_website
	@echo "All setup now! Run 'make serve' to view the site."