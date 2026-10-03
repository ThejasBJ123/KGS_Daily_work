# -	WAP to merge the given 2 ASC sorted arrays into a DESC sorted array.

def createIntArray():
    l = []
    while True:
        try:
            val = int(input("Enter a value: "))
            l.append(val)
        except Exception as e:
            return l

def mergeArrayAscToDesc(arr1,arr2):
    res = []
    i = len(arr1) - 1
    j = len(arr2) - 1
    
    n1 = len(arr1)
    n2 = len(arr2)
    for k in range(0, (n1 + n2)):
        if i >= 0 and j >= 0:
            if arr1[i] >= arr2[j]:
                res.append(arr1[i])
                i -= 1
            else:
                res.append(arr2[j])
                j -= 1
        elif i >= 0:
            res.append(arr1[i])
            i -= 1
        elif j >= 0:
            res.append(arr2[j])
            j -= 1
    return res 



print("Enter elements for array1 in Ascending order:")
arr1 = createIntArray()

print("Enter elements for array2 in Ascending order:")
arr2 = createIntArray()

res = mergeArrayAscToDesc(arr1,arr2)
print("Merged DESC array is:", res)