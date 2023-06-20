##### R 통계기반 데이터 분석

### 1. mpg dataset
# 01. compact 자동차와 midsize 자동차의 고속도로(hwy) 연비
library('ggplot2')
head(mpg)
compact = mpg[mpg$class == 'compact',]
midsize = mpg[mpg$class == 'midsize',]
t.test(compact$hwy, midsize$hwy)
# p-value = 0.1232 / 귀무가설 채택

# 02. compact 자동차와 midsize 자동차의 도시(cty) 연비
t.test(compact$cty, midsize$cty)
# p-value = 0.02061 / 귀무가설 기각

# 03. 일반 휘발유(r)와 고급 휘발유(p)의 고속도로 연비
premium = mpg[mpg$fl == 'p',]
regular = mpg[mpg$fl == 'r',]
t.test(premium$hwy, regular$hwy)
# p-value = 0.001576 / 귀무가설 기각

# 04. compact 자동차의 전륜구동(f)이냐 4륜구동(4)이냐에 따른 고속도로 연비
shapiro.test(compact$hwy[compact$drv == 'f'])
# p-value = 0.000253 / 귀무가설 기각
shapiro.test(compact$hwy[compact$drv == '4'])
# p-value = 0.002263 / 귀무가설 기각
t.test(compact$hwy[compact$drv == 'f'], compact$hwy[compact$drv == '4'])
# p-value = 6.5e-05 / 귀무가설 기각

# 05. compact, subcompact, midsize 자동차의 고속도로 연비
compact = mpg[mpg$class == 'compact',]
subcompact = mpg[mpg$class == 'subcompact',]
midsize = mpg[mpg$class == 'midsize',]

t.test(compact$hwy, subcompact$hwy)
# p-value = 0.8846 / 귀무가설 채택
t.test(compact$hwy, midsize$hwy)
# p-value = 0.1232 / 귀무가설 채택
t.test(subcompact$hwy, midsize$hwy)
# p-value = 0.3846 / 귀무가설 채택

### 2. 회귀
# 01. 어느 대학교에서 대중교통을 이용하여 등교하는 학생의 비율을 알아보기 위하여
# 이 학교 학생 중 100 명을 임의 추출하여 조사한 결과
# 80%의 학생이 대중교통을 이용하여 등교하는 것으로 나타났다. 
# 이 결과를 이용하여 이 대학교 전체 학생 중에서 
# 대중교통을 이용하여 등교하는 학생의 비율 p에 대한 신뢰도 95%의 신뢰 구간을 구하시오.
phat = 0.8
n = 100
ll = phat - 1.96 * sqrt(phat * (1-phat) / n)    # ll = phat - 0.98 / sqrt(n)
ul = phat + 1.96 * sqrt(phat * (1-phat) / n)    # ul = phat + 0.98 / sqrt(n)
c(ll, ul)
# 0.7216 0.8784

# 02. 어느 전구회사에서 생산하는 전구의 수명은
# 평균이 800일이고 표준편차가 30일인 정규분포를 따른다고 한다.
# 그럼 전구의 수명이 830일 이상 860일 이하일 확률을 구하시오.
round(pnorm(860, 800, 30) - pnorm(830, 800, 30), 4) * 100
# 13.59(%)

# 03. mtcars 데이터셋에서 배기량(disp)에 따른 마력(hp)의 회귀식을 구하시오.
df = mtcars[c('disp', 'hp')]
model = lm(hp ~ disp, data=df)
summary(model)                      # R-squared: 0.6256