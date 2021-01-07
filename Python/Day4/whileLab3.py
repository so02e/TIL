# 0부터 30사이의 난수를 추출한다. 추출된 숫자가 1이면 'A', 2 이면 'B', ... 26이면 'Z' 를 출력하는데
# 계속 난수 추출과 출력을 반복하다가 난수가 0이 추출되거나 27~30이 추출되면 반복을 끝낸다.
# * 참고 : print(ord("A")), print(chr(65))

import random
count = 0 # 반복문 바깥에 있어야 한다. 계속 반복하면서 0으로 초기화되면 안된다.

while True:
    num = random.randint(0, 30)
    if num == 0 or (num >= 27 and num <= 30):
        break

    else:
        count += 1
        print(chr(num+64),"(",num,")")

print("수행횟수는 ", count, "번입니다.")