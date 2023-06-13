# 숫자 데이터를 범주형으로 인식하지 못하게 하여야 함
cafe = read.csv('data/cafedata.csv', stringsAsFactors = F)
str(cafe)
head(cafe)
dim(cafe)       # 48 22
summary(cafe)   # pandas describe()와 유사

# 커피 판매량의 최대값과 최소값
cafe$Coffees = as.numeric(cafe$Coffees)
sort(cafe$Coffees)
sort(cafe$Coffees)[1]                   # 최소값, 3
sort(cafe$Coffees, decreasing = T)[1]   # 최대값, 48

sum(is.na(cafe$Coffees))                # 결측치, 1
sort(cafe$Coffees)[length(cafe$Coffees) - sum(is.na(cafe$Coffees))] # 최댓값, 48

min(cafe$Coffees, na.rm = T)            # 최소값, 3
max(cafe$Coffees, na.rm = T)            # 최대값, 48

# 최빈값을 알기 위한 방법
stem(cafe$Coffees)          # 줄기-잎 그림
table(cafe$Coffees)

# 평균
num.na = sum(is.na(cafe$Coffees))       # NA 의 갯수
weight = 1 / (length(cafe$Coffees) - num.na)
sum(cafe$Coffees * weight, na.rm = T)   # 산술 평균
mean(cafe$Coffees, na.rm = T)

# 양 끝 값의 변화에 따른 평균의 변화
rc = na.omit(cafe$Coffees)
length(rc)                  # 21.51064
rc[rc == max(rc)] = 480
mean(rc)                    # 21.51064 -> 30.70213

# 중앙값
median.idx = (1 + length(rc)) / 2)
median.idx
sort(rc)[median.idx]
median(cafe$Coffees, na.rm = T)

# 양 끝 값의 변화의 빠른 평균의 변화는 크고, 중앙값의 변화는 없다

##### 자료의 퍼진 정도 - 표준편차와 사분위수 (편차 제곱의 평균)
# 아래와 같이 계산하면 퍼진 정도를 알 수 없다
height = seq(164, 176, 2)
height.m = mean(height)     # 170
h.dev = height - height.m   # -6 -4 -2 0 2 4 6
sum(h.dev)                  # 0

sum(h.dev ^ 2)              # 112
sum(h.dev ^ 2) / 7          # 16
mean(h.dev ^ 2)             # 16, 분산
sqrt(mean(h.dev ^ 2))       # 4, 표준 편차

# R 에서 제공하는 함수
var(height)                 # 18.66667, 표본 분산
sd(height)                  # 4.320494, 표본 표준 편차

### 사분위수
quantile(cafe$Coffees, na.rm = T)   #  0%  25%  50%  75% 100% 
                                    #   3   12   23   30   48
qs = quantile(cafe$Coffees, na.rm = T)
boxplot(cafe$Coffees, main = '커피 판매량의 Box Plot')      # 중앙선 : 중앙값

IQR(cafe$Coffees, na.rm = T)        # 18
qs[4] - qs[2]                       # 3분위수 - 1분위수, 18 (IQR)

### 이상치(Outlier)
boxplot(cars$dist)
hist(cars$dist, breaks=seq(0, 120, 10))

qs = quantile(cars$dist)            #   0%  25%  50%  75% 100% 
                                    #    2   26   36   56  120 
iqr = qs[4] - qs[2]                 # 30
upperlimit = qs[4] + 1.5 * iqr      # 101
lowerlimit = qs[2] - 1.5 * iqr      # -19
cars$dist[cars$dist > upperlimit | cars$dist < lowerlimit]  # 120, 이상치 데이터