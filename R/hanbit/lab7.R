job.type <- 'A'

# 에러: 예기치 않은 '}'입니다 in "}"
if (job.type == 'B'){
  bonus <- 200
}
else {
  bonus <- 100
}

bonus


# else문은 반드시 if문의 코드블록이 끝나는 '}'와 같은 줄에 서술해야 한다.
if (job.type == 'B'){
  bonus <- 200
} else {
  bonus <- 100
}

bonus



