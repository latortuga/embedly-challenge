X = 2520

def zipf_for(n)
  if n == 0
    X
  else
    X / (n+1)
  end
end

total_words = 0.upto(899).map {|y| zipf_for(y)}.inject(0,:+)

sum = 0
n = 0

while sum < (total_words / 2)
  sum += zipf_for(n)
  n += 1
end

# add one of course, it's the n+1th element!
puts n+1
