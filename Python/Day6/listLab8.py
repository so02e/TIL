# 이차원 리스트
# 리터럴 방식으로, [B,C,A,A]
# A,B,C,D의 개수 출력

data = [
    ['B','C','A','A'],
    ['C','C','B','B'],
    ['D','A','A','D']
]

a = data[0].count('A') + data[1].count('A') + data[2].count('A')
b = data[0].count('B') + data[1].count('B') + data[2].count('B')
c = data[0].count('C') + data[1].count('C') + data[2].count('C')
d = data[0].count('D') + data[1].count('D') + data[2].count('D')

each = [a,b,c,d]

print("A는 ", each[0], "개 입니다.")
print("B는 ", each[1], "개 입니다.")
print("C는 ", each[2], "개 입니다.")
print("D는 ", each[3], "개 입니다.")