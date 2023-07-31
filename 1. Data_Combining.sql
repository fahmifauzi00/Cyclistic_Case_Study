/* Data Combining */

DROP TABLE IF EXISTS `bike_tripdata_2022.combined_tripdata`;

/* Combining all the 12 months data tables into a single table containing data from Jan 2022 to Dec 2022 */

CREATE TABLE IF NOT EXISTS `bike_tripdata_2022.combined_tripdata` AS
SELECT *
FROM (
     SELECT * FROM `biketripdata2022.bike_tripdata_2022.jan_tripdata`
     UNION ALL 
     SELECT * FROM `biketripdata2022.bike_tripdata_2022.feb_tripdata`
     UNION ALL 
     SELECT * FROM `biketripdata2022.bike_tripdata_2022.mar_tripdata`
     UNION ALL 
     SELECT * FROM `biketripdata2022.bike_tripdata_2022.apr_tripdata`
     UNION ALL 
     SELECT * FROM `biketripdata2022.bike_tripdata_2022.may_tripdata`
     UNION ALL 
     SELECT * FROM `biketripdata2022.bike_tripdata_2022.june_tripdata`
     UNION ALL 
     SELECT * FROM `biketripdata2022.bike_tripdata_2022.july_tripdata`
     UNION ALL 
     SELECT * FROM `biketripdata2022.bike_tripdata_2022.aug_tripdata`
     UNION ALL 
     SELECT * FROM `biketripdata2022.bike_tripdata_2022.sept_tripdata`
     UNION ALL 
     SELECT * FROM `biketripdata2022.bike_tripdata_2022.oct_tripdata`
     UNION ALL 
     SELECT * FROM `biketripdata2022.bike_tripdata_2022.nov_tripdata`
     UNION ALL 
     SELECT * FROM `biketripdata2022.bike_tripdata_2022.dec_tripdata`
     );

/* Checking the no. of rows */

SELECT COUNT(*)
FROM bike_tripdata_2022.combined_tripdata

/* There are 5667245 rows */
