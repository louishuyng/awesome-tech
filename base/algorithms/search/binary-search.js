function BinarySearch(array, target) {
  result = -1

  left = 0
  right = array.length - 1

  while (left <= right) {
    mid = Math.round((left + right) / 2)
    midValue = array[mid]

    if (target < midValue) {
      right = mid - 1
    } else if (target > midValue) {
      left = mid + 1
    } else {
      result = mid
      break
    }
  }

  return result
}

array1 = [5, 7, 7, 8, 8, 10];
console.log(BinarySearch(array1, 10));
