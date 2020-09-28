library(conjoint)

experiment<-expand.grid(
  Planning = c("2D CAD Drawings","3D Isometric Drawings","Augmented Reality Drawings"),
  ProductPerformance = c("Safety", "Reduction of shutdown time", "Improve Overall equipment efficiency"),
  Training = c("Online Class Training", "In-House Training","On-Site Training and Field Support"),
  Costs = c("Cost of Scaffold","Cost of Labor","Cost of Equipment Shutdown"))

design = caFactorialDesign(data = experiment, type = "orthogonal")
print(design)
code = caEncodedDesign(design)
print(code)
print(cor(code))

write.csv(design, file = "surveydesign.csv")
write.csv(code, file = "conjointsurvey.csv", row.names = FALSE)

##The surveydata consists of fake respondent data
surveydata <- read_excel("Layher/conjointsurveydata.xlsx")#Read in the excel file with the survey respondent ratings
conjointdesign<-read.csv("C:/Users/User/Desktop/conjointsurvey.csv")#read in the file we created earlier

lev<-c("2D CAD Drawings","3D Isometric Drawings","Augmented Reality Drawings", 
       "Safety", "Reduction of shutdown time", "Improve Overall equipment efficiency",
       "Online Class Training", "In-House Training","On-Site Training and Field Support",
       "Cost of Scaffold","Cost of Labor","Cost of Equipment Shutdown")
lev.df<- data.frame(lev)

caModel(y = surveydata[1,2:10], x = conjointdesign[,])

a = data.frame(surveydata[,2:10])
b = data.frame(mydataconjoint[,])
Conjoint(a, b, z = lev.df)#Provides importance of each factor, plus importance within each factor



