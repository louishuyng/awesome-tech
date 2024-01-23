function BubbleSort(array) {
  lastIndex = array.length - 1;

  while (lastIndex >= 0) {
    max = array[lastIndex];

    for (i = 0; i <= lastIndex; i++) {
      if (array[i] > max) {
        // Reassign max
        max = array[i];

        // Swap between array[i] and array[lastIndex]
        tmp = array[i];
        array[i] = array[lastIndex];
        array[lastIndex] = tmp;
      }
    }

    lastIndex -= 1;
  }

  return array;
}

array1 = [1, 4, 2, 5, 7, 3];
console.log(BubbleSort(array1));
