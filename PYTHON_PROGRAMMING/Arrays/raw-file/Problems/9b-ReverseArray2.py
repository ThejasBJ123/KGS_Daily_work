# Logic-2 Reversal of an array using two pointers 

def createIntarray():
    l1 = []
    while True:
        try:
            val = int(input("Enter a Value: "))
            l1.append(val)
        except Exception:
            return l1

def ReverseArray2(arr):
    i, j = 0, len(arr) - 1
    while i < j:
        arr[i], arr[j] = arr[j], arr[i]
        i += 1
        j -= 1


print("Enter array elements to be created: ")
arr = createIntarray()
print("The created array is:", arr)

ReverseArray2(arr)
print("The Reversed Array (Logic2):", arr)