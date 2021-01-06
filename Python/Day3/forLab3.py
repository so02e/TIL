# 1부터 10사이의 난수와 30부터 40까지의 난수를 추출하여 두 난수 사이의 짝수의 합을 추출
import random
rand1 = random.randint(1,10) # random의 경우 1,10을 포함한다 !
rand2 = random.randint(30,40)

sum = 0

for num in range(rand1, rand2+1): #1을 넣어야만 하는 이유 ! range(1,10)의 의미는 1부터 9까지.
    if num % 2 == 0:
        add_num = num
        sum += add_num

print(rand1)
print(rand2)
print ("X부터 Y까지의 짝수의 합 =",sum)