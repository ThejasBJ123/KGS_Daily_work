# WAP to implemente the logic of Merge sort.
# it works on the principle of diveide and conqure rule.

def createIntArray():
    l = []
    while True:
        try:
            val = int(input("Enter a Value: "))
            l.append(val)
        except Exception as e:
            return l
            
# Merge two sorted arrays into one sorted array.
# Merging + update the original memory

def mergeSortMerge(arr,start,mid,end):
    i, j = start, (mid + 1)
    res = []

    for k in range(0, (mid + end) + 1):
        if i <= mid and j <= end:
            #Comparison logic
            if arr[i] < arr[j]:
                res.append(arr[i])
                i+=1
            else:
                res.append(arr[j])
                j+=1
        else:
            # is there extra values in i
            if i <= mid:
                res.append(arr[i])
                i+=1
            # is there extra values in j
            elif j <= end:
                res.append(arr[j])
                j+=1

    # update the original arr for res[]

    for k in range(0, len(res)):
        arr[start] = res[k]
        start += 1

# Divide the array into two parts and call the mergeSortMerge() function to merge the two sorted arrays.

def mergeSortDivide(arr,start,end):
    if start == end:
        return 
    mid = (start + end) // 2
    
    # LHS 
    mergeSortDivide(arr, start, mid)
    # RHS
    mergeSortDivide(arr, (mid + 1), end)
    # merging
    mergeSortMerge(arr, start, mid, end)



print("Enter a elements into array: ")
arr = createIntArray()
print("The created array is:", arr)

mergeSortDivide(arr, 0, len(arr) - 1)
print("Sorted Array is: ", arr)