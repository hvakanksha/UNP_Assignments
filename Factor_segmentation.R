FactorC2 <- read.csv("FactorC2.csv") #Imports data
summary(FactorC2) #Gives summary of data

# check correlation among variables
correl = cor(FactorC2) #Gives correlation matrix
correl
?cor  #Checks function code

correl #displays output saved under the chosen name; in this case "correl"

# for factor analysis
install.packages("psych")                                                          #R packages are extensions to the R statistical programming language. R packages contain functions, code, data, and documentation in a standardised collection format that can be installed by users of R, typically via a centralised software repository such as CRAN(Comprehensive R Archive Network: cran.r-project.org)
library(psych)
#detach("package:psych", unload = T)

# Bartlett's test of spherecity ("psych")
cortest.bartlett(correl, n = nrow(FactorC2)) # n is the sample size of the dataset, correl is the correlation matrix
#cortest.bartlett(correl, n = 30)
#cortest.bartlett(correl, n = nrow(FactorC2[, -c(2,4)])) #we can keep removing the redundant variable one by one and check the improvement in the output/result
      #D
# KMO (Kaiser-Meyer-Olkin) test for sampling adequacy
KMO(correl)
                                                             #MSA is measure of sampling adequacy
#PCA
?pca
pca1 = pca(correl, nfactors = 6,method = "regression", rotate = "none") #Gives factors/components/ segments          
pca1

pca2 = pca(correl, nfactors = 2, method = "regression", rotate = "none") #Gives relevant factors/components/ segments
pca2

pca3 = pca(correl, nfactors = 2, method = "regression", rotate = "varimax") #Gives IMPROVED relevant factors/components/ segments
pca3
# RC1,...(rotated component matrix)
#pca3$values
#pca3$communality
print(pca3$loadings, digits = 2, cutoff = .5)

# Finally check for factor loadings.No of factors that I want...? cross loadings,communality, cummulative variance min 60% (and threshold values of Bartlet's, KMO & Eigenvalue are met)

pca3$r.scores

###############################
# GIVE NAMES 
###############################




#If any of the variable(s)to be removed...
#correl = cor(FactorC2[, -c(2,4)]) #we can keep removing the redundant variable one by one and check the improvement in the output/result
#correl = cor(FactorC2[,-c(1:3)])

#correl = cor(FactorC2[,2:4])
Remove_FactorC2 <- read.csv("Remove_FactorC2.csv") #Imports data

correl = cor(Remove_FactorC2)

correl = cor(Remove_FactorC2[,-6])

install.packages("psych")                                                          #R packages are extensions to the R statistical programming language. R packages contain functions, code, data, and documentation in a standardised collection format that can be installed by users of R, typically via a centralised software repository such as CRAN(Comprehensive R Archive Network: cran.r-project.org)
library(psych)
# Bartlett's test of spherecity ("psych")
cortest.bartlett(correl, n = nrow(Remove_FactorC2)) # n is the sample size of the dataset, correl is the correlation matrix
#cortest.bartlett(correl, n = 30)
#cortest.bartlett(correl, n = nrow(Remove_FactorC2[, -c(2,4)])) #we can keep removing the redundant variable one by one and check the improvement in the output/result
#D
# KMO (Kaiser-Meyer-Olkin) test for sampling adequacy
KMO(correl)
#MSA is measure of sampling adequacy
#PCA
?pca
pca1 = pca(correl, nfactors = 11,method = "regression", rotate = "none") #Gives factors/components/ segments          
pca1

pca2 = pca(correl, nfactors = 3, method = "regression", rotate = "none") #Gives relevant factors/components/ segments
pca2

pca3 = pca(correl, nfactors = 3, method = "regression", rotate = "varimax") #Gives IMPROVED relevant factors/components/ segments
pca3
# RC1,...(rotated component matrix)
#pca3$values
#pca3$communality
print(pca3$loadings, digits = 2, cutoff = .5)

# Finally check for factor loadings. cross loadings,communality, cummulative variance (and threshold values of Bartlet's, KMO & Eigenvalue are met)

pca3$r.scores

###############################
# GIVE NAMES 
###############################
