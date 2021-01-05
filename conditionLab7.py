num = int(input("1부터 10사이의 숫자를 하나 입력하세요 : "))
if num >= 1 and num <= 10 :
    odd = num % 2
    if odd == 1 :
        od = "홀수"
    else:
        od = "짝수"

    print(num , ":", od)
else:
    print("1부터 10사이의 값이 아닙니다.")