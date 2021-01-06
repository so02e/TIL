## 1. 제어문

| 조건제어문     | 반복제어문 | 분기제어문                                                   |
| -------------- | ---------- | ------------------------------------------------------------ |
| if, elif, else | for, while | break(반복문을 중단), continue (이번 반복은 그만하더라도, 다음 반복을 가자 !) |



## 2. for 문

> for 문은 ~으로 반복처리

### 	2.(1) list와 range

리스트 집합 [1,2,3,4,5]

* 리스트(대괄호)를 사용할 수도 있지만, range 함수를 이용하여 표현할 수도 있다.

  ```python
  for d in [1,2,3,4,5,6,7,8,9,10]
  ```

  ```python
  for v1 in range(6):
      print("v1 is :", v1) #V1 is : 0  /is 1 /is 2/ is 3 /is 4 /is 5/
  ```

  ```python
  C:\Users\user\AppData\Local\Programs\Python\Python38\python.exe C:/jsy/PYTHONexam/day3/forTest2.py
  v1 is : 0
  v1 is : 1
  v1 is : 2
  v1 is : 3
  v1 is : 4
  v1 is : 5
      
  Process finished with exit code 0
  
  ```

  

* range

  range(10) : 0~9

  range(1,10) : 1,2,3,4,5,6,7,8,9

  range(10,1,-1) : 10,9,8,7,6,5,4,3,2

  range(10,101,10) : 10,20,30,40,50,60,70,80,90,100



### 		2.(2) 중첩 for문





## 3. While 문

> ```python
> while 조건식 :
> 	반복하려는 수행 문장 블럭
> ```

if문과의 차이는, 조건식이 참이면 또 다시 조건식으로 올라와 다시 수행하고,

조건식이 false가 될 때는 stop. (true 인 경우에만 반복.)



처음부터 조건식이 거짓이면 시행되지 않는다. 



* 무한루프 : while True & break

```python
while True :   # 항상 참이다.
	반복하려는 수행 문장 블럭 # 계속 참이니까 무한 루프
    if 조건식 :
        break
```



break를 가장 가까운 것만 .. 빠져나갈 수 있으니,

```python
endFlag = False
for dan in range(1, 10):
    for num in range(2, 10):
        result = dan * num
        if result > 30 :
            endFlag = True #4 * 8 = 32가 되어야만 endflag가 true가 된다.
            break
        print(dan, "*", num, "=", result, end="\t")
    if endFlag : # endflag true 이므로 break로 빠져나갈 수 있게 된다. 
        break
    print()
```





1 ~ 100까지의 합

```python
num = 1 # 변수를 넣어 값을 넣는 과정 "초기화"
sum = 0 # 초기화

while num <= 100 :
	sum += num
	num += 1 # num이 101이 되면 중단.
print(sum)
```



* end = " " / or 행 단위 출력

```
    print(num, end=" ")

```

5 6 7 8 

```
    print(num, end="")

```

5678

```
    print(num)

```

5

6

7

8

