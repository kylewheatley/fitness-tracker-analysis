#upload files
weight_log <- read.csv('weightLogInfo_merged.csv')
second_heartrate <- read.csv('heartrate_seconds_merged.csv')
minute_calories_narrow <- read.csv('minuteCaloriesNarrow_merged.csv')
minute_calories_wide <- read.csv('minuteCaloriesWide_merged.csv')
minute_intensities_narrow <- read.csv('minuteIntensitiesNarrow_merged.csv')
minute_intensities_wide <- read.csv('minuteIntensitiesWide_merged.csv')
minute_mets_narrow <- read.csv('minuteMETsNarrow_merged.csv')
minute_sleep <- read.csv('minuteSleep_merged.csv')
minute_steps_narrow <- read.csv('minuteStepsNarrow_merged.csv')
minute_steps_wide <- read.csv('minuteStepsWide_merged.csv')
hour_intensities <- read.csv('hourlyIntensities_merged.csv')
hour_steps <- read.csv('hourlySteps_merged.csv')
hour_calories <-read.csv('hourlyCalories_merged.csv')
day_activity <- read.csv('dailyActivity_merged.csv')
day_calories <- read.csv('dailyCalories_merged.csv')
day_intensities <- read.csv('dailyIntensities_merged.csv')
day_steps <- read.csv('dailySteps_merged.csv')
day_sleep <- read.csv('sleepDay_merged.csv')

#convert columns to lowercase
day_activity <- clean_names(day_activity)
day_calories <- clean_names(day_calories)
day_intensities <- clean_names(day_intensities)
day_sleep <- clean_names(day_sleep)
day_steps <- clean_names(day_steps)

#creating activity_date in day_sleep by separating date and time into separate columns
day_sleep <- day_sleep %>% 
  separate(sleep_day, c('activity_date', 'time'), ' ')

#rename columns to 'activity_date' and delete old column
day_calories$activity_date <- day_calories$activity_day
day_calories = subset(day_calories, select = -c(activity_day))
day_intensities$activity_date <- day_intensities$activity_day
day_intensities = subset(day_intensities, select = -c(activity_day))
day_steps$activity_date <- day_steps$activity_day
day_steps = subset(day_steps, select = -c(activity_day))


#join daily datasets
day_total <- inner_join(day_activity, day_calories, by = c('id', 'activity_date','calories'))

remove(day_total)
