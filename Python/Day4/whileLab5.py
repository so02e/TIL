# 문자열을 입력받아, 길이가 5미만이면 *를 붙여 출력하고, 8 초과이면 $를 붙여 출력

while True:
    word = str(input("문자열을 입력하세요 : "))
    word_length = len(word)

    if word_length == 0 :
        print("종료")
        break # 끝낼 때는 break
    elif word_length >= 5 and word_length <= 8:
        continue # 무조건 다시 올라간다 ! true 이면 또, true니까 반복
    elif word_length < 5:
        result = "*" + word + "*" # 괄호를 안붙여도 된다..!
        # print("유효한 입력 결과 : ", result) # 14와 17(else에 속하는 print의 경우) 의 문장이 똑같으므로, 권장하는 방법은 공통된 구현은 한번만 해도 괜찮음.
    else:
        result = "$" + word + "$"
    print("유효한 입력 결과 : ", result)