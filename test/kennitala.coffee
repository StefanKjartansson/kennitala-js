chai = require 'chai'
chai.should()

Kennitala = require '../src/kennitala'

describe 'Kennitala validation', ->
  it 'should validate', ->
    Kennitala.validate('1201603389').should.equal true
    Kennitala.validate('120160-3389').should.equal true
    Kennitala.validate('  1201603389  ').should.equal true
    Kennitala.validate('  120160  3389  ').should.equal true
    Kennitala.validate('8201603389').should.equal false

  it 'should generate and validate', ->
    date = new Date("January 12, 1960")
    for i in [0..300]
      kt = Kennitala.generate(date)
      Kennitala.validate(kt).should.equal true
