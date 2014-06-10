chai = require 'chai'
Kennitala = require '../src/kennitala'
chai.should()

describe 'Kennitala validation', ->

  valid = '1201603389'
  invalid = '8201603389'

  it 'should validate', ->
    Kennitala.validate(valid).should.equal true
    Kennitala.validate(invalid).should.equal false

  it 'should accept input with hupen splitting date and other numbers', ->
    Kennitala.validate('120160-3389').should.equal true
    Kennitala.validate('1-201603389').should.equal false

  it 'should trim whitespace', ->
    Kennitala.validate('  ' + valid + '  ').should.equal true
    Kennitala.validate(valid.split('').join(' ')).should.equal true

  it 'should generate and validate', ->
    date = new Date("January 12, 1960")
    for i in [0..300]
      kt = Kennitala.generate(date)
      Kennitala.validate(kt).should.equal true

  it 'should validate that the number of days is correct', ->
    # A month dose not have 0 or 32 days.
    Kennitala.validate('3201000030').should.equal false
    Kennitala.validate('0001000050').should.equal false

  it 'should validate that the month number is correct', ->
    # There is no month number 0 or 13.
    Kennitala.validate('0100000090').should.equal false
    Kennitala.validate('0113000060').should.equal false

  it 'should validate only correct leap years', ->
    # 2008 was a leap year. 2009 was no a leap year.
    Kennitala.validate('2902080090').should.equal true
    Kennitala.validate('2902090050').should.equal false

  it 'should validate only correct millenium leap years', ->
    # 2000 was a leap year. 1900 was no a leap year.
    Kennitala.validate('2902000089').should.equal false
    Kennitala.validate('2902000080').should.equal true