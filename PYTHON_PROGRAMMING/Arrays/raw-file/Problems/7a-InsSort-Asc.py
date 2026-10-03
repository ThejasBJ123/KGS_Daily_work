# Insertion sort in Ascending Order 

def createIntarray():
    l1 = []
    while True:
        try:
            val = int(input("Enter a Value: "))
            l1.append(val)
        except Exception as e:
            return l1

def InsertionSortAsc(arr):
    n = len(arr)
    for i in range(0, n - 1):
        for j in range(i + 1, 0, -1):
            if arr[j-1] > arr[j]:
                arr[j-1], arr[j] = arr[j], arr[j-1]
    

print("Enter an array to be created (enter any non-number to stop)...")
arr = createIntarray()
print("The created array is:", arr)

InsertionSortAsc(arr)
print("The Insertion Sorted array in Ascending Order is:", arr)