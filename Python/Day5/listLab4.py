import random
list_num = []

# 1 ~ 50 사이의 난수를 10개 추출하여, 변수에 저장
for i in range(1,11):
    a = random.randint(1,50)
    list_num.append(a)

# list_num의 모든 값을 출력
print(list_num)

# 10 보다 작은 값은 100으로 변경함
for j in range(0,10): # 1, 11으로 하면 왜 안되는 걸까
        if list_num[j] < 10:
            list_num[j] = 100
print("10보다 작은 값은 100으로 변경", list_num)

print("첫번째 값", list_num[0])
print("마지막 값", list_num[-1])
print("두번째부터 여섯번째 데이터", list_num[1:6])


print("슬라이싱 역순 출력", list_num[9::-1]) # [9:0:-1] 이 안되는 이유는?
print("슬라이싱 순차 출력", list_num[0:10])

# 인덱싱 방법으로 5번째 데이터를 삭제
del list_num[4]
print("슬라이싱 순차 출력", list_num)

# 슬라이싱 방법으로 2~3번째 데이터를 삭제
del list_num[1:2]
print("슬라이싱 순차 출력", list_num)