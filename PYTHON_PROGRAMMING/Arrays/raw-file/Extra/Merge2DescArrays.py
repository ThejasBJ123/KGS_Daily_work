# -	WAP to merge the given 2 DESC sorted arrays into a DESC array

def createIntArray():
    l = []
    while True:
        try:
            val = int(input("Enter a Value: "))
            l.append(val)
        except Exception:
            return l

def mergearrayDesc(arr1, arr2):
    res = []
    i, j = 0, 0
    n1, n2 = len(arr1), len(arr2)

    for k in range(n1 + n2):
        if i < n1 and j < n2:
            if arr1[i] >= arr2[j]:
                res.append(arr1[i])
                i += 1
            else:
                res.append(arr2[j])
                j += 1

        elif i < n1:
            res.append(arr1[i])
            i += 1

        else:
            res.append(arr2[j])
            j += 1

    return res

print("Enter elements into first DESC sorted array:")
arr1 = createIntArray()
print("First array:", arr1)

print("Enter elements into second DESC sorted array:")
arr2 = createIntArray()
print("Second array:", arr2)

result = mergearrayDesc(arr1, arr2)
print("DESC merged array:", result)