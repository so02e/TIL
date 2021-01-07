# 전달받은 숫자개수 만큼 삼각형을 출력함

def print_triangle (num):
    for i in range(1, num + 1):
        print("@" * i)
        i += 1

n1 = int(input("숫자를 입력하세요 : "))

if n1 < 1 or n1 > 10:
    pass
else:
    print_triangle(n1)