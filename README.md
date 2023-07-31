# Google_Capstone_Project_Cyclistic_Case_Study

## Introduction

I will demonstrate the skills of a junior data analyst in this case study. I will work for a fictional company, Cyclistic, and interact with various characters and team members. I will follow the steps of the data analysis process: ask, prepare, process, analyze, share, and act, to answer the key business questions.


SQL queries:

[1. Data_Combining.sql](https://github.com/fahmifauzi00/Google_Capstone_Project_Cyclistic_Case_Study/blob/c9b1a41efb7b86153110589a943b7eb453fb4b59/1.%20Data_Combining.sql)

[2. Data_Exploration.sql](https://github.com/fahmifauzi00/Google_Capstone_Project_Cyclistic_Case_Study/blob/c9b1a41efb7b86153110589a943b7eb453fb4b59/2.%20Data_Exploration.sql)

[3. Data_Cleaning.sql](https://github.com/fahmifauzi00/Google_Capstone_Project_Cyclistic_Case_Study/blob/c9b1a41efb7b86153110589a943b7eb453fb4b59/3.%20Data_Cleaning.sql)

[4. Analysing_Data.sql](https://github.com/fahmifauzi00/Google_Capstone_Project_Cyclistic_Case_Study/blob/c9b1a41efb7b86153110589a943b7eb453fb4b59/4.%20Analysing_Data.sql)


## Background

### Scenario

I am a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, my team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve my recommendations, so they must be backed up with compelling data insights and professional data visualizations. 


### Cyclistic

In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system at anytime. 

Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members. 

Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a very good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs. 

Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the marketing analyst team needs to understand better how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.


## Ask

### Business Task
How can Cyclistic increase the conversion of casual riders to become members?

### Questions
1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?

Moreno has assigned you the first question to answer: How do annual members and casual riders use Cyclistic bikes differently?


## Prepare

### Data Source
I used Cyclistic’s historical trip data to analyze and identify trends that can be found [here](https://divvy-tripdata.s3.amazonaws.com/index.html). The datasets have a different name because Cyclistic is a fictional company. For the purposes of this case study, the datasets are appropriate and will enable me to answer the business questions. The data has been made available by Motivate International Inc. under this [license](https://ride.divvybikes.com/data-license-agreement).

This is public data that can be used to explore how different customer types are using Cyclistic bikes. But note that data-privacy issues prohibit you from using riders’ personally identifiable information. This means that you won’t be able to connect pass purchases to credit card numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes.


## Process
I use BigQuery to combine the data and clean it because there are a lot of rows to process the data. Microsoft Excel cannot manage such large datasets.

### Data Combination

I created a dataset and named it 'bike_tripdata_2022'. Uploaded 12 CSV tables of each month in 2022 into the BigQuery platform. Then, I create another table named 'combined_data' by combining all the 12 tables into one table. It contains 5,667,245 rows and 13 columns.

![no columns](https://github.com/fahmifauzi00/Google_Capstone_Project_Cyclistic_Case_Study/assets/114718646/94229b09-3676-40c3-9049-39c8f3886e38)

-The SQL queries can be found [here](https://github.com/fahmifauzi00/Google_Capstone_Project_Cyclistic_Case_Study/blob/ea5d9edef754a819f016a7df7f9412b87fc09678/1.%20Data_Combining.sql).

### Data Exploration

Running queries on each column and field of the merged database allowed me to get to know it better while making notes on the data that needed to be cleaned up. You can see my pre-cleaning SQL data exploration method [here](https://github.com/fahmifauzi00/Google_Capstone_Project_Cyclistic_Case_Study/blob/ea5d9edef754a819f016a7df7f9412b87fc09678/2.%20Data_Exploration.sql). Below is an example of my analysis of the first column, "ride_id":

![image](https://github.com/fahmifauzi00/Google_Capstone_Project_Cyclistic_Case_Study/assets/114718646/07a81658-7eb1-4ebf-913c-da910f4d1f8f)

1. ride_id all have the same 16 characters long except for the other 3794 rows with different lengths. This column doesn't have duplicates. ride_id need to be cleaned.

2. In the rideable_bike column there are 3 different types of bikes. It includes classic bikes, docked bikes, and electric bikes.

3. The started_at and ended_at fields display the trip's start and end times in UTC format using the YYYY-MM-DD hh:mm:ss. To determine the overall journey length, a new column called ride_length can be established. There are 170146 rows of trips with less than one minute and more than one day, both of which should be eliminated. The additional columns day_of_week and month can also be useful in the examination of trips at various times throughout the year.

4. start_station_name and start_station_id are missing in a total of 833039 rows, which have to be deleted.

5. end_station_name and end_station_id are missing in a total of 892565 rows, which have to be deleted.

6. end_lat and end_lng are missing in a total of 5858 rows, which must be deleted.

7. member_casual column has 2 unique values as a member or casual rider.

8. start_station_id/end_station_id: there are various inconsistencies in string length and these columns do not add value to our analysis; thus, we will remove the columns for the final cleaned table.


### Data Cleaning

Here is a list of the cleaning procedures that I had done:

1. Removed trips where the starting/ending latitude or longitude columns were null.
2. Trips that had a ride time of more than one day or less than or equal to one minute were removed.
3. To strengthen analysis, day_of_week, month, and ride_length columns were created.
4. I removed 1,401,818 rows in total, leaving a clean merged table with 4,265,427 rows.

 -SQL queries can be found [here](https://github.com/fahmifauzi00/Google_Capstone_Project_Cyclistic_Case_Study/blob/ea5d9edef754a819f016a7df7f9412b87fc09678/3.%20Data_Cleaning.sql).


## Analyze/Share

Now that the data has been thoroughly cleaned, it is time to analyze it and answer the question, "How do annual members and casual riders use Cyclistic bikes differently?"

I used SQL to sort, filter, and aggregate my data before putting it into Tableau to generate data visualizations to analyze it. My SQL analytical queries can be viewed [here](https://github.com/fahmifauzi00/Google_Capstone_Project_Cyclistic_Case_Study/blob/ea5d9edef754a819f016a7df7f9412b87fc09678/4.%20Analysing_Data.sql) and all of my Tableau visualizations are available here: [[1](https://public.tableau.com/app/profile/fahmi.fauzi/viz/CylisticBike-shareCaseStudy/Dashboard1)][[2](https://public.tableau.com/app/profile/fahmi.fauzi/viz/CylisticBike-shareCaseStudy2/Dashboard2)][[3](https://public.tableau.com/app/profile/fahmi.fauzi/viz/CylisticBike-shareCaseStudy3/Dashboard3)]

### Insights

First, I looked at the bike type preferences of annual members and casual riders.

![Dashboard 1 (1)](https://github.com/fahmifauzi00/Google_Capstone_Project_Cyclistic_Case_Study/assets/114718646/52961a78-995b-46c8-9769-abcdad1021c5)

Members account for 59.61% of the total, with the remaining 40.39% being casual riders. Each bike type chart indicates a percentage of the total. The classic bike is the most popular, followed by the electric bike. Only casual riders utilize docked bikes.

The number of trips is then studied in relation to the months, days of the week, and hours of the day.

![Dashboard 2](https://github.com/fahmifauzi00/Google_Capstone_Project_Cyclistic_Case_Study/assets/114718646/6bee6625-4fb8-46ea-90e8-72f4def1df21)

By months: Both casual and members display similar behavior when it comes to monthly trips, with more trips occurring in the spring and summer and fewer in the winter. The summer month of July is when the difference between members and casuals is the smallest.

By days of the week: When the different days of the week are compared, it is shown that casual riders travel more on weekends whereas members experience a decline over the weekend in comparison to the other days of the week.

By Hour: Based on the number of trips, the members display 2 peaks. One is in the morning from around 6 to 8 am, and the other is in the evening from about 4 to 8 pm. The number of trips for casual riders increases steadily throughout the day until the evening, and then it decreases.

From these results, we may start to hypothesize that annual members utilize Cyclistic bikes for commuting since their ridership levels peak around the regular commuting times for work (8 am/5 pm) and decline outside of typical work hours. In addition, compared to casual members, annual member ridership levels show less of a trend of declining in the winter. We can also speculate that non-members utilize Cyclistic bikes more for leisure activities.

To determine the differences between the behavior of casual and member riders, the ride lengths of the trips are compared.

![Dashboard 3](https://github.com/fahmifauzi00/Google_Capstone_Project_Cyclistic_Case_Study/assets/114718646/b134fc40-60a8-4135-aec5-7d1e925ef109)

Take note that casual riders cycle for longer than members on average. The average length of a member's journey does not vary during the year, week, or day. However, how long casual riders cycle varies. They travel more distances in the spring and summer, on weekends, and between 10 am and 2 pm. They make short journeys between 5 and 8 am.

These findings suggest that casual riders travel for a greater period of time (almost twice as long) but less frequently than members. They travel longer distances on weekends and throughout the day outside of commute hours, and they may be doing so for enjoyment purposes during the spring and summer seasons.

Both of these observations significantly confirm our theory, leading us to the conclusion that annual members typically commute by using Cyclistic's bikes for quick trips to get to work during the week while casual riders typically use Cyclistic's bikes for pleasure on the weekends.

### Summary

Casual Riders:
- Cyclistic bikes are mostly used for recreation, with most rides taking place during the midday hours on weekends in late spring and early summer.
- Travel less regularly but for a longer time than members.

Member:
- Cyclistic bikes are typically used for commuting; users prefer to ride during peak work commute hours (8 am to 5 pm) and on weekdays throughout the year, with a drop off in the winter.
- Travel more frequently but with a shorter ride time.


## Act

The marketing division can begin to build its plan for converting casual members to annual members after defining the differences between casual riders and annual members.

### Recommendations:

1. In the spring and summer, marketing efforts can be held in tourist and recreational areas that are well-liked by casual riders.
2. Casual riders may be provided seasonal or weekend-only memberships because they are more active on the weekends, in the summer, and in the spring.
3. Compared to members, casual riders use their bikes for longer periods of time. Longer ride discounts may encourage casual riders and encourage members to ride for longer durations.
