### 1. 어느 회사에서 종업원들의 근무기간을 조사하였는데, 종업원들의 근무기간은
### 평균이 11년이고 표준편차가 4년인 정규분포를 따른다고 한다.
### 그럼 이 회사에서 14년 이상 근무한 종업원의 비율을 구하시오.

options(digits=4)
mu = 11
sigma = 4
ll = mu - 2 * sigma         # 3, lower limit
ul = mu + 2 * sigma         # 19, upper limit

x = seq(ll, ul, by=0.01)
px = dnorm(x, mean=mu, sd=sigma)
plot(x, px, type='l', xlab='평균 근무기간', ylab='P[X=x]',
     lwd=2, col='red', main='N(11, 4^2)')

prob = round(pnorm(14, 11, 4), 4)         # 0.7734
print(paste('14년 이상 근무한 종업원의 비율은', (1-prob)*100, '(%) 입니다.'))

# "14년 이상 근무한 종업원의 비율은 22.66 (%) 입니다."


### 2. 어느 전구회사에서 생산하는 전구의 수명은 평균이 800일이고 표준편차가 30일인
### 정규분포를 따른다고 한다. 그럼 전구의 수명이 760일 이하일 확률을 구하시요.

options(digits=4)
mu = 800
sigma = 30
ll = mu - 15 * sigma         # 350, lower limit
ul = mu + 15 * sigma         # 1250, upper limit

x = seq(ll, ul, by=0.01)
px = dnorm(x, mean=mu, sd=sigma)
plot(x, px, type='l', xlab='평균 전구 수명', ylab='P[X=x]',
     lwd=2, col='red', main='N(800, 30^2)')

prob = round(pnorm(760, 800, 30), 4)         # 0.0912
print(paste('전구의 수명이 760일 이하일 확률은', prob*100, '(%) 입니다.'))

# "전구의 수명이 760일 이하일 확률은 9.12 (%) 입니다."


### 3. 어느 고등학교 3학년 학생들의 수학 성적은 평균이 70점이고 표준편차가 8점인
### 정규분포를 따른다고 한다. 그럼 점수가 80점 이상이고 90점 이하일 확률을 구하시오.

options(digits=4)
mu = 70
sigma = 8
ll = mu - 4 * sigma         # 38, lower limit
ul = mu + 4 * sigma         # 102, upper limit

x = seq(ll, ul, by=0.01)
px = dnorm(x, mean=mu, sd=sigma)
plot(x, px, type='l', xlab='평균 수학 성적', ylab='P[X=x]',
     lwd=2, col='red', main='N(70, 8^2)')

prob = round(pnorm(90, 70, 8) - pnorm(80, 70, 8), 4)     # 0.0994
print(paste('수학 점수가 80점 이상이고 90점 이하일 확률은', prob*100, '(%) 입니다.'))

# "수학 점수가 80점 이상이고 90점 이하일 확률은 9.94 (%) 입니다."