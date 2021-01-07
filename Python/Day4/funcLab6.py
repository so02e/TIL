# 구구단을 출력한다.

def print_gugudan(dan):
    for i in range(1,10):
        print(dan , "*", i, "=", dan * i)
        i += 1

num = int(input("몇 단인지 입력하세요 : "))
if type(num) != int:
    pass
elif num < 1 or num > 10:
    pass
else:
    print_gugudan(num)