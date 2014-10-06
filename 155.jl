# Project Euler, Problem #155
# Lucas Garron
# Date: October 05, 2014

startingValue = 60
MAX_DEPTH = 18

valueToDepth = Dict{Rational{Int}, Int}()
valuesAtDepth = [Set{Rational{Int}}() for i = 1:MAX_DEPTH]

function record(n, value)
  if !haskey(valueToDepth, value)
    valueToDepth[value] = n
    push!(valuesAtDepth[n], value)
  end
end

valueToDepth[startingValue] = 1
push!(valuesAtDepth[1], startingValue)
total = 1

for n = 2:MAX_DEPTH
  for i::Int = 1:n/2
    for left in valuesAtDepth[i]
      for right in valuesAtDepth[n - i]
        record(n, left + right)
        record(n, 1 // (
          (1 // left) +
          (1 // right)
        ))
      end
    end
  end

  l = length(valuesAtDepth[n])
  total += l
  println(STDERR, "[depth $n] $l new values (cumulative total: $total)")
  # println("[depth $n] $(valuesAtDepth[n])")
end

print(total)
