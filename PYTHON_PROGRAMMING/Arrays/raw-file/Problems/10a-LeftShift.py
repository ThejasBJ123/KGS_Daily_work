# Left Shifted array


def createIntarray():
    l1 = []
    while True:
        try:
            val = int(input("Enter a Value: "))
            l1.append(val)
        except Exception:
            return l1

def ReverseArray2(arr,i,j):
    while i < j:
        arr[i], arr[j] = arr[j], arr[i]
        i += 1
        j -= 1

def leftShift(arr, k):
    n = len(arr)

    #step-1
    ReverseArray2(arr, 0,(k-1))
    
    #step-2
    ReverseArray2(arr,k,(n-1))
    
    #step-3
    ReverseArray2(arr, 0, (n-1))

print("Enter array elements to be created: ")
arr = createIntarray()
print("The created array is:", arr)

k = int(input("Enter how many rotation want to achieve: "))
leftShift(arr,k)
print("The left Rotation of array is: ",arr)