This is an utility library for the Icelandic national identification number scheme.

[![Build Status](https://secure.travis-ci.org/StefanKjartansson/kennitala-js.png)](http://travis-ci.org/StefanKjartansson/kennitala-js)

## Usage

    Kennitala = require('kennitala');
    Kennitala.validate('0101012239');
    Kennitala.generate(new Date()); //Generates a valid ssid for the given date, useful for testing

## Browser

Include the minified library and a Kennitala object should be available.

## Development

    git pull http://github.com/StefanKjartansson/kennitala-js.git
    npm install
    make

## Testing

    make test
