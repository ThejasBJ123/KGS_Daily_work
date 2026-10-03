# 4.	WAP to sort a given array using Selection Sort in Ascending Order

def createIntarray():
    l1 = []
    while True:
        try:
            n = int(input("Enter a num: "))
            l1.append(n)
        except Exception:
            return l1

def selectionSortAsc(arr):
    n = len(arr)
    # Cycles: placing the current maximum at the end of the unsorted segment
    for i in range(0, n - 1):
        actualInd = n - 1 - i
        currMaxInd = 0
        currMaxEle = -(2 ** 31)
        for j in range(0, n - i):
            if arr[j] > currMaxEle:
                currMaxEle = arr[j]
                currMaxInd = j
        arr[actualInd], arr[currMaxInd] = arr[currMaxInd], arr[actualInd]
    return arr


# Main program
print("Enter an array to be created (enter any non-number to stop)...")
arr = createIntarray()
print("The created array is:", arr)

# Fixed case: selectionSortAsc instead of selectionsortasc
selectionSortAsc(arr)
print("Sorted Array:", arr)