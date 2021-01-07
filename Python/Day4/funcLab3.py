# 사칙연산을 수행하도록 하고, 사칙연산기호가 아니면 수행불가를 출력

def expr(num1,num2,op):
    if op == "+":
        return(num1 + num2)
    elif op == "-":
        return (num1 - num2)
    elif op == "/":
        return (num1 / num2)
    elif op == "*":
        return(num1 * num2)


n1 = int(input("첫번째 숫자입력 : "))
n2 = int(input("두번째 숫자입력 : "))
oper = str(input("연산자 입력 : "))

if expr(n1,n2,oper) == None:
    print("수행불가")
else:
    print("연산결과 : ", expr(n1,n2,oper))
