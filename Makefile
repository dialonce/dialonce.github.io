deps:
	gem install bundler	
	bundle install

run:
	bundle exec jekyll serve

clean:
	rm -rf _site _drafts
