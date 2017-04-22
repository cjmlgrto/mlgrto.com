task :clean do
	system "rm -rf _site/"
	system "rm -rf .sass-cache/"
end

task :serve do
	system "jekyll serve"
end

task :build do
	system "jekyll build"
	system "rm -rf .sass-cache/"
end

task :deploy do
	system "s3_website push"
end

task :setup do
	system "touch .env"
	system "echo 'S3_ID=' >> .env"
	system "'echo S3_SECRET=' >> .env"
	system "'echo S3_BUCKET=' >> .env"
	system "'echo S3_ENDPOINT=' >> .env"
	system "'echo CLOUDFRONT_DIST_ID=' >> .env"
	puts "All setup now! Run `rake serve` to preview the site"
end