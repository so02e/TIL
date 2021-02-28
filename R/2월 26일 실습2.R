# 문제 8

nums <- scan("data/iotest1.txt")

cat("오름차순 : ", sort(nums))
cat("내림차순 : " ,sort(nums,decreasing=TRUE))
cat("합 : ", sum(nums))
cat("평균 : ", mean(nums))

