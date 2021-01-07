# 사용자로부터 월에 해당하는 숫자를 하나 입력 받고 계절을 출력
# 반복처리하고, 숫자가 틀리면 1~12 사이의 값을 입력하라고 출력하고 종료

while True:
    num = int(input("월에 해당하는 숫자를 입력하세요 : "))

    if num < 1 or num > 12 :
        break

    elif num == 12 or num == 1 or num == 2 :
        print(num, "월은 겨울",sep="")
    elif num == 3 or num == 4 or num == 5:
        print(num, "월은 봄",sep="")
    elif num == 6 or num == 7 or num == 8:
        print(num, "월은 여름",sep="")
    else:
        print(num, "월은 가을",sep="")

print("1~12사이의 값을 입력하세요!")