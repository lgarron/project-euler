# Project Euler, Problem #4
# Lucas Garron
# Date: March 05, 2014

function isProductOfThreeDigitNumbers(x::Int)
  for i in 999:-1:100
    if x % i == 0 && 100 <= div(x, i) <= 999
      return true
    end
  end
  return false
end

function undigits(l::Array{Int})
  return reduce((x, y) -> x*10 + y, 0, l)
end

function compute()
  for i in 9:-1:1
    for j in 9:-1:0
      for k in 9:-1:0
        num = undigits([i, j, k, k, j, i])
        if isProductOfThreeDigitNumbers(num)
          return num
        end
      end
    end
  end
end

########

tic()
answer = compute()
toc()

print(answer)

########

# function isPalindromic(x::Int)
#   d = digits(x)
#   return d == reverse(d)
# end

#########

# range = 100:999

# products = [x * y for x in range, y in range]
# palindromes = filter(isPalindromic, products)
# answer = maximum(palindromes)
# println(answer)

#########

# function isProductOfThreeDigitNumbers(x)
#   for i in 999:-1:100
#     if x % i == 0 && 100 < div(x, i) <= 999
#       return true
#     end
#   end
#   return false
# end

# for i in 999999:-1:1
#   if isPalindromic(i) && isProductOfThreeDigitNumbers(i)
#     println(i)
#     break
#   end
# end

#########

# range = [false for i in 1:999999]

# for i in 100:999
#   for j in i:999
#     range[i * j] = true
#   end
# end

# for i in 999999:-1:1
#   if range[i] && isPalindromic(i)
#     println(i)
#     break
#   end
# end

#########

# max = 0

# for i in 100:999
#   for j in i:999
#     product = i * j
#     if isPalindromic(product) && product > max
#       max = product
#     end
#   end
# end

# println(max)
