clean:
	rm -rf .sass-cache
	rm -rf _site/
	clear

serve:
	make clean
	open http://127.0.0.1:4000/
	jekyll serve