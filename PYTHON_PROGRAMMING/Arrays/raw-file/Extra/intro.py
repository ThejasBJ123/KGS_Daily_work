arr = []
print(arr)
print(len(arr))
# arr[0] = 100 #IndexError: list assignment index out of range
arr.append(100)
arr.append(44)
arr.append('lewis')
arr.append({1,6})
arr.append(16)
print(arr)
print(len(arr))
print(len(arr[3]))
print(len(arr))
arr.insert(2,10.02)
print(arr)
arr[4] = 3
print(arr)
arr.insert(15,85)
print(arr)

arr2 = [22,63]
print(arr2)
arr3 = [111,222]
print(arr3)
arr2.append(arr3)
print(arr2)
print(arr3)
arr3[1] = 222
print(arr2)
print(arr3)
print(arr[2] is arr3)
arr.extend([7,9,12])
print(arr)
# arr1.extend(63) #Error