# Project Euler, Problem #155
# Lucas Garron
# Date: October 05, 2014

startingValue = 60
MAX_DEPTH = 18
IntType = Int
RationalType = Rational{IntType}
SetType = Set{RationalType}

valueToDepth = Dict{RationalType, IntType}()
valuesAtDepth = [Set{Rational{IntType}}() for i = 1:MAX_DEPTH]

valueToDepth[startingValue] = 1
push!(valuesAtDepth[1], startingValue)

function record(n, value)
  if !haskey(valueToDepth, value)
    valueToDepth[value] = n
    push!(valuesAtDepth[n], value)
  end
end

total = 1

for n = 2:MAX_DEPTH
  for i::Int = 1:n/2
    for left in valuesAtDepth[i]
      for right in valuesAtDepth[n - i]
        record(n, left + right)
        record(n,
          1 // (
            (1 // left) +
            (1 // right)
          )
        )
      end
    end
  end
  l = length(valuesAtDepth[n])
  write(STDERR, "[depth $n] $l\n")

  total += l
  write(STDERR, "[depth $n] Total: $total\n")
  #print("[depth ", n, "] ", valuesAtDepth[n], "\n")
end

print(total)
