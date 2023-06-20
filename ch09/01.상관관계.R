##### 상관관계
hf = read.table('data/Galton.txt', header=T, stringsAsFactors=F)
tail(hf)
hf$Gender = factor(hf$Gender, levels=c('M', 'F'))
# filtering
hf.son = hf[hf$Gender == 'M',]      # hf.son = subset(hf, Gender=='M')
# selection
hf.son = hf.son[c('Father', 'Height')]
# inch --> cm 으로 변환
hf.son = hf.son * 2.54

### 공분산(Covariance)
f.mean = mean(hf.son$Father)
s.mean = mean(hf.son$Height)
cov.num = sum((hf.son$Father - f.mean) * (hf.son$Height - s.mean))
cov.fs = cov.num / (length(hf.son$Father) -1)
cov.fs              # 15.28023
# R의 cov() 함수 이용
cov(hf.son$Father, hf.son$Height)       # 15.28023

### 상관계수
f.sd = sd(hf.son$Father)
s.sd = sd(hf.son$Height)
c(f.sd, s.sd)       # 5.841820 6.684249
cor.fs = cov.fs / (f.sd * s.sd)
cor.fs              # 0.3913174
# R의 cor() 함수 이용
cor(hf.son$Father, hf.son$Height)       # 0.3913174

# 엄마와 딸의 관계 분석
hf.dat = hf[hf$Gender == 'F',]
hf.dat = hf.dat[c('Mother', 'Height')]
hf.dat = hf.dat * 2.54
# 공분산
cov(hf.dat$Mother, hf.dat$Height)       # 10.92328
# 상관계수
cor(hf.dat$Mother, hf.dat$Height)       # 0.3136984


### 그림으로 비교
par(mfrow=c(1, 2))
plot(hf.son$Father, hf.son$Height, main='Father vs Son')
plot(hf.dat$Mother, hf.dat$Height, main='Mother vs Daugther')
par(mfrow=c(1, 1))