# Load essential libraries
library(tidyverse)
library(readr)


# Load the data (uses ; as separator)
marketing <- read_delim("marketing_campaign.csv", delim = ";")

# View structure
glimpse(marketing)

# View first few rows
head(marketing)


# Check shape
dim(marketing)  # Should return 2240 rows × 29 columns

# Check missing values
colSums(is.na(marketing))


# View structure
str(marketing)


marketing$Dt_Customer <- as.Date(marketing$Dt_Customer, format = "%Y-%m-%d")


colSums(is.na(marketing))


summary(marketing)


unique(marketing$Z_CostContact)
unique(marketing$Z_Revenue)


marketing <- marketing %>%
  select(-Z_CostContact, -Z_Revenue)


# View how many NA
sum(is.na(marketing$Income))

# Option 1: Impute using median
marketing$Income[is.na(marketing$Income)] <- median(marketing$Income, na.rm = TRUE)

# (Alternatively, you could drop rows using na.omit(marketing) if you prefer)


# Create Age
marketing$Age <- 2025 - marketing$Year_Birth


# Calculate number of years since joining
marketing$Customer_Tenure <- as.numeric(difftime(as.Date("2025-01-01"), marketing$Dt_Customer, units = "days")) / 365


# Remove unrealistic income outlier (above 200K seems suspicious)
marketing <- marketing %>% filter(Income < 200000)


marketing$TotalSpend <- marketing$MntWines + marketing$MntFruits +
  marketing$MntMeatProducts + marketing$MntFishProducts +
  marketing$MntSweetProducts + marketing$MntGoldProds


marketing$TotalChildren <- marketing$Kidhome + marketing$Teenhome


marketing$CampaignsAccepted <- marketing$AcceptedCmp1 + marketing$AcceptedCmp2 +
  marketing$AcceptedCmp3 + marketing$AcceptedCmp4 + marketing$AcceptedCmp5



# Age Groups
marketing$AgeGroup <- cut(marketing$Age,
                          breaks = c(0, 30, 45, 60, 100),
                          labels = c("Young", "Adult", "Senior", "Elderly"),
                          right = FALSE)

# Income Brackets
marketing$IncomeBracket <- cut(marketing$Income,
                               breaks = c(0, 30000, 60000, 90000, Inf),
                               labels = c("Low", "Medium", "High", "Very High"),
                               right = FALSE)



# Engagement = average of purchase channels + campaign responses
marketing$EngagementScore <- rowMeans(marketing[, c("NumWebPurchases", "NumCatalogPurchases",
                                                    "NumStorePurchases", "CampaignsAccepted")])



library(ggplot2)
library(dplyr)

# Education distribution
ggplot(marketing, aes(x = Education)) +
  geom_bar(fill = "#0073C2FF") +
  theme_minimal() +
  labs(title = "Distribution of Education Levels", x = "Education", y = "Count") +
  coord_flip()

# Marital Status
ggplot(marketing, aes(x = Marital_Status)) +
  geom_bar(fill = "#EFC000FF") +
  theme_minimal() +
  labs(title = "Marital Status Distribution", x = "Marital Status", y = "Count") +
  coord_flip()

# AgeGroup
ggplot(marketing, aes(x = AgeGroup)) +
  geom_bar(fill = "#868686FF") +
  theme_minimal() +
  labs(title = "Age Group Distribution", x = "Age Group", y = "Count")

# Income Bracket
ggplot(marketing, aes(x = IncomeBracket)) +
  geom_bar(fill = "#CD534CFF") +
  theme_minimal() +
  labs(title = "Income Bracket Distribution", x = "Income Bracket", y = "Count")




# Histogram for Income
ggplot(marketing, aes(x = Income)) +
  geom_histogram(bins = 30, fill = "#619CFF", color = "black") +
  theme_minimal() +
  labs(title = "Income Distribution", x = "Income", y = "Frequency")

# Boxplot for Age
ggplot(marketing, aes(y = Age)) +
  geom_boxplot(fill = "#00BFC4") +
  theme_minimal() +
  labs(title = "Boxplot of Age")

# Total Spend
ggplot(marketing, aes(x = TotalSpend)) +
  geom_histogram(bins = 30, fill = "#F8766D", color = "black") +
  theme_minimal() +
  labs(title = "Total Spend Distribution", x = "Total Spend", y = "Frequency")

# Engagement Score
ggplot(marketing, aes(x = EngagementScore)) +
  geom_histogram(bins = 15, fill = "#C77CFF", color = "black") +
  theme_minimal() +
  labs(title = "Engagement Score Distribution", x = "Engagement Score", y = "Count")




ggplot(marketing, aes(x = AgeGroup, fill = factor(Response))) + 
  geom_bar(position = "fill") + 
  labs(fill = "Response")



ggplot(marketing, aes(x = IncomeBracket, fill = factor(Response))) + 
  geom_bar(position = "fill") + 
  labs(fill = "Response")



ggplot(marketing, aes(x = Marital_Status, fill = factor(Response))) + 
  geom_bar(position = "fill")

ggplot(marketing, aes(x = Education, fill = factor(Response))) + 
  geom_bar(position = "fill")


boxplot(TotalSpend ~ Response, data = marketing)



boxplot(EngagementScore ~ Response, data = marketing)



# Load necessary library
library(ggplot2)

# Plot response rate by AgeGroup and IncomeBracket
ggplot(marketing, aes(x = AgeGroup, fill = as.factor(Response))) +
  geom_bar(position = "fill") +
  facet_wrap(~ IncomeBracket) +
  labs(
    title = "Response Rate by Age Group and Income Bracket",
    x = "Age Group",
    y = "Proportion",
    fill = "Response"
  ) +
  theme_minimal()




ggplot(marketing, aes(x = EngagementScore, y = TotalSpend, color = as.factor(Response))) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE, color = "gray") +
  labs(
    title = "Engagement Score vs Total Spend by Response",
    x = "Engagement Score",
    y = "Total Spend",
    color = "Response"
  ) +
  theme_minimal()



ggplot(marketing, aes(x = as.factor(TotalChildren), fill = as.factor(Response))) +
  geom_bar(position = "fill") +
  facet_wrap(~ Marital_Status) +
  labs(
    title = "Response Rate by Total Children and Marital Status",
    x = "Number of Children",
    y = "Proportion",
    fill = "Response"
  ) +
  theme_minimal()



ggplot(marketing, aes(x = CampaignsAccepted, y = TotalSpend, color = as.factor(Response))) +
  geom_jitter(alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE, color = "gray") +
  labs(
    title = "Total Spend vs Campaigns Accepted by Response",
    x = "Campaigns Accepted",
    y = "Total Spend",
    color = "Response"
  ) +
  theme_minimal()



cluster_data <- marketing %>%
  select(Age, Income, EngagementScore, TotalSpend, CampaignsAccepted, TotalChildren)


cluster_data <- na.omit(cluster_data)



cluster_scaled <- scale(cluster_data)



set.seed(123)
wss <- sapply(1:10, function(k){
  kmeans(cluster_scaled, centers = k, nstart = 10)$tot.withinss
})

plot(1:10, wss, type = "b", pch = 19, frame = FALSE,
     xlab = "Number of Clusters K",
     ylab = "Total Within-Cluster Sum of Squares",
     main = "Elbow Method for Optimal K")



set.seed(123)
k4 <- kmeans(cluster_scaled, centers = 4, nstart = 25)

# Add cluster assignments to original marketing data
marketing$Cluster <- as.factor(k4$cluster)



library(dplyr)

marketing %>%
  group_by(Cluster) %>%
  summarise(
    Count = n(),
    Avg_Age = mean(Age),
    Avg_Income = mean(Income),
    Avg_Engagement = mean(EngagementScore),
    Avg_TotalSpend = mean(TotalSpend),
    Avg_CampaignsAccepted = mean(CampaignsAccepted),
    Avg_TotalChildren = mean(TotalChildren)
  )



library(ggplot2)

ggplot(marketing, aes(x = Cluster, y = Age, fill = Cluster)) +
  geom_boxplot() +
  labs(title = "Age Distribution by Cluster")



ggplot(marketing, aes(x = Cluster, y = Income, fill = Cluster)) +
  geom_boxplot() +
  labs(title = "Income Distribution by Cluster")



ggplot(marketing, aes(x = Cluster, y = EngagementScore, fill = Cluster)) +
  geom_boxplot() +
  labs(title = "Engagement Score by Cluster")


ggplot(marketing, aes(x = Cluster, y = TotalSpend, fill = Cluster)) +
  geom_boxplot() +
  labs(title = "Total Spend by Cluster")
