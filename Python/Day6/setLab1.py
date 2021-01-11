import random
s1= set()
s2 = set()

for i in range(0,11):
    rand1 = random.randint(1,20)
    s1.add(rand1)
    i+=1

for i in range(0,11):
    rand2 = random.randint(1,20)
    s2.add(rand2)
    i+=1

print("집합1:",s1)
print("집합2:",s2)
print("두 집합에 모두 있는 데이터:",s1&s2)
print("집합1 또는 집합2에 있는 데이터:",s1|s2)
print("집합1에는 있고 집합2에는 없는 데이터:",s1-s2)
print("집합2에는 있고 집합1에는 없는 데이터:",s2-s1)
print("집합1과 집합 2가 각자 가지고 있는 데이터:",s1^s2)
