# 1. 에러

syntax 적으로 css도 그렇고 html 도 그렇고 나름 구문이 있었다.

구문적으로 잘못 작성되면, 에러가 발생되지는 않았었다. 작성한 내용을 무시했었다.



Python, javascript, R은 구문(syntax)에서 잘못된 것이 있으면 에러를 발생시키고 처리를 종료한다는 특징이 있음



# 2. 예외

구문적으로 에러는 없지만 실행되는 동안 발생할 수 있는 잘못된 상황

소스코드 자체에 구문적인 오류는 없으나, 실행될 수 있는 잘못된 상황

​	*(1)* 발생한 예외를 처리하는 코드가 준비되어 있는지 확인하고, 준비되어 있는 예외처리코드를 실행한다.

   *(2)* 예외처리 코드가 준비된 상황이 아니면, 에러를 발생시키고, 처리를 종료한다. 



## 1. 예외처리 구문

> try ~ except (들) ~ else ~ finally~
>
> else와 finally를 생략하기도 한다.



## 1) 예외처리 구문의 형태

```python
try : 
	예외가 발생할 가능성이 있는 블록
		:
except [처리하려는 예외명] :
	예외처리 코드 블록
else : 
	예외가 발생하지 않았을 때 수행되는 코드 블록
finally :
	예외 발생여부와 관계없이 수행되는 코드 블록
```



| except 구문 0개 | except 1개 | excpet 2개 이상 |
| --------------- | ---------- | --------------- |
| ㅇㅇ            | ㅇㅇ       | ㅇㅇ            |

try except  finallly







```
f = open("live.txt", "wt", encoding="UTF-8")
print(f, type(f))
f.write("""삶이 그대를 속일지라도
슬퍼하거나 노하지 말라!
우울한 날들을 견디면
믿으라, 기쁨의 날이 오리니""")
f.close()
```

파일명



wt : 출력할 목적으로 파일을 열어라

rt : 읽을 목적으로 파일을 열어라



encoding  = "UTF-8"

기본값은 cp949(ansi)

윈도우 기본 캐릭터셋은 아직 ansi이다.



















참고

* 문자셋, characterset

문자마다 부여한 코드 값을 모아 놓은 것으로, 각 문자셋마다 고유 명칭이 있다.



기억할 만한 문자셋 명칭

ansi (euc-kr, ksc5601,cp949) : 영문 1바이트(아스키), 한글 2바이트 -> 나라마다 중복되고 충돌이 나서 

-> 해결 방법 : 유니코드 

utf - 16 : 모든 나라의 언어의 코드값을 통일화 2바이트로 ()

utf - 8 : 모든 나라의 언어의 코드값을 통일화. 현재 주로 쓰임. 1~4바이트로 표현 현재 인터넷에서 쓰이는 표준



데이터 수집에 있어 utf 8, ansi인지에 따라 일이 달라진다!!!!!!!!







# 2. 리드

리드





```
f = open("live.txt", "rt", encoding="UTF-8")
while True:
    text = f.read(10) # 10문자씩 읽기
    if len(text) == 0: break
    print(text, end = '$')
f.close()
print("\n"+"-"*20)




f = open("live.txt", "rt", encoding="UTF-8")
text = ""
line = 1
while True:
    row = f.readline() # 한 행씩 읽기
    if not row: break # 더 이상 읽을 게 없으면 break
    text += str(line) + " : " + row
    line += 1
f.close()
print(text)
print("\n"+"-"*20)






f = open("live.txt", "rt", encoding="UTF-8")
rows = f.readlines()  # 모든 행을 읽어서 "리스트"로 리턴
for row in rows:
    print(row, end = '')
f.close()





print("\n"+"-"*20)
f = open("live.txt", "rt", encoding="UTF-8")
for line in f:        # _io.TextIOWrapper 객체도 리터러블함
    print(line, end = '')
f.close()
```





