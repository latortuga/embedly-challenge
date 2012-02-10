# fac.rb - find the lowest n where the digits in n! sum to 8001
@cache = {}

def fac(n)
  if @cache[n]
    return @cache[n]
  end

  if n <= 1
    1
  else
    result = n * fac(n-1)
    @cache[n] = result
    return result
  end
end

n = 1
result = 0

while result < 8001
  result = fac(n).to_s.each_char.map{|i|i.to_i}.inject(0,:+)
  puts n and break if result >= 8001
  n += 1
end
