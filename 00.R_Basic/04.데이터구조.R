##### Vectors
fruits = c('apple', 'banana', 'cherry')
numbers = c(1, 2, 3L)       # integer 3L이 numeric으로 자동 타입 변환
numbers         # 1 2 3

seqs = 1:10     # 시작:끝
seqs = 6:1
nums = 1.5:5.5
print(nums)

# sequence
seq(from=1, to=10, by=2)    # == seq(1, 10, 2)
seq(0, 1, 0.1)              # 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0
seq(0, 1, length.out=11)    # seq(0, 1, 0.1), np.linspace(0, 1, 11)

# repeat(반복)
rep(c(1:3), times=2)        # 1 2 3 1 2 3, 두번 반복
rep(c(1:3), each=2)         # 1 1 2 2 3 3, 각각 두번씩 반복

### Sorting
fruits <- c("banana", "apple", "cherry", "mango", "lemon")
numbers <- c(13, 3, 5, 7, 20, 2)
sort(fruits)        # 문자열 오름차순
sort(numbers)       # 2 3 5 7 13 20
numbers             # 13 3 5 7 20 2, sort()는 자기파괴적이지 않음

### Indexing
fruits[1]           # "banana", 첫번째 요소
fruits[-1]          # "apple" "cherry" "mango" "lemon", 첫번째 요소를 제외한 나머지
fruits[-3]          # "banana" "apple" "mango" "lemon", 세번째 요소를 제외한 나머지

### Slicing
fruits[2:4]         # "apple" "cherry" "mango", 네번째 요소 포함

### 임의 선택
fruits[c(1, 4, 5)]  # "banana" "mango" "lemon", selection

### 값 변경
fruits[1] = 'pear'
fruits              # "pear" "apple" "cherry" "mango" "lemon"


##### List
numbers = list(1, 2, 3L, 4+3i)      # 요소의 데이터 타입이 달라도 됨
numbers[4]

### 요소의 갯수
length(fruits)      # 5
length(numbers)     # 4


##### Matrix
m1 = matrix(c(1:6), nrow=2, ncol=3)
m1      #      [,1] [,2] [,3]       column 부터 채워짐
        # [1,]    1    3    5
        # [2,]    2    4    6
m2 = matrix(c(1:6), nrow=3, ncol=2)
m2      #      [,1] [,2]
        # [1,]    1    4
        # [2,]    2    5
        # [3,]    3    6
m1[1, 2]        # 3
m2[3, 1]        # 3

### 행/열 단위의 인덱싱
thismatrix <- matrix(c("apple", "banana", "cherry", "peach", "grape", "pineapple", "pear", "melon", "fig"), nrow = 3, ncol = 3)
thismatrix
thismatrix[c(1,2),]         # 행 : 1, 2 / 열 : 전부
thismatrix[, c(2,3)]        # 행 : 전부 / 열 : 2, 3
thismatrix[c(1,2), c(1,2)]  # 행 : 1, 2 / 열 : 1, 2

# bind
m1
v1 = c(10, 20, 30)
m1 = rbind(m1, v1)      # 행 단위로 바인딩
m1                      #    [,1] [,2] [,3]
                        #       1    3    5
                        #       2    4    6
                        # v1   10   20   30
m1 = cbind(m1, c(100, 200, 300))    # 열 단위로 바인딩
m1                      #    [,1] [,2] [,3] [,4]
                        #       1    3    5  100
                        #       2    4    6  200
                        # v1   10   20   30  300

# contains
'apple' %in% fruits     # TRUE

# 크기
dim(thismatrix)         # 3 3, 차원의 크기
length(thismatrix)      # 9, 요소의 갯수

# matrix와 반복문
m3 = matrix(c(1:12), nrow=3, ncol=4)
for (row in 1:nrow(m3)) {
    for (col in 1:ncol(m3)) {
        print(m3[row, col])
    }
}

# 행렬 곱
m1 = matrix(c(1:6), nrow=2, ncol=3)     # 2 x 3
m2 = matrix(c(1:6), nrow=3, ncol=2)     # 3 x 2
m1 %*% m2            # 2 x 2         [,1] [,2]
                     #          [1,]   22   49
                     #          [2,]   28   64

# 전치 행렬(transpose)
t(m1)


##### Array
arr = array(1:24, dim = c(2,3,4))
arr
dim(arr)            # 2 3 4
length(arr)         # 24

arr[1, 1, 4]        # 19
