
ti <- Titanic
ti
View(Titanic)

# train is the datset from kaggle website for ml prediction competition - 

train <- read.csv(file = 'train.csv',header = T, sep = ',')
train
View(train)

names(train)

summary(train)

table(train$Name)

head(train)
tail(train)

str(train)  # This helps us to understand the structre of data-set

summary(train$Pclass)

# what was the surival rate 

library(ggplot2)

ggplot(data = train, aes(x = Name, y = Survived))+
  geom_bar()

ggplot(data = train, aes(x= Survived, fill = Sex))+  # The survival rate based on sex
  geom_bar()

ggplot(data = train, aes(x = Survived, fill = Pclass))+
  geom_bar()

# Lets check the survival percentage

table(train$Survived)
prop.table(table(train$Survived)) # Gives the percentage of survived peoples

pie(prop.table(table(train$Survived)))

# Survival rate based on the plcass

ggplot(data = train, aes( x = Pclass, fill = Survived))+
  theme_bw()
geom_bar()+
  labs(title = "Survival rate based on class", x= "Class of travel", y ='Number of passsengers', colour = "Survival categories")

ggplot(data = train, aes(x = Pclass, fill = Survived))+
  theme_bw()+
  geom_bar()

ggplot(data = train, aes(x = Age,fill = Survived))+
  geom_bar()+
  facet_grid(~Pclass)

ggplot(data = train, aes(x = Pclass, fill = Sex))+
  geom_bar()

ggplot(data = train, aes(x= Pclass, fill = Survived))+
  geom_bar()+
  facet_grid(Embarked~Sex)+
  labs(title = "Survival rate based on class, Embarkment & gender",
       subtitle = "Titantic survival of people of diff Sex")

# Survival rate based on age

ggplot(data = train, aes( x= Age, fill = Survived))+
  theme_bw()+
  geom_histogram(binwidth = 5)+
  labs(title = "Titanic survival rate based on Age",
       subtitle = "Ages from child to old survival rate",
       x = "Age of passengers",
       y = "Survival status of passenger",
       colour = "Survival status")


ggplot(data = train, aes( x= Age, fill = Survived))+
  theme_bw()+
  geom_histogram(binwidth = 5)+
  facet_wrap(Pclass~Sex)

is.na(train$Age)
colSums(is.na(train))

train$Embarked[train$Embarked == ""] = "C"  # Changing all the empty values in embarment to 'C'

train$Embarked

# Lets see how many fields can we move to factors

apply(train, 2, function(x) length(unique(x)))

# as survival,class,sex and embarkment is less lets change them to factors

cols <- c('Survival','Pclass','Embarkment','Sex')

for(i in cols){
  
  train[,i] <- as.factor(train[,i])
}

is.factor(train$PassengerId)
is.factor(train$Pclass)

as.factor(train$Pclass)
str(train)
