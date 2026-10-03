# Order-Agnostic Binary Search

def createIntarray():
    l1 = []
    while True:
        try:
            val = int(input("Enter a Value: "))
            l1.append(val)
        except Exception as e:
            return l1

def OrderAgnosticBinarySearch(arr, target):

    start = 0
    end = len(arr) - 1
    flag = "asc"
    if arr[start] > arr[end]:
        flag = "desc"

    while start <= end:
        mid = (start + end) // 2

        if target == arr[mid]:
            return mid

        if flag == "asc":
            if target < arr[mid]:
                end = mid - 1
            else:
                start = mid + 1
        else:
            if target < arr[mid]:
                start = mid + 1
            else:
                end = mid - 1
    return -1


print("Enter an array elements to be created in Descending Order:")
arr = createIntarray()
print("The created array is:", arr)

target = int(input("Enter the elements to be searched: "))
resInd = OrderAgnosticBinarySearch(arr,target)

if resInd != -1:
    print(target,"is found at index: ",resInd)
else:
    print(target,"is not found")