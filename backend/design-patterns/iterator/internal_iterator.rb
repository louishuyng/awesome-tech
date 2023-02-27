def for_each_element(array)
  copy = Array.new(array)

  i = 0
  while i < copy.length
    yield(copy[i])
    i += 1
  end
end

array = %w[red green blue]
for_each_element(array) { |element| puts("item: #{element}") }
