# 10, 5, 7, 21, 4, 8,1 8 의 값을 갖는 list_num 을 만들고, 최댓값을 출력.
list_num = [10, 5, 7, 21, 4, 8, 18]

for i in range(0, len(list_num) - 1):
    max1 = list_num[i]
    max2 = list_num[i+1]

    if max1 >= max2:
        value = max1
    else:
        pass
    i+=1

print("최대값 : ", value)
