##### R 변수
name <- 'James'
age = 25        # 할당 연산자로 <-, = 을 사용할 수 있음

name
print(age)
print(name, age)    # Error : 단일 print() 만 가능
print(paste(name, age))    # Python의 '+' -> "James 25"
print(paste0(name, age))    # "James25"

# 변수명 - 단어와 단어 사이의 구분자로 . 을 주로 사용함
person.name <- 'Maria'
person.gender <- 'Female'
person.age <- 23

##### R 데이터 타입
# 1. numeric
x = 10.5

# 2. integer
y = 10L
class(y)

# 3. complex(복소수)
z = 9 + 3i
class(z)
print(z * z)

# 4. character(a.k.a. string)
s = 'R is exciting'
class(s)

# 5. logical(a.k.a. boolean: TRUE, FLASE, T, F)
class(T)

# Type conversion
as.numeric(y)
as.numeric(TRUE)    # 1
as.character(F)     # "FALSE"

##### Math
10 + 5
'10' + '5'      # Error : paste() 사용
max(5, 10, 15)  # 15
sqrt(16)        # 4
ceiling(1.4)    # 2
floor(2.3)      # 2

##### Strings
str <- "Lorem ipsum dolor sit amet,
consectetur adipiscing elit"        # multi-line string
str             # \n과 함께 출력
cat(str)        # 줄바꿈 된 상태를 출력
length(str)     # 1
nchar(str)      # 55 : 문자의 갯수

##### 연산자(Operators)
# 1. 산술 연산자: +, -, *, /
2 ^ 5       # 32, 제곱, exponent
5 %% 2      # 1, 나머지, modulo
5 %/% 2     # 2, 몫

# 2. 비교 연산자: 파이썬과 동일

# 3. 논리 연산자: &, &&, |, ||, !
x > 10 && x < 20    # TRUE, Logical AND, 10 < x < 20
person.age > 24 || age > 24     # TRUE, Logical OR
!(nchar(s) > 5)     # FLASE, Logical NOT

c(1, 2, 3) < c(-2, 3, 1)    # FALSE TRUE FALSE
c(F, F, T, T) & c(F, T, F, T) # FALSE FALSE FALSE TRUE
c(F, F, T, T) | c(F, T, F, T) # FALSE TRUE TRUE TRUE
