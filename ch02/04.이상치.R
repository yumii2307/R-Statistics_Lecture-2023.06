# Iris 데이터의 이상치 데이터 확인하기
head(iris)
setosa = iris[iris$Species == 'setosa', ]
qs = quantile(setosa$Sepal.Width)
iqr = qs[4] - qs[2]                 # 0.475
ul = qs[4] + 1.5 * iqr              # 4.39
ll = qs[2] - 1.5 * iqr              # 2.49
setosa$Sepal.Width[setosa$Sepal.Width > ul | setosa$Sepal.Width < ll] # 4.4 2.3

for (feature_name in colnames(iris)[1:4]) {
    features = setosa[, feature_name]
    qs = quantile(features)
    iqr = qs[4] - qs[2]
    ul = qs[4] + 1.5 * iqr
    ll = qs[2] - 1.5 * iqr
    outliers = features[features > ul | features < ll]
    print(paste('Setosa 품종의', feature_name, '피쳐의 이상치는', length(outliers), '개 입니다.'))
}

for (species in c('setosa', 'versicoler', 'virginica')) {
    for (feature_name in colnames(iris)[1:4]) {
        features = iris[iris$Species == species, feature_name]
        qs = quantile(features)
        iqr = qs[4] - qs[2]
        ul = qs[4] + 1.5 * iqr
        ll = qs[2] - 1.5 * iqr
        outliers = features[features > ul | features < ll]
        print(paste(species, '품종의', feature_name, '피쳐의 이상치는', length(outliers), '개 입니다.'))
    }
}

boxplot(iris[iris$Species == 'setosa', 'Sepal.Width'])
boxplot(iris[iris$Species == 'setosa', 'Petal.Length'])
boxplot(iris[iris$Species == 'setosa', 'Petal.Width'])
boxplot(iris[iris$Species == 'virginica', 'Sepal.Length'])
boxplot(iris[iris$Species == 'virginica', 'Sepal.Width'])
