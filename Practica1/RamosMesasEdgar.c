#include<stdio.h>
#include<stdlib.h>

void fill(int arr[], int n);
void swap (int *x, int *y);
void bubble(int arr[], int n);
void printArray(int arr[], int size);

int main(){
    int arr1[50];
    int n = sizeof(arr1)/sizeof(arr1[0]);
    fill(arr1, n);
    printf("Unsorted array: \n");
    printArray(arr1, n);
    bubble(arr1, n);
    printf("Sorted array: \n");
    printArray(arr1, n);
    return 0;
}

void fill(int arr[], int n){
    int i = 0;
    for( i = 0 ; i < n ; i++ ) 
        arr[i] = rand() % 200;
}

void swap(int *x, int *y){
    int temp =  *x;
    *x = *y;
    *y = temp;
}

void bubble(int arr[], int n){
    int i,j;
    for(i = 0; i < n-1 ; i++)
        for (j = 0; j < n-i-1 ; j++)
            if (arr[j] > arr[j+1] )
                swap(&arr[j], &arr[j+1]);
}

void printArray(int arr[], int size){
    int i; 
    for (i = 0; i < size; i++) 
        printf("%d ", arr[i]); 
    printf("\n"); 
}