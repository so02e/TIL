# 9부터 4까지 홀수/짝수 인지까지도 출력
for d in [9,8,7,6,5,4] : # range(9,3,-1)
    isodd = d%2
    if isodd == 1:
        is_odd = "홀수"
    else :
        is_odd = "짝수"
    print(d, ":",is_odd)