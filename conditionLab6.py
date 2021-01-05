# print() 하나만 쓰자.
import random
score = random.randint(0, 100)
grade = ""


if 90<= score <= 100:
    grade = "A등급"
elif 80<= score <= 89:
    grade = "B등급"
elif 70<= score <= 79:
    grade = "C등급"
elif 60<= score <= 69:
    grade = "D등급"
else :
    grade = "F등급"

print(score, "점은", grade, "입니다.")