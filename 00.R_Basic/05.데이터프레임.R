##### Data Frame
name = c('James', 'Maria', 'Brian')
age = c(22, 20, 25)
gender = factor(c('M', 'F', 'M'))       # 범주형 데이터
blood = factor(c('A', 'O', 'B'))

patients = data.frame(name, age, gender, blood)
patients
#    name age gender blood
# 1 James  22      M     A
# 2 Maria  20      F     O
# 3 Brian  25      M     B

# 열 선택 및 타입 확인
patients$name           # "James" "Maria" "Brian"
typeof(patients$name)   # "character"
typeof(patients$gender) # "integer" / F: 1, M: 2

# 행, 열을 인덱싱으로 선택할 수도 있음
patients[, 1]       # name 열, == patients$name
patients[1, ]       # 1번 레코드, James 22 M A

# 하나의 값을 인덱싱 - 마리아의 나이
patients$age[2]     # 20
patients[2, 2]      # 20, Python의 iloc

# Filtering
patients[patients$gender == 'F',]   # 여성 환자, ',' 필요
patients[patients$blood == 'A',]    # 혈액형이 A형인 환자

# Selection
patients[, c('age', 'gender', 'blood')]     # 이름을 제외한 환자 정보 / 행은 전부, 열 선택

# Filltering and Selection
patients[patients$gender == 'M', c('age', 'gender', 'blood')]
patients[c(1,3), c(2:4)]
#   age gender blood
# 1  22      M     A
# 3  25      M     B

# 레코드 추가(행 추가)
length(patients)        # 4, 열의 갯수
length(patients$name)   # 3, 행의 갯수
patients[length(patients$name) + 1, ] = c('Emma', 24, 'F', 'A')
patients

# 컬럼 추가
patients['country'] = c('UK', 'US', 'AU', 'US')
patients

# 크기
dim(patients)       # 4 5


##### Factor
genre = factor(c("Jazz", "Rock", "Classic", "Classic", "Pop", "Jazz", "Rock", "Jazz"))
genre
levels(genre)       # "Classic" "Jazz" "Pop" "Rock"
typeof(genre)       # "integer"

##### R dataset
head(cars)
tail(cars)
mean(cars$speed)        # 15.4
max(cars$dist)          # 120

tail(airquality)
mean(airquality$Ozone)  # NA : 결측치 에러

### 결측치(NA) 처리
# 1. 결측치 확인
str(airquality)
sum(is.na(airquality))  # 44, 전체 결측치 확인
for (i in 1:length(airquality)) {        # 컬럼별 결측치 확인
    print(sum(is.na(airquality[, i])))
}
for (col in colnames(airquality)) {
    print(paste(col, sum(is.na(airquality[, col]))))
}
    
# 2. 결측치 대체 또는 제거
# Ozone 결측치를 평균으로 대체
mean(airquality$Ozone, na.rm=T)     # 결측치를 제외한 평균
airquality$Ozone = ifelse(is.na(airquality$Ozone),          # 조건
                          mean(airquality$Ozone, na.rm=T),  # 참일 때의 값
                          airquality$Ozone)                 # 거짓일 때의 값
sum(is.na(airquality$Ozone))        # 0

# Solar.R 결측치를 중앙값으로 대체
median(airquality$Solar.R, na.rm=T)
airquality$Solar.R = ifelse(is.na(airquality$Solar.R),
                            median(airquality$Solar.R, na.rm=T),
                            airquality$Solar.R)
sum(is.na(airquality$Solar.R))      # 0

# 맨 마지막줄에 결측치 데이터를 추가한 후 제거
airquality[length(airquality$Ozone) + 1, ] = c(NA, NA, NA, NA, NA, NA)
tail(airquality)
tail(na.omit(airquality))           # 비파괴적
airquality = na.omit(airquality)    # NA가 포함된 행을 전부 날림
tail(airquality, 3)