.PHONY: all install test minify

all: install test

install:
	npm install

minify: markdown-tg.min.js

FIND_TESTS := find __tests__ -type f -regex '.*\.js'

test:
	$(FIND_TESTS) | xargs ./node_modules/.bin/mocha --reporter spec
shorttest:
	$(FIND_TESTS) | xargs ./node_modules/.bin/mocha --reporter dot

markdown-tg.min.js: markdown-tg.js
	uglifyjs markdown-tg.js > markdown-tg.min.js
