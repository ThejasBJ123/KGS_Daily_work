n=8
noc=1
nor=(n*2)-1
for i in range(1,n*2):
    for j in range(1,n*2):
        if j<=noc or j>=nor:
            print("*",end=" ")
        else:
            print(" ",end=" ")
    print()
    if i<n:
        noc+=1
        nor-=1
    else:
        noc-=1
        nor+=1