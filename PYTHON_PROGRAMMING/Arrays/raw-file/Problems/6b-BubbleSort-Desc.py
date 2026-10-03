# Bubble Sort descending order

def createIntarray():
    l1 = []
    while True:
        try:
            val = int(input("Enter a Value: "))
            l1.append(val)
        except Exception as e:
            return l1

def bubbleSortdesc(arr):
    n = len(arr)
    for i in range(0, n - 1):
        for j in range(0, n - 1 - i):
            if arr[j] < arr[j + 1]:
                arr[j], arr[j+1] = arr[j+1], arr[j]
    

print("Enter an array to be created (enter any non-number to stop)...")
arr = createIntarray()
print("The created array is:", arr)

bubbleSortdesc(arr)
print("The Descending Bubble Sorted array is:", arr)