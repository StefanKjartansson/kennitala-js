all: test build

build:
	@coffee -o . src/*.coffee
	uglifyjs -c -o kennitala.min.js kennitala.js

test: .PHONY
	./node_modules/.bin/mocha --compilers coffee:coffee-script test/*.coffee

.PHONY:
