# 4.	WAP to sort a given array using Selection Sort in descending Order

def createIntarray():
    l1 = []
    while True:
        try:
            n = int(input("Enter a num: "))
            l1.append(n)
        except Exception:
            return l1

def selectionSortDesc(arr):
    n = len(arr)
    # Cycles: placing the current minimum at the end of the unsorted segment
    for i in range(0, n - 1):
        actualInd = n - 1 - i
        currMinInd = 0
        currMinEle = 2 ** 31
        for j in range(0, n - i):
            if arr[j] < currMinEle:
                currMinEle = arr[j]
                currMinInd = j
        arr[actualInd], arr[currMinInd] = arr[currMinInd], arr[actualInd]
    return arr


# Main program
print("Enter an array to be created (enter any non-number to stop)...")
arr = createIntarray()
print("The created array is:", arr)

selectionSortDesc(arr)
print("Sorted Array (Descending):", arr)