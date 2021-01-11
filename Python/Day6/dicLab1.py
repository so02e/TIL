# 10개의 딕셔너리를 생성 후, RGB 값 출력

color_dic = {'red':'#ff0000', 'blue':'#0000ff', 'green':'#008000','yellow':'#ffff00', 'orange':'#ffa500', 'black':'#000000',
       'white':'#ffffff','violet':'#ee82ee','pink':'#ffc0cb','lime':'#00ff00'}

color = str(input("칼라명을 영문으로 입력하세요 : "))

if color in color_dic:
    print(color,"칼라의 RGB 값은 ", color_dic[color], "입니다")
else:
    print(color,"칼라의 RGB 값을 찾을 수 없습니다")