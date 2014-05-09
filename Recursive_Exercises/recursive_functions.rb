# Return array of numbers defined by a given range
def range(first, last)
  return [] if first > last
  #base case
  return [first] if first == last

  #chaining step
  range(first, last - 1) << last
end

# Iteratively sum an array of numbers
def sum_arr_iter(arr)
  sum = 0
  arr.each do |item|
    sum += item
  end
  sum
end

# Recursively sum an array of numbers
def sum_arr_rec(arr)
   #base case
   return arr.first if arr.length == 1

   #chaining step
   arr.pop + sum_arr_rec(arr)
end

# Recursively compute a given number raised to a given exponent (uses an n-1 chaining step)
def exp_rec1(num, exp)
  #base case
  return 1 if exp == 0

  #chaining step
  num * exp_rec1(num, exp - 1)
end


# Recursively compute a given number raised to a given exponent (uses an n/2 chaining step)
def exp_rec2(num, exp)
  #base case
  return 1 if exp == 0

  #chaining step
  if exp.even?
    exp_rec2(num, exp / 2) * exp_rec2(num, exp / 2)
  else
    num * exp_rec2(num, exp - 1)
  end
end

# Deeply duplicate an array of objects
def deep_dup(elem)
  #base case
  return elem unless elem.is_a?(Array)

  #chaining step
  duped_arr = []
  elem.each do |item|
    duped_arr << deep_dup(item)
  end

  # elem.map(&:deep_dup)
  duped_arr
end

# Iteratively generate an array of fibonacci numbers
def fib_iter(count)

  fib_arr = []

  fib_arr << 1
  count -= 1

  unless count == 0
    fib_arr << 1
    count -= 1
  end

  count.times do
    fib_arr << fib_arr[-2] + fib_arr[-1]
  end

  fib_arr
end

# Recursively generate an array of fibonacci numbers
def fib_rec(count)

  #base
  return [1] if count == 1
  return [1, 1] if count == 2

  #recursive_call
  # smaller_fibs = fib_rec(count-1)
  fib_rec(count-1) << fib_rec(count-1)[-1] + fib_rec(count-1)[-2]
end

#Make change given a total amount of money and a coin-set
def make_change(amount, coins = [25, 10, 5, 1])
  raise "YOUR COUNTRY SUCKS" unless coins.include?(1)

  sorted_coins = coins.sort.reverse

  return [] if amount == 0

  highest_poss_coin = 0

  #highest coin identified
  highest_poss_coin = sorted_coins.select{ |coin| coin <= amount }.first

  make_change(amount - highest_poss_coin, coins) << highest_poss_coin
end

# Generate an array of all subsets of another array
def subsets(arr)
  return [arr] if arr.empty?

  sub_arr = arr[0...arr.length - 1]
  subsets(sub_arr) + subsets(sub_arr).map { |element| element + [arr.last] }
end


# Scratch on subsets

# def subsets(arr)
#   #debugger
#   return [arr] if arr.empty?
#
# #  [arr] + one_less_permutations(arr).map{ |perm| subsets(perm) }
#   perms = one_less_permutations(arr)
#   perms.inject(arr){|total, perm| total << subsets(perm)}
#
#   #all_subsets.uniq!
#
# end
#
# # uniq
# # array.permutations
# # take last (0...length-1)
#
# def one_less_permutations(arr)
#   return [] if arr.length == 1
#   permutations = []
#   arr.length.times do |i|
#     permutations << arr[0...i] + arr[i + 1...arr.length]
#   end
#   permutations
# end

# [1, 2, 3]
# [[1,2,3]] + subsets



# [[], [1]] + [[], [1]].each do |array|
#     array << the next element
# end


# sub_arr = arr[0...arr.length - 1]
# subsets(sub_arr) + subsets(sub_arr).map do |element|

# element << arr.last
#end