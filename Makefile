clean:
	@rm -rf .sass-cache/
	@rm -rf _site/

serve:
	@jekyll serve

build:
	@jekyll build
	@rm -rf .sass-cache/