import random
score = random.randint(0, 100)

if 90<= score <= 100:
    print(score , "점은 A등급입니다.")
elif 80<= score <= 89:
    print(score , "점은 B등급입니다.")
elif 70<= score <= 79:
    print(score , "점은 C등급입니다.")
elif 60<= score <= 69:
    print(score , "점은 D등급입니다.")
else :
    print(score, "점은 F등급입니다.")