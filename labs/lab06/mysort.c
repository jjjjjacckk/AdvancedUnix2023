// TOKEN = 1psx2SHMKjCaNhIT

typedef void (*sort_funcptr_t)(long *numbers, int n);
sort_funcptr_t quick_sort(long *arr, int size) {
    long lPivot = arr[size-1];
    int lIndexOfLargestElement = 0;

    for (int i = 0; i < size-1; i++) {
        if (arr[i] < lPivot) {
            // Swap largest element with this
            long lTmp = arr[i];
            arr[i] = arr[lIndexOfLargestElement];
            arr[lIndexOfLargestElement]  = lTmp;
            lIndexOfLargestElement++;
        }
    }

    // swap pivot with arr[lIndexOfLargestElement]
    long lTmp = arr[lIndexOfLargestElement];
    arr[lIndexOfLargestElement] = arr[size-1];
    arr[size-1] = lTmp;
    if (lIndexOfLargestElement > 1)
        quick_sort(arr, lIndexOfLargestElement);
    if (size-lIndexOfLargestElement-1 > 1)
        quick_sort(arr+lIndexOfLargestElement+1, size-lIndexOfLargestElement-1);
}


// sort_funcptr_t insertionSort(long *arr, int n) {
//     for (int i = 1; i < n; i++) {
//         int j = i;
//         while (j > 0 && arr[j - 1] > arr[j]) {
//             long temp = arr[j];
//             arr[j] = arr[j - 1];
//             arr[j - 1] = temp; 
//             j--;
//         }
//     }
// }


// sort_funcptr_t bubbleSort(long *arr, int n) {
//   for (int i = 0; i < n; ++i) {
//     for (int j = 0; j < i; ++j) {
//       if (arr[j] > arr[i]) {
//         long temp = arr[j];
//         arr[j] = arr[i];
//         arr[i] = temp;
//       }
//     }
//   }
// }

// void sort_funcptr_t(long *numbers, int n) {
//     // quick_sort(numbers, 0, n-1);
//     insertion_sort(numbers, n);
// }

int main() {

//    qsort(values, 5, sizeof(long), cmpfunc)
    long numbers[] = {574036733,-176097072,1147797879,-1065448594,-1099813914,-408247897,-2059854827};
    quick_sort(numbers, 7);
    for (int a = 0; a < 7; ++a) {
        printf("%ld ", numbers[a]);
    }
  
    // printf("\n");
    return(0);
}

