# 0 이면 종료, -10보다 작거나 10보다 크면 입력받는 것부터 다시 시작. 입력값, 부호 변경 후 곱한 결과

while True:
    num = int(input("숫자를 입력하세요 : "))
    if num == 0 :
        print("종료")
        break
    elif num < -10 or num > 10  :
        continue # 바로 조건 식으로  (왜 break를 넣었을까 ㅠㅠ)
    elif num > 0 :
        print("입력값 : ", num)
       ## nnum = 1
        ## mult = 1
        ## while nnum <= num:
          # mult *= nnum
            # nnum += 1
        # print(mult)
    else:
        num *= -1
        print("입력값(부호변경) : ", num)

    # for 문을 쓴다면
    #     mult = 1
     #    for data in range(1, num+1)
      #           mult *= data```

    nnum = 1
    mult = 1
    while nnum <= num:
        mult *= nnum
        nnum += 1
    print(mult)