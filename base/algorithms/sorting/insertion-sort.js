function InsertionSort(array) {
  let checkPoint = 0;

  while (checkPoint < array.length - 1) {
    let min = array[checkPoint];
    let swapIndex = null;

    for (i = checkPoint; i < array.length; i++) {
      if (array[i] < min) {
        min = array[i];
        swapIndex = i;
      }
    }

    if (swapIndex !== null) {
      // Swap between checkPoint and swapIndex
      tmp = array[swapIndex];
      array[swapIndex] = array[checkPoint];
      array[checkPoint] = tmp;
    }

    checkPoint += 1;
  }

  return array;
}

array1 = [1, 4, 2, 5, 7, 3];
console.log(InsertionSort(array1));
