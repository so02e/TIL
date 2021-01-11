# 숫자와 데코문자의 매개변수를 갖는 함수 데코문자 기본값은 ‘%’ , 리턴값 : 없음
#  기능 : 전달된 숫자 개수로 구성되는 삼각형을 출력한다.

n1 = int(input("숫자를 입력하세요 : "))
deco = str(input("반복할 문자를 입력하세요 : "))

def print_triangle_withdeco(num, deco='%'):

        for i in range(1, n1 + 1): # 반복하는 숫자
            print(deco * i)
            i += 1
        if n1 < 1 or n1 > 10:
            print_triangle_withdeco(n1, deco)

print_triangle_withdeco(n1,deco)

