clean:
	@rm -rf _site/
	@rm -rf .sass-cache/

serve:
	@jekyll serve

build:
	@jekyll build
	@rm -rf .sass-cache/

push:
	git add --all && git commit
	s3_website push