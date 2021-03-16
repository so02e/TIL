Sys.setlocale("LC_ALL", "English")
picherstat <- read.csv('data/picher_stats_2017.csv' ,header = TRUE,encoding = "UTF-8")
Sys.setlocale("LC_ALL","Korean")

str(picherstat)
picherstat

library(fmsb)

stat <- as.vector(picherstat[1,])
max.ball <- max(picherstat$볼넷.9)
max.sam <- max(picherstat$삼진.9)
max.home <- max(picherstat$홈런.9)
min.ball <- min(picherstat$볼넷.9)
min.sam <- min(picherstat$삼진.9)
min.home <- min(picherstat$홈런.9)

max.stat <- c(max.sam,max.ball,max.home)          
min.stat <- c(min.sam,min.ball,min.home)             

kellystat <- c(stat$삼진.9,stat$볼넷.9,stat$홈런.9)

# 삼진, 홈런, 볼렛
ds <- rbind(max.stat,min.stat, kellystat)
ds <- data.frame(ds)              
colnames(ds) <- c('삼진','볼넷','홈런')
ds


radarchart(ds,                           # 데이터프레임
           pcol='red',            # 다각형 선의 색 
           pfcol=rgb(0.1,0.3,0.2,0.25),   # 다각형 내부 색
           plwd=3,                       # 다각형 선의 두께
           cglcol='grey',                # 거미줄의 색
           cglty=1,                      # 거미줄의 타입
           cglwd=0.8,                    # 거미줄의 두께
           axistype=1,                   # 축의 레이블 타입
           seg=4,                        # 축의 눈금 분할                         
           axislabcol='grey',            # 축의 레이블 색
           caxislabels=seq(0,100,25),     # 축의 레이블 값
           title = c("kelly 선수의 성적")
           
)

dev.copy(png, "output/lab19.png") 
dev.off()
