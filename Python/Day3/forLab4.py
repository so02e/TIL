# 짝수의 합과 홀수의 합 출력
evenNum = 0
oddNum = 0

for v1 in range(1,101):
    if v1 % 2 == 0:
        add = v1
        evenNum += add


    else :
        add = v1
        oddNum += add

print("1부터 100까지의 숫자들 중에서")
print("짝수의 합은 ", evenNum, "이고")
print("홀수의 합은", oddNum, "이다.")