# 아규먼트 개수에 상관없이, 그 아규먼트들이 짝수라면, 합을 계산하여 리턴하는 함수. (가변형 매개변수)
# 전달된 아규먼트 중 짝수가 없으면 0을 리턴하고, 아규먼트가 전달되지 않으면 -1을 리턴함

def sumeven1(*p):
    sum = 0
    for data in p: # 합을 계산하기 위해 for 반복문을 쓴다.
        if data%2==0: # 짝수이면 sum에서 그 값을 더한다.
            sum+=data
    if len(p)==0: # 아규먼트가 전달되지 않으면 -1을 리턴함 < 전달되지 않는다는 부분에서 len을 쓴다는 사고 >
        sum = -1
    return sum

print(sumeven1(4,5,6,7,8,9,10))
print(sumeven1(1,2,3))
print(sumeven1())
