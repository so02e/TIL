# continue 문을 사용하지 않고 해결한다.
# 1부터 50까지의 숫자 중 3의 배수에 해당하는 값의 합

sum = 0
nnum = 0
for num in range(1, 51):
    if num % 3 == 0 and num % 5 != 0 :
        nnum = num
        sum += num
print ("결과 = ",sum)