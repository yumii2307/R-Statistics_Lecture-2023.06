##### 함수
hello_function = function() {
    print('Hello world!')
}
hello_function()

# 파라메터 전달
add_func = function(a, b) {
    return(a + b)
}
add_func(3, 4)

# Default Parameter
my_func = function(country = 'Korea') {
    return(paste("I'm from", country))
}
my_func()           # "I'm from Korea"
my_func('Swiss')    # "I'm from Swiss"

# Recursion: Fibonacci
fibo = function(n) {
    if (n == 1 || n == 2) {
        return(1)
    }
    return(fibo(n-1) + fibo(n-2))
}
for (i in 1:10) {
    print(paste(i, fibo(i)))
}

##### 전역 변수
txt = '전역 변수'
my_func = function() {
    txt = 'fantastic'
    print(paste('R is', txt))
}
my_func()       # "R is fantastic"
print(txt)      # "전역 변수"
