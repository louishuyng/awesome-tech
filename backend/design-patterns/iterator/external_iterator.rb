# frozen_string_literal: true

class ArrayIterator
  def initialize(array)
    @array = Array.new(array)
    @index = 0
  end

  def next?
    @index < @array.length
  end

  def item
    @array[@index]
  end

  def next_item
    value = @array[@index]
    @index += 1
    value
  end
end

array = %w[red green blue]
i = ArrayIterator.new(array)
puts("item: #{i.next_item}") while i.next?

def merge(array1, array2)
  merged = []
  iterator1 = ArrayIterator.new(array1)
  iterator2 = ArrayIterator.new(array2)

  while iterator1.next? && iterator2.next?
    merged << if iterator1.item < iterator2.item
                iterator1.next_item
              else
                iterator2.next_item
              end
  end
  # Pick up the leftovers from array1
  merged << iterator1.next_item while iterator1.next?
  # Pick up the leftovers from array2
  merged << iterator2.next_item while iterator2.next?
  merged
end

i = ArrayIterator.new(merge([1, 5, 7], [2, 3, 6, 8]))
puts("sorted item: #{i.next_item}") while i.next?
