validate = (kt) ->
  kt = kt.replace(/\s/g, '').replace(/^(\d{6})[\s-]?(\d{4})$/, '$1$2')
  if kt.length != 10 or !/[90]$/.test(kt)
    return false
  if /010130(2(12|20|39|47|55|63|71|98)|3(01|36)|4(33|92)|506|778)9/.test(kt)
    return false
  x = [3,2,7,6,5,4,3,2,1].reverse()
  if (((+i * x[n]) for i, n in kt.split('').reverse()[1..9]).reduce (x, y) -> x + y) % 11
    return false
  return true

getRandom = () ->
  rnd = Math.floor((Math.random()*99)+1)
  if String(rnd.length) == 1
    return [0, rnd]
  return (+i for i in String(rnd).split '')

dateToArray = (date) ->
  stack = []
  d = String(date.getDay())
  stack.push(if d.length == 1 then "0#{d}" else d)
  m = String(date.getMonth() + 1)
  stack.push(if m.length == 1 then "0#{m}" else m)
  yr = String(date.getFullYear())
  stack.push(yr[2..])
  return stack.join('').split ''

generate = (date) ->
  stack = dateToArray date
  valid = false
  while (not valid)
    rnd = getRandom()
    kt = (+i for i in stack.join '').concat rnd
    sum = 0
    for i, n in [2,3,4,5,6,7,2,3].reverse()
      sum += kt[n] * i
    remainder = sum % 11
    chk = 11 - remainder
    if remainder == 0
      chk = 0
    if chk < 10
      stack.push(rnd.join '')
      stack.push(chk)
      stack.push(String(date.getFullYear())[1])
      valid = true
  return stack.join ''

Kennitala = exports? and exports or @Kennitala = {}
Kennitala.validate = validate
Kennitala.generate = generate
