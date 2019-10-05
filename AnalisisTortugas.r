# Dependencies
# For correlation rank libraries
if(!require(devtools)) install.packages("devtools")
devtools::install_github("kassambara/ggpubr")

#Load the readr library to bring in the dataset
if(!require(readr)) install.packages("readr")
devtools::install_github("kassambara/ggpubr")
library(readr) 
###################################################

#Load the data set
my_data= read_csv(file='~/Documents/Projects/Estudio-Tortugas/tortugas.csv', col_names = TRUE)



library("ggpubr")
x <- subset(my_data, gender==1)
y <- subset(my_data, gender==2)

# size of samples are n <= 25 so we use t-student to check the hypothesis


lenght <-cor.test(x$Lenght, y$Lenght, alternative = "two.sided", method = "spearman", conf.level = 0.95, exact = FALSE)
lenght # to show the data

width <-cor.test(x$Width, y$Width, alternative = "two.sided", method = "spearman", conf.level = 0.95, exact = FALSE)
width

height <-cor.test(x$Height, y$Height, alternative = "two.sided", method = "spearman", conf.level = 0.95, exact = FALSE)
height 

ggscatter(my_data, x = "Lenght", y = "Lenght",
          add = "reg.line", 
          add.params = list(color = "blue", fill = "lightgray"), 
          conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "spearman",
          xlab = "Largo M", ylab = "Largo H")

ggscatter(my_data, x = "Width", y = "Width",
          add = "reg.line",
          add.params = list(color = "blue", fill = "lightgray"), 
          conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "spearman",
          xlab = "Ancho M", ylab = "Ancho H")

ggscatter(my_data, x = "Height", y = "Height",
          add = "reg.line",
          add.params = list(color = "blue", fill = "lightgray"), 
          conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "spearman",
          xlab = "Altura M", ylab = "Altura H")
#t.test(lenght$estimate[["rho"]])

# Analisis, la covarianza es linear, ya que en todas laas graficas es una linea recta,

# revisamos normalidad

shapiro.test(x$Lenght) # => p = 0.7251
shapiro.test(x$Width) # => p = 0.8175
shapiro.test(x$Height) # => p = 0.4581

shapiro.test(y$Lenght) # => p = 0.3459
shapiro.test(y$Width) # => p = 0.7576
shapiro.test(y$Height) # => p = 0.5868

# El test de shapiro revisa la normalidad devolviendo valores de p, si todas las parejas 
# son mayores a 0.05 entonces se puede asumir normalidad
# estas graficas muestran el area visual de la normal (el gris) y la ubicacion de los
#datos respecto a la normal
ggqqplot(my_data$Lenght, ylab = "Lenght")
ggqqplot(my_data$Width, ylab = "Width")
ggqqplot(my_data$Height, ylab = "Height")








