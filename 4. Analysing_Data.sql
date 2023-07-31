/* Analysing Data */

-- Type of bike used by riders

SELECT member_casual, rideable_type, COUNT(*) AS total_trips
FROM `biketripdata2022.bike_tripdata_2022.cleaned_combined_tripdata`
GROUP BY member_casual, rideable_type
ORDER BY member_casual, total_trips;

--Total trips by month

SELECT month, member_casual, COUNT(ride_id) AS total_trips
FROM `biketripdata2022.bike_tripdata_2022.cleaned_combined_tripdata`
GROUP BY month, member_casual
ORDER BY member_casual;

--Total trips by day of the week

SELECT day_of_week, member_casual, COUNT(ride_id) AS total_trips
FROM `biketripdata2022.bike_tripdata_2022.cleaned_combined_tripdata`
GROUP BY day_of_week, member_casual
ORDER BY member_casual;

--Total trips by hour

SELECT EXTRACT(HOUR FROM started_at) AS hour_of_day, member_casual, COUNT(ride_id) AS total_trips
FROM `biketripdata2022.bike_tripdata_2022.cleaned_combined_tripdata`
GROUP BY hour_of_day, member_casual
ORDER BY member_casual;

--Average ride time by month

SELECT month, member_casual, AVG(ride_length) AS avg_ride_duration
FROM `biketripdata2022.bike_tripdata_2022.cleaned_combined_tripdata`
GROUP BY month, member_casual;

--Average ride time by day of the week

SELECT day_of_week, member_casual, AVG(ride_length) AS avg_ride_duration
FROM `biketripdata2022.bike_tripdata_2022.cleaned_combined_tripdata`
GROUP BY day_of_week, member_casual;

--Average ride time by the hour

SELECT EXTRACT(HOUR FROM started_at) AS hour_of_day, member_casual, AVG(ride_length) AS avg_ride_duration
FROM `biketripdata2022.bike_tripdata_2022.cleaned_combined_tripdata`
GROUP BY hour_of_day, member_casual;

