function MergeSort(array) {
  if (array.length == 1) {
    return array;
  }

  let arrayA = array.slice(0, array.length / 2);
  let arrayB = array.slice(array.length / 2);

  arrayA = MergeSort(arrayA);
  arrayB = MergeSort(arrayB);

  return merge(arrayA, arrayB);
}

function merge(arrayA, arrayB) {
  temp = [];

  while (arrayA.length !== 0 && arrayB.length !== 0) {
    if (arrayA[0] < arrayB[0]) {
      temp.push(arrayA[0]);
      arrayA.shift();
    }

    if (arrayA[0] > arrayB[0]) {
      temp.push(arrayB[0]);
      arrayB.shift();
    }
  }

  while (arrayA.length !== 0) {
    temp.push(arrayA[0]);
    arrayA.shift();
  }

  while (arrayB.length !== 0) {
    temp.push(arrayB[0]);
    arrayB.shift();
  }

  return temp;
}

array1 = [1, 4, 2, 5, 7, 3];
console.log(MergeSort(array1));
