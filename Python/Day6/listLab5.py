# 동일한 숫자가 중복되어 저장되지 않도록 하여, 1-45 사이의 난수를 추출하여 6개를 저장함
# 출력형태 : 행운의 로또번호 : X, X, X, X, X, X

import random
l1 = []

while True:
    rand1 = random.randint(1, 45)
    l1.append(rand1)

    if len(l1) == 6:
        break

print("행운의 로또번호 : ", l1)
