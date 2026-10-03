# Logic-3 : Reversal of an array using a formula 

def createIntarray():
    l1 = []
    while True:
        try:
            val = int(input("Enter a Value: "))
            l1.append(val)
        except Exception:
            return l1

def ReverseArray3(arr):
    n = len(arr)
    for i in range(0, n // 2):
        arr[i], arr[n - 1 - i] = arr[n - 1 - i], arr[i]

print("Enter array elements to be created: ")
arr = createIntarray()
print("The created array is:", arr)

ReverseArray3(arr)
print("The Reversed Array (Logic3):", arr)