# Logic-1 Reversal of an array by using 3rd variable or memory 

def createIntarray():
    l1 = []
    while True:
        try:
            val = int(input("Enter a Value: "))
            l1.append(val)
        except Exception:
            return l1

def ReverseArray1(arr):
    res = []
    for i in range(len(arr)-1, -1, -1):
        res.append(arr[i])
    return res


print("Enter array elements to be created: ")
arr = createIntarray()
print("The created array is:", arr)

res = ReverseArray1(arr)
print("The Reversed Array (Logic1):", res)