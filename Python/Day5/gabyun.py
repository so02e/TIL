def sumall(*p) :
    sum = 0
    for data in p :
        sum += data
    return sum

print(sumall(1,2,3,4,5))
print(sumall(100, 200, 300))
print(sumall(10,20,30,40,50,60,70))
# print(sumall())

help(sumall)