# 1부터 추출된 숫자값까지의 각 숫자들의 제곱값을 행단위로 출력한다.
import random
num = 1 # 초기값
finish_num = random.randint(5, 10) # 끝나는 값

while num <= finish_num:
    print(num, " -> ", num * num) # num ** 2와 같은 의미
    num += 1