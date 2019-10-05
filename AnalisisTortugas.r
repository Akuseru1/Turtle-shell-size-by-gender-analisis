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


height <-cor.test(x$Lenght, y$Lenght,  method = "spearman")
height # to show the data

width <-cor.test(x$Width, y$Width,  method = "spearman")
width

height <-cor.test(x$Height, y$Height,  method = "spearman")
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








