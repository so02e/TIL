# 조건 평가시 and 연산자
import random
grade = random.randint(1, 6)

if grade >= 1 and grade <=3:
    print(grade , "학년은 저학년입니다.")
else :
    print(grade , "학년은 고학년입니다.")