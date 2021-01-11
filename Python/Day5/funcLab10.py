# 아규먼트 개수에 상관없이, 합을 계산하여 리턴하는 함수. (가변형 매개변수)
# 타입을 체크하여 숫자만 처리하고, 숫자가 아닌 데이터는 무시한다.
# 아규먼트가 전달되지 않았거나, 숫자가 없다면 None을 리턴한다.

def sumALL(*p):
    count=0
    ans=0
    for i in p:
        if type(i) == int:
            count+=1
            ans+=i
        else: pass
    if len(p)==0 or count ==0 :
        ans = None
    return ans

def sumAll(*p):
    sum = 0
    if type(p) == int:
        for data in p: # 합을 계산하기 위해 for 반복문을 쓴다.
            sum+=data
            p += 1
        return sum

    elif type(p) != int: # 숫자가 아닌 경우
        return None

    elif len(p)==0: # 아규먼트가 전달되지 않으면 -1을 리턴함 < 전달되지 않는다는 부분에서 len을 쓴다는 사고 >
        return None

print(sumAll(4,5,6,7,8,9,10))
print(sumAll(1,2,3))
print(sumAll())
