# WAP to segregate all the elements present in a given array based on duplicates, non-duplicates, and unique elements.

def createIntArray():
    l = []
    while True:
        try:
            val = int(input("Enter a Value: "))
            l.append(val)
        except Exception as e:
            return l

def seggregation(arr):
    dict={}
    for i in range(0,len(arr)):
        if arr[i] in dict:
            dict[arr[i]] += 1
        else:
            dict[arr[i]] = 1
    # now dictionary is ready 
    # now for dup,nondup,unique traversal through dictionary 
    dup,nondup,uniq = [],[],[]
    for keys, values in dict.items():
        if values > 1:
            dup.append(keys)
        if values == 1:
            uniq.append(keys)
        nondup.append(keys)
    return dup,nondup,uniq
    
print("Enter elements into the array:")
arr = createIntArray()
print("The created array is:", arr)

resdup,resnondup,resuniq = seggregation(arr)
print("The duplicates elemensts are: ",resdup)
print("The Non-Duplicates elemensts are: ",resnondup)
print("The Unique elemensts are: ",resuniq)