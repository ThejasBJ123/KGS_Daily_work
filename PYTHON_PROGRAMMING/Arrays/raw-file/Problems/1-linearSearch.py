# 1.	WAP to check whether the target element is available in the given integer array or not
# Return index.
# Return a Boolean value.

def createIntArray():
    l1 = []
    while True:
        try:
            num = int(input("Enter a num: "))
            l1.append(num)
        except Exception as e:
            return l1

def linearSearch(arr, target):
    for i in range(0, len(arr)):
        if target == arr[i]:
            return i, True 
    return -1, False

print("Enter a values into the array to be created...")
arr = createIntArray()

target = int(input("Enter a element to search: "))
print("The created array is: ", arr)
resInd, flag = linearSearch(arr, target)
if flag:
    print(target,"element is found at index:",resInd)
else:
    print(target,"element is not found at index:")