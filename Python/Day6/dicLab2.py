# 일기예보
# 요일에 따른 최저온도, 최고온도 출력

temp_dic = {
    '월':{
        'high' : -4,
        'low' : -12
        },
    '화':{
        'high' : 2,
        'low' : -4
        },
    '수':{
        'high' : 8,
        'low' : -8
        },
    '목':{
        'high' : 6,
        'low' : -3
        },
    '금':{
        'high' : 7,
        'low' : -7
        },
    '토':{
        'high' : -3,
        'low' : -13
        },
    '일': {
        'high' : -2,
        'low' : -6
        }
}
day_week = str(input("요일명을 한글 입력하세요 : "))

if day_week in temp_dic:
    print(day_week,"의 최저온도는", temp_dic[day_week]['low'], "이고 최고온도는 ", temp_dic[day_week]['high'], "입니다")
else:
    print(day_week,"요일의 정보를 찾을 수 없습니다")