/* Data Exploration 

#1.Checking the data types of all columns  with total of 15 columns
*/

SELECT column_name, data_type
FROM `biketripdata2022.bike_tripdata_2022`.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'combined_tripdata';

/* #2.Checking for null values in all columns */

SELECT *
FROM `biketripdata2022.bike_tripdata_2022.combined_tripdata`
WHERE CONCAT(
ride_id, 
rideable_type, 
started_at, ended_at, 
start_station_name, 
start_station_id, 
end_station_name, 
end_station_id, 
start_lat, 
start_lng, 
end_lat, 
end_lng, 
member_casual, 
day_of_week
) 
IS NULL;


/* #3 Checking each column from left to right for cleaning */

--ride_id: checking for duplicate rows and length of ride_id

SELECT COUNT(DISTINCT ride_id) AS duplicate_rows
FROM `biketripdata2022.bike_tripdata_2022.combined_tripdata`;

SELECT LENGTH(ride_id) AS length_ride_id, count(*) no_of_rows
FROM `biketripdata2022.bike_tripdata_2022.combined_tripdata`
GROUP BY LENGTH(ride_id);

--all rows have 16 characters long except for other 3794 rows with different length


--rideable_type: consist of 3 different types of bike

SELECT DISTINCT rideable_type
FROM `biketripdata2022.bike_tripdata_2022.combined_tripdata`;


--started_at and ended_at: we only want the rows for the trip with more than one minute but less than one day

SELECT *
FROM `biketripdata2022.bike_tripdata_2022.combined_tripdata`
WHERE TIMESTAMP_DIFF(ended_at, started_at, MINUTE) <= 1 OR
   TIMESTAMP_DIFF(ended_at, started_at, MINUTE) >= 1440;

--there are 170146 rows of trip with less than one minute and more than one day



--start/end station names/id: checking for naming inconsistencies and name/id missing(null values)

--start_station_name, start_station_id - total 833039 rows with both start station name and id missing

SELECT DISTINCT start_station_name
FROM `biketripdata2022.bike_tripdata_2022.combined_tripdata`
ORDER BY start_station_name;

SELECT COUNT(ride_id) AS rows_with_start_station_null
FROM `biketripdata2022.bike_tripdata_2022.combined_tripdata`
WHERE start_station_name IS NULL OR start_station_id IS NULL;

--end_station_name, end_station_id - total 892565 rows with both end station name and id missing

SELECT DISTINCT end_station_name
FROM `biketripdata2022.bike_tripdata_2022.combined_tripdata`
ORDER BY end_station_name;

SELECT COUNT(ride_id) AS rows_with_null_end_station
FROM `biketripdata2022.bike_tripdata_2022.combined_tripdata`
WHERE end_station_name IS NULL OR end_station_id IS NULL;

--end_lat, end_lng - total 5858 rows with both missing

SELECT COUNT(ride_id) AS rows_with_null_end_loc
FROM `biketripdata2022.bike_tripdata_2022.combined_tripdata`
WHERE end_lat IS NULL OR end_lng IS NULL;


--Confirm that there are only 2 member types in the member_casual column and check for null values

SELECT DISTINCT member_casual
FROM `biketripdata2022.bike_tripdata_2022.combined_tripdata`;

SELECT member_casual
FROM `biketripdata2022.bike_tripdata_2022.combined_tripdata`
WHERE member_casual IS NULL;
