library(dplyr)

# Deliverable 1

# read in the csv file
mecha_car <- read.csv("./Data/MechaCar_mpg.csv", check.names = F, stringsAsFactors = F)

# perform linear regession using the lm() function,  and pass all six variables (columns)
mecha_car_lm <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, mecha_car)
mecha_car_lm

# get summary statistic 
summary <- summary(mecha_car_lm)
summary


# Deliverable 2
# read in the csv file
suspension_coil <- read.csv("./Data/Suspension_Coil.csv", check.names = F, stringsAsFactors = F)

# create a total_summary data frame using summarize() function to get the mean, median, variance, and standard deviation of the suspension coil's PSI column.
total_summary <- suspension_coil %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

# creates a lot_summary dataframe using the group_by() and the summarize() functions to group each manufacturing lot by the mean, median, variance, and standard deviation of the suspension coil’s PSI column.
lot_summary <- suspension_coil %>% 
  group_by(Manufacturing_Lot) %>% 
  summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

# Deliverable 3
#using the t.test() function to determine if the PSI across all manufacturing lots is statistically different from the population mean of 1,500 pounds per square inch.
t.test(suspension_coil$PSI, mu=1500)

#using the t.test() function and its subset() argument to determine if the PSI for each manufacturing lot is statistically different from the population mean of 1,500 pounds per square inch.
# Lot 1
t.test(subset(suspension_coil, Manufacturing_Lot=="Lot1")$PSI, mu=1500)

# Lot 2
t.test(subset(suspension_coil, Manufacturing_Lot=="Lot2")$PSI, mu=1500)

# Lot 3
t.test(subset(suspension_coil, Manufacturing_Lot=="Lot3")$PSI, mu=1500)




