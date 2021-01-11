# 비어있는 set을 만들고, 1-45 사이의 난수를 추출하여, 6개 저장하는데 동일 숫자 중복되지 않도록 함

import random
s1 = set()

while True:
    rand1 = random.randint(1,45)
    s1.add(rand1)

    if len(s1) == 6:
        break

print("행운의 로또번호 : ", s1)