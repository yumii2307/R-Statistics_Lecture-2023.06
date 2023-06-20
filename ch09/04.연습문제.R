### 1. 아버지와 아들의 키
x = c(150, 160, 170, 180, 190)
y = c(176, 179, 182, 181, 185)

df = data.frame(Father = x, Son = y)
model = lm(Son ~ Father, data=df)

new_data = data.frame(Father = 165)
predict(model, newdata = new_data)  # 179.6

### 2. 신용카드 사용량
x = c(100, 200, 300, 400, 500)
y = c(30, 70, 85, 140, 197)

df = data.frame(월소득 = x, 사용량 = y)
model = lm(사용량 ~ 월소득, data=df)

new_data = data.frame(월소득 = 250)
predict(model, newdata = new_data)  # 196.6

### 3. mtcars
df = mtcars[c('disp', 'hp')]
model = lm(hp ~ disp, data=df)
summary(model)                      # R-squared: 0.6256
