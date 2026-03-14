CREATE DATABASE nyc_project;
USE nyc_project;

# Creating the nyc_trips table INSIDE this database

CREATE TABLE nyc_trips (
    trip_id BIGINT AUTO_INCREMENT PRIMARY KEY,

    tpep_pickup_datetime DATETIME,
    tpep_dropoff_datetime DATETIME,

    passenger_count TINYINT,
    trip_distance DECIMAL(10,2),

    PULocationID INT,
    DOLocationID INT,

    fare_amount DECIMAL(10,2),
    tip_amount DECIMAL(10,2),
    tolls_amount DECIMAL(10,2),
    total_amount DECIMAL(10,2),

    payment_type TINYINT,

    INDEX idx_pickup (tpep_pickup_datetime),
    INDEX idx_dropoff (tpep_dropoff_datetime),
    INDEX idx_pu_location (PULocationID),
    INDEX idx_do_location (DOLocationID)
);

SET GLOBAL local_infile = 1;

## Importing January CSV
SHOW VARIABLES LIKE 'local_infile';
DROP TABLE IF EXISTS nyc_trips;

CREATE TABLE nyc_trips (
    VendorID TINYINT,
    tpep_pickup_datetime DATETIME,
    tpep_dropoff_datetime DATETIME,
    passenger_count TINYINT,
    trip_distance DOUBLE,
    RatecodeID TINYINT,
    store_and_fwd_flag CHAR(1),
    PULocationID INT,
    DOLocationID INT,
    payment_type TINYINT,
    fare_amount DOUBLE,
    extra DOUBLE,
    mta_tax DOUBLE,
    tip_amount DOUBLE,
    tolls_amount DOUBLE,
    improvement_surcharge DOUBLE,
    total_amount DOUBLE,
    congestion_surcharge DOUBLE
);

# IMPORTING JAN DATA

LOAD DATA LOCAL INFILE 'C:/Users/Ashwin/Downloads/yellow_tripdata_2019-01.csv'
INTO TABLE nyc_trips
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(VendorID,
 tpep_pickup_datetime,
 tpep_dropoff_datetime,
 passenger_count,
 trip_distance,
 RatecodeID,
 store_and_fwd_flag,
 PULocationID,
 DOLocationID,
 payment_type,
 fare_amount,
 extra,
 mta_tax,
 tip_amount,
 tolls_amount,
 improvement_surcharge,
 total_amount,
 congestion_surcharge);
 
 select count(*)  FROM nyc_trips;
 
 SHOW WARNINGS LIMIT 10;
 
 SELECT 
    MIN(tpep_pickup_datetime) AS min_pickup,
    MAX(tpep_pickup_datetime) AS max_pickup,
    MIN(tpep_dropoff_datetime) AS min_dropoff,
    MAX(tpep_dropoff_datetime) AS max_dropoff
FROM nyc_trips
WHERE MONTH(tpep_pickup_datetime) = 1;

SELECT COUNT(*) FROM nyc_trips
WHERE 
    tpep_pickup_datetime < '2019-01-01'
    OR tpep_pickup_datetime >= '2019-02-01'
    OR tpep_dropoff_datetime < '2019-01-01'
    OR tpep_dropoff_datetime >= '2019-02-01';
    
    SELECT COUNT(*) 
FROM nyc_trips
WHERE YEAR(tpep_pickup_datetime) <> 2019;

DROP TABLE IF EXISTS nyc_trips;

CREATE TABLE nyc_trips (
    VendorID TINYINT,
    tpep_pickup_datetime DATETIME,
    tpep_dropoff_datetime DATETIME,
    passenger_count TINYINT,
    trip_distance DOUBLE,
    RatecodeID TINYINT,
    store_and_fwd_flag CHAR(1),
    PULocationID INT,
    DOLocationID INT,
    payment_type TINYINT,
    fare_amount DOUBLE,
    extra DOUBLE,
    mta_tax DOUBLE,
    tip_amount DOUBLE,
    tolls_amount DOUBLE,
    improvement_surcharge DOUBLE,
    total_amount DOUBLE,
    congestion_surcharge DOUBLE
);

LOAD DATA LOCAL INFILE 'C:/Users/Ashwin/Downloads/yellow_tripdata_2019-01.csv'
INTO TABLE nyc_trips
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(VendorID,
 tpep_pickup_datetime,
 tpep_dropoff_datetime,
 passenger_count,
 trip_distance,
 RatecodeID,
 store_and_fwd_flag,
 PULocationID,
 DOLocationID,
 payment_type,
 fare_amount,
 extra,
 mta_tax,
 tip_amount,
 tolls_amount,
 improvement_surcharge,
 total_amount,
 congestion_surcharge);
 
 select count(*)  FROM nyc_trips;
 
 SELECT 
    MIN(tpep_pickup_datetime),
    MAX(tpep_pickup_datetime),
    MIN(tpep_dropoff_datetime),
    MAX(tpep_dropoff_datetime)
FROM nyc_trips;


DROP TABLE nyc_trips;

CREATE TABLE nyc_trips (
    VendorID TINYINT,
    tpep_pickup_datetime DATETIME,
    tpep_dropoff_datetime DATETIME,
    passenger_count TINYINT,
    trip_distance DOUBLE,
    RatecodeID TINYINT,
    store_and_fwd_flag CHAR(1),
    PULocationID INT,
    DOLocationID INT,
    payment_type TINYINT,
    fare_amount DOUBLE,
    extra DOUBLE,
    mta_tax DOUBLE,
    tip_amount DOUBLE,
    tolls_amount DOUBLE,
    improvement_surcharge DOUBLE,
    total_amount DOUBLE,
    congestion_surcharge DOUBLE
);

LOAD DATA LOCAL INFILE 'C:/Users/Ashwin/Downloads/yellow_tripdata_2019-01.csv'
INTO TABLE nyc_trips
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(VendorID,
 tpep_pickup_datetime,
 tpep_dropoff_datetime,
 passenger_count,
 trip_distance,
 RatecodeID,
 store_and_fwd_flag,
 PULocationID,
 DOLocationID,
 payment_type,
 fare_amount,
 extra,
 mta_tax,
 tip_amount,
 tolls_amount,
 improvement_surcharge,
 total_amount,
 congestion_surcharge);
 
 ALTER TABLE nyc_trips 
MODIFY congestion_surcharge DOUBLE NULL;

# Check NULL congestion_surcharge count

SELECT COUNT(*) 
FROM nyc_trips
WHERE congestion_surcharge IS NULL;

SELECT 
    MIN(tpep_pickup_datetime) AS min_pickup,
    MAX(tpep_pickup_datetime) AS max_pickup,
    MIN(tpep_dropoff_datetime) AS min_dropoff,
    MAX(tpep_dropoff_datetime) AS max_dropoff
FROM nyc_trips;


TRUNCATE TABLE nyc_trips;

LOAD DATA LOCAL INFILE 'C:/Users/Ashwin/Downloads/yellow_tripdata_2019-01.csv'
INTO TABLE nyc_trips
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(VendorID,
 tpep_pickup_datetime,
 tpep_dropoff_datetime,
 passenger_count,
 trip_distance,
 RatecodeID,
 store_and_fwd_flag,
 PULocationID,
 DOLocationID,
 payment_type,
 fare_amount,
 extra,
 mta_tax,
 tip_amount,
 tolls_amount,
 improvement_surcharge,
 total_amount,
 congestion_surcharge);
 
 SELECT 
    MIN(tpep_pickup_datetime),
    MAX(tpep_pickup_datetime),
    MIN(tpep_dropoff_datetime),
    MAX(tpep_dropoff_datetime)
FROM nyc_trips;

TRUNCATE TABLE nyc_trips;

SELECT COUNT(*) FROM nyc_trips;

LOAD DATA LOCAL INFILE 'C:/Users/Ashwin/Downloads/yellow_tripdata_2019-01.csv'
INTO TABLE nyc_trips
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
 VendorID,
 tpep_pickup_datetime,
 tpep_dropoff_datetime,
 passenger_count,
 trip_distance,
 RatecodeID,
 store_and_fwd_flag,
 PULocationID,
 DOLocationID,
 payment_type,
 fare_amount,
 extra,
 mta_tax,
 tip_amount,
 tolls_amount,
 improvement_surcharge,
 total_amount,
 congestion_surcharge
);

SELECT 
    MIN(tpep_pickup_datetime),
    MAX(tpep_pickup_datetime),
    MIN(tpep_dropoff_datetime),
    MAX(tpep_dropoff_datetime)
FROM nyc_trips;

SELECT COUNT(*)
FROM nyc_trips
WHERE 
    tpep_pickup_datetime < '2019-01-01'
    OR tpep_pickup_datetime >= '2019-02-01'
    OR tpep_dropoff_datetime < '2019-01-01'
    OR tpep_dropoff_datetime >= '2019-02-02';
    
 ALTER TABLE nyc_trips 
MODIFY tpep_pickup_datetime DATETIME,
MODIFY tpep_dropoff_datetime DATETIME;

SELECT 
    MIN(tpep_pickup_datetime),
    MAX(tpep_pickup_datetime),
    MIN(tpep_dropoff_datetime),
    MAX(tpep_dropoff_datetime)
FROM nyc_trips
WHERE 
    tpep_pickup_datetime >= '2019-01-01' AND 
    tpep_pickup_datetime < '2019-02-01';

# ----------------------------

# Importing february data

LOAD DATA LOCAL INFILE 'C:/Users/Ashwin/Downloads/yellow_tripdata_2019-02.csv'
INTO TABLE nyc_trips
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
 VendorID,
 tpep_pickup_datetime,
 tpep_dropoff_datetime,
 passenger_count,
 trip_distance,
 RatecodeID,
 store_and_fwd_flag,
 PULocationID,
 DOLocationID,
 payment_type,
 fare_amount,
 extra,
 mta_tax,
 tip_amount,
 tolls_amount,
 improvement_surcharge,
 total_amount,
 congestion_surcharge
);

SELECT 
    MIN(tpep_pickup_datetime),
    MAX(tpep_pickup_datetime)
FROM nyc_trips
WHERE tpep_pickup_datetime BETWEEN '2019-02-01' AND '2019-02-28 23:59:59';

SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN tpep_pickup_datetime BETWEEN '2019-01-01' AND '2019-01-31 23:59:59' THEN 1 ELSE 0 END) AS jan_rows,
    SUM(CASE WHEN tpep_pickup_datetime BETWEEN '2019-02-01' AND '2019-02-28 23:59:59' THEN 1 ELSE 0 END) AS feb_rows,
    SUM(CASE WHEN tpep_pickup_datetime BETWEEN '2019-03-01' AND '2019-03-31 23:59:59' THEN 1 ELSE 0 END) AS mar_rows
FROM nyc_trips;

#-----------------------------

# IMPORTING MARCH DATA
LOAD DATA LOCAL INFILE 'C:/Users/Ashwin/Downloads/yellow_tripdata_2019-03.csv'
INTO TABLE nyc_trips
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
 VendorID,
 tpep_pickup_datetime,
 tpep_dropoff_datetime,
 passenger_count,
 trip_distance,
 RatecodeID,
 store_and_fwd_flag,
 PULocationID,
 DOLocationID,
 payment_type,
 fare_amount,
 extra,
 mta_tax,
 tip_amount,
 tolls_amount,
 improvement_surcharge,
 total_amount,
 congestion_surcharge
);

SELECT 
    MIN(tpep_pickup_datetime),
    MAX(tpep_pickup_datetime)
FROM nyc_trips
WHERE tpep_pickup_datetime BETWEEN '2019-03-01' AND '2019-03-31 23:59:59';

SELECT COUNT(*) FROM nyc_trips;

# Final global timestamp (full Q1 2019)
SELECT
    MIN(tpep_pickup_datetime),
    MAX(tpep_pickup_datetime)
FROM nyc_trips;

# --------------------
## Engineering important metrics
# ADD FEATURE COLUMNS

ALTER TABLE nyc_trips
ADD COLUMN trip_duration_minutes DOUBLE
    AS (TIMESTAMPDIFF(SECOND, tpep_pickup_datetime, tpep_dropoff_datetime) / 60),
ADD COLUMN trip_speed_mph DOUBLE
    AS (trip_distance / (TIMESTAMPDIFF(SECOND, tpep_pickup_datetime, tpep_dropoff_datetime) / 3600)),
ADD COLUMN tip_percentage DOUBLE
    AS (CASE WHEN fare_amount > 0 THEN (tip_amount / fare_amount) * 100 ELSE NULL END);
    
# Run summary metrics

SELECT 
    COUNT(*) AS total_trips,
    ROUND(AVG(trip_distance), 2) AS avg_distance,
    ROUND(AVG(trip_duration_minutes), 2) AS avg_duration_min,
    ROUND(AVG(trip_speed_mph), 2) AS avg_speed_mph,
    ROUND(AVG(fare_amount), 2) AS avg_fare,
    ROUND(AVG(tip_percentage), 2) AS avg_tip_percentage
FROM nyc_trips;

# PASSENGER COUNT DISTRIBUTION
SELECT 
    passenger_count,
    COUNT(*) AS total_trips
FROM nyc_trips
GROUP BY passenger_count
ORDER BY passenger_count;

# payment types

SELECT 
    payment_type,
    COUNT(*) AS total_trips
FROM nyc_trips
GROUP BY payment_type
ORDER BY total_trips DESC;

SELECT 
    HOUR(tpep_pickup_datetime) AS hour,
    COUNT(*) AS total_trips
FROM nyc_trips
GROUP BY hour
ORDER BY hour;

# Hourly Traffic Pattern by Day-of-Week heatmap
SELECT 
    DAYOFWEEK(tpep_pickup_datetime) AS day_of_week,
    HOUR(tpep_pickup_datetime) AS hour,
    COUNT(*) AS total_trips
FROM nyc_trips
GROUP BY day_of_week, hour
ORDER BY day_of_week, hour;

SELECT 
    DAYOFWEEK(tpep_pickup_datetime) AS day_of_week,
    COUNT(*) AS total_trips
FROM nyc_trips
GROUP BY day_of_week
ORDER BY day_of_week;

select count(*) from nyc_trips;

SELECT 
    COUNT(*) AS total_rows,
    COUNT(trip_duration_minutes) AS duration_filled,
    COUNT(trip_speed_mph) AS speed_filled,
    COUNT(tip_percentage) AS tip_filled
FROM nyc_trips;

------------------------

# Data exploration

SELECT 
    COUNT(*) AS total_trips,
    ROUND(AVG(trip_distance), 2) AS avg_distance,
    ROUND(AVG(trip_duration_minutes), 2) AS avg_duration_min,
    ROUND(AVG(trip_speed_mph), 2) AS avg_speed_mph,
    ROUND(AVG(fare_amount), 2) AS avg_fare,
    ROUND(AVG(tip_percentage), 2) AS avg_tip_percentage
FROM nyc_trips;

# total_trips = 22,612,068
# avg_distance = 2.92 miles
# avg_duration = 17.17 minutes
# avg_speed_mph = 13.06 mph
# avg_fare = $12.91
# avg_tip_percentage = 19.29%

## PASSENGER COUNT DISTRIBUTION
SELECT 
    passenger_count,
    COUNT(*) AS total_trips
FROM nyc_trips
GROUP BY passenger_count
ORDER BY passenger_count;

# Single-passenger trips dominate (70.34% of all trips)
# Two-passenger trips are the second most common (14.7%)
# 3–6 passengers appear normally

## PAYMENT TYPE DISTRIBUTION
SELECT 
    payment_type,
    COUNT(*) AS total_trips
FROM nyc_trips
GROUP BY payment_type
ORDER BY total_trips DESC;

# Credit Card dominates (72.4% of all trips)
# Cash payments are 26.4%
# “No Charge” = 107,263 (0.47%)

## HOURLY DEMAND
SELECT 
    HOUR(tpep_pickup_datetime) AS hour,
    COUNT(*) AS total_trips
FROM nyc_trips
GROUP BY hour
ORDER BY hour;

# Peak Hour = 6 PM (18:00) with 1.50 million trips
# Strong Evening Window (5 PM – 9 PM)
# Morning Commute Surge Starts at 6 AM
# Midday (10 AM → 4 PM) is very stable

## DAY-OF-WEEK × HOUR HEATMAP

SELECT 
    DAYOFWEEK(tpep_pickup_datetime) AS day_of_week,
    HOUR(tpep_pickup_datetime) AS hour,
    COUNT(*) AS total_trips
FROM nyc_trips
GROUP BY day_of_week, hour
ORDER BY day_of_week, hour;

# Morning Commute: Tue–Wed–Thu strongest
# Evening Peak: Friday highest
# Midday: extremely stable
# Weekend: late-night traffic biggest
# Monday: weakest day
# Saturday: strongest leisure pattern

## MONTHLY ANALYSIS

SELECT 
    MONTH(tpep_pickup_datetime) AS month,
    COUNT(*) AS total_trips
FROM nyc_trips
GROUP BY month
ORDER BY month;

## Remove all rows outside Jan–Feb–Mar window

ALTER TABLE nyc_trips
DROP COLUMN trip_speed_mph;

DELETE FROM nyc_trips
WHERE tpep_pickup_datetime < '2019-01-01'
   OR tpep_pickup_datetime >= '2019-04-01';
   
ALTER TABLE nyc_trips
ADD COLUMN trip_speed_mph DOUBLE
    AS (CASE 
           WHEN TIMESTAMPDIFF(SECOND, tpep_pickup_datetime, tpep_dropoff_datetime) > 0
           THEN trip_distance / (TIMESTAMPDIFF(SECOND, tpep_pickup_datetime, tpep_dropoff_datetime) / 3600)
           ELSE NULL
        END);
        
## VERIFY CLEAN MONTHS

SELECT 
    MONTH(tpep_pickup_datetime) AS month,
    COUNT(*) AS total_trips
FROM nyc_trips
GROUP BY month
ORDER BY month;

ALTER TABLE nyc_trips
ADD COLUMN trip_speed_mph DOUBLE
    AS (
        CASE 
            WHEN TIMESTAMPDIFF(SECOND, tpep_pickup_datetime, tpep_dropoff_datetime) > 0
            THEN trip_distance / (TIMESTAMPDIFF(SECOND, tpep_pickup_datetime, tpep_dropoff_datetime) / 3600)
            ELSE NULL
        END
    );
    
    SHOW COLUMNS FROM nyc_trips LIKE 'trip_speed_mph';
    
    
## DURATION BUCKET
SELECT
    CASE 
        WHEN trip_duration_minutes < 5 THEN '<5 min'
        WHEN trip_duration_minutes BETWEEN 5 AND 10 THEN '5–10 min'
        WHEN trip_duration_minutes BETWEEN 10 AND 20 THEN '10–20 min'
        WHEN trip_duration_minutes BETWEEN 20 AND 40 THEN '20–40 min'
        WHEN trip_duration_minutes BETWEEN 40 AND 60 THEN '40–60 min'
        ELSE '>60 min'
    END AS duration_bucket,
    COUNT(*) AS trips
FROM nyc_trips
GROUP BY duration_bucket
ORDER BY trips DESC; 

# Majority of NYC taxi rides are short-haul
# Only ~3% rides exceed 40 minutes
# Extremely long trips (>60 min) are very rare (0.8%)

## Average Duration by Hour of Day

SELECT 
    HOUR(tpep_pickup_datetime) AS hour,
    ROUND(AVG(trip_duration_minutes), 2) AS avg_duration_min
FROM nyc_trips
GROUP BY hour
ORDER BY hour;

# Morning Traffic Starts at 7 AM
# Lunch Hours Are Fairly Stable (11 AM–1 PM)
# PEAK Traffic = 2 PM to 5 PM
# Evening (6 PM–10 PM) Becomes Faster
# Late Night/Early Morning is the Fastest (12 AM–5 AM)

## Extreme Duration Outliers

#LONGEST
SELECT 
    tpep_pickup_datetime,
    tpep_dropoff_datetime,
    trip_duration_minutes,
    trip_distance,
    total_amount
FROM nyc_trips
ORDER BY trip_duration_minutes DESC
LIMIT 20000; -- top 0.1% of 22.6M;

#SHORTEST
SELECT 
    tpep_pickup_datetime,
    tpep_dropoff_datetime,
    trip_duration_minutes,
    trip_distance,
    total_amount
FROM nyc_trips
WHERE trip_duration_minutes > 0
ORDER BY trip_duration_minutes ASC
LIMIT 20000;


# Let’s remove rows where: Duration too long 
DELETE FROM nyc_trips
WHERE trip_duration_minutes > 300;

# Removing impossible short rides
DELETE FROM nyc_trips
WHERE trip_duration_minutes < 1;

# After cleaning validation

SELECT 
    MIN(trip_duration_minutes),
    MAX(trip_duration_minutes)
FROM nyc_trips;


SELECT COUNT(*)
FROM nyc_trips;

# SPEED ANOMALIES

# speed distribution
SELECT 
    MIN(trip_speed_mph),
    MAX(trip_speed_mph),
    ROUND(AVG(trip_speed_mph), 2) AS avg_speed
FROM nyc_trips
WHERE trip_speed_mph IS NOT NULL;

# top 20 FASTEST trips
SELECT 
    tpep_pickup_datetime,
    tpep_dropoff_datetime,
    trip_distance,
    trip_duration_minutes,
    trip_speed_mph
FROM nyc_trips
ORDER BY trip_speed_mph DESC
LIMIT 20;

# Check top 20 SLOWEST trips
SELECT 
    tpep_pickup_datetime,
    tpep_dropoff_datetime,
    trip_distance,
    trip_duration_minutes,
    trip_speed_mph
FROM nyc_trips
WHERE trip_speed_mph > 0
ORDER BY trip_speed_mph ASC
LIMIT 20;

# Delete ultra-slow (<1 mph)

DELETE FROM nyc_trips
WHERE trip_speed_mph < 1;

# Delete ultra-fast (>100 mph)

DELETE FROM nyc_trips
WHERE trip_speed_mph > 100;

SELECT 
    MIN(trip_speed_mph),
    MAX(trip_speed_mph),
    ROUND(AVG(trip_speed_mph), 2)
FROM nyc_trips
WHERE trip_speed_mph IS NOT NULL;

SELECT COUNT(*) FROM nyc_trips;

## REVENUE & FINANCIAL INTELLIGENCE
# TOTAL REVENUE BY MONTH
SELECT
    MONTH(tpep_pickup_datetime) AS month,
    ROUND(SUM(total_amount), 2) AS total_revenue,
    ROUND(AVG(total_amount), 2) AS avg_revenue_per_trip,
    COUNT(*) AS total_trips
FROM nyc_trips
GROUP BY month
ORDER BY month;

# REVENUE BY HOUR OF DAY
SELECT
    HOUR(tpep_pickup_datetime) AS hour,
    ROUND(SUM(total_amount), 2) AS total_revenue,
    COUNT(*) AS total_trips,
    ROUND(AVG(total_amount), 2) AS avg_trip_revenue
FROM nyc_trips
GROUP BY hour
ORDER BY hour;

# REVENUE INTELLIGENCE
# Revenue by Day of Week

SELECT
    DAYOFWEEK(tpep_pickup_datetime) AS day_of_week,
    ROUND(SUM(total_amount), 2) AS total_revenue,
    COUNT(*) AS total_trips,
    ROUND(AVG(total_amount), 2) AS avg_revenue
FROM nyc_trips
GROUP BY day_of_week
ORDER BY day_of_week;

# Revenue by Passenger Count
SELECT
    passenger_count,
    ROUND(SUM(total_amount), 2) AS total_revenue,
    COUNT(*) AS total_trips,
    ROUND(AVG(total_amount), 2) AS avg_revenue
FROM nyc_trips
GROUP BY passenger_count
ORDER BY passenger_count;

# Vendor Revenue Comparison
SELECT 
    VendorID,
    ROUND(SUM(total_amount), 2) AS total_revenue,
    COUNT(*) AS total_trips,
    ROUND(AVG(total_amount), 2) AS avg_trip_revenue
FROM nyc_trips
GROUP BY VendorID;

## LOCATION ANALYSIS

CREATE TABLE taxi_zones (
    LocationID INT PRIMARY KEY,
    Borough VARCHAR(50),
    Zone VARCHAR(100),
    service_zone VARCHAR(50)
);

TRUNCATE TABLE taxi_zones;

LOAD DATA LOCAL INFILE 'C:\\Users\\Ashwin\\Downloads\\taxi_zone_lookup.csv'
INTO TABLE taxi_zones
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationID, Borough, Zone, service_zone);
TRUNCATE TABLE taxi_zones;

TRUNCATE TABLE taxi_zones;

LOAD DATA LOCAL INFILE 'C:\\Users\\Ashwin\\Downloads\\taxi_zone_lookup.csv'
INTO TABLE taxi_zones
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationID, Borough, Zone, service_zone);

SELECT *
FROM taxi_zones
LIMIT 10;

## Top 20 Pick-Up Zones
SELECT 
    tz.Zone,
    COUNT(*) AS total_trips
FROM nyc_trips t
JOIN taxi_zones tz
    ON t.PULocationID = tz.LocationID
GROUP BY tz.Zone
ORDER BY total_trips DESC
LIMIT 20;

# Top 20 Drop-Off Zones
SELECT 
    tz.Zone,
    COUNT(*) AS total_trips
FROM nyc_trips t
JOIN taxi_zones tz
    ON t.DOLocationID = tz.LocationID
GROUP BY tz.Zone
ORDER BY total_trips DESC
LIMIT 20;

# Borough-Level Trip Distribution

SELECT 
    tz.Borough,
    COUNT(*) AS total_trips
FROM nyc_trips t
JOIN taxi_zones tz
    ON t.PULocationID = tz.LocationID
GROUP BY tz.Borough
ORDER BY total_trips DESC;

# OD Matrix (Pickup → Dropoff)

SELECT 
    pu.Zone AS pickup_zone,
    do.Zone AS dropoff_zone,
    COUNT(*) AS trips
FROM nyc_trips t
JOIN taxi_zones pu ON t.PULocationID = pu.LocationID
JOIN taxi_zones do ON t.DOLocationID = do.LocationID
GROUP BY pu.Zone, do.Zone
ORDER BY trips DESC
LIMIT 50;

LOAD DATA LOCAL INFILE 'C:\\Users\\Ashwin\\Downloads\\taxi_zone_lookup_clean.csv'
INTO TABLE taxi_zones
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationID, Borough, Zone, service_zone);

SELECT COUNT(*) FROM taxi_zones;

SELECT * FROM taxi_zones LIMIT 10;

## NYC Taxi Location Insights — Jan–Mar 2019
# TOP PICKUP ZONES (COUNT OF TRIPS)
SELECT 
    tz.Zone AS pickup_zone,
    COUNT(*) AS total_pickups
FROM nyc_trips t
JOIN taxi_zones tz
    ON t.PULocationID = tz.LocationID
GROUP BY tz.Zone
ORDER BY total_pickups DESC
LIMIT 20;

# TOP DROPOFF ZONES (COUNT OF TRIPS)
SELECT 
    tz.Zone AS dropoff_zone,
    COUNT(*) AS total_dropoffs
FROM nyc_trips t
JOIN taxi_zones tz
    ON t.DOLocationID = tz.LocationID
GROUP BY tz.Zone
ORDER BY total_dropoffs DESC
LIMIT 20;

# Pickup → Drop-off OD Matrix (Top Flows)

SELECT 
    p.Zone AS pickup_zone,
    d.Zone AS dropoff_zone,
    COUNT(*) AS trips
FROM nyc_trips t
JOIN taxi_zones p ON t.PULocationID = p.LocationID
JOIN taxi_zones d ON t.DOLocationID = d.LocationID
GROUP BY pickup_zone, dropoff_zone
ORDER BY trips DESC
LIMIT 50;

# Pickup & Drop-off by Borough
# Borough-wise Pickups

SELECT 
    p.Borough AS pickup_borough,
    COUNT(*) AS total_pickups
FROM nyc_trips t
JOIN taxi_zones p ON t.PULocationID = p.LocationID
GROUP BY pickup_borough
ORDER BY total_pickups DESC;

# Borough-wise Drop-offs
SELECT 
    d.Borough AS dropoff_borough,
    COUNT(*) AS total_dropoffs
FROM nyc_trips t
JOIN taxi_zones d ON t.DOLocationID = d.LocationID
GROUP BY dropoff_borough
ORDER BY total_dropoffs DESC;

## Tip Percentage Distribution

SELECT 
    COUNT(*) AS total_trips,
    SUM(CASE WHEN tip_amount > 0 THEN 1 ELSE 0 END) AS trips_with_tip,
    SUM(CASE WHEN tip_amount = 0 THEN 1 ELSE 0 END) AS trips_without_tip,
    ROUND(AVG(tip_percentage), 2) AS avg_tip_percentage
FROM nyc_trips;

# Tip % by Hour of Day
SELECT
    HOUR(tpep_pickup_datetime) AS hour,
    ROUND(AVG(tip_percentage), 2) AS avg_tip_percentage,
    COUNT(*) AS total_trips
FROM nyc_trips
WHERE tip_percentage IS NOT NULL
GROUP BY hour
ORDER BY hour;

# Tip % by Passenger Count
SELECT 
    passenger_count,
    ROUND(AVG(tip_percentage), 2) AS avg_tip_percentage,
    COUNT(*) AS total_trips
FROM nyc_trips
WHERE tip_percentage IS NOT NULL
GROUP BY passenger_count
ORDER BY passenger_count;

# Tippers vs Non-tippers
SELECT
    CASE WHEN tip_amount > 0 THEN 'Tip Paid' ELSE 'No Tip' END AS tip_status,
    COUNT(*) AS total_trips,
    ROUND(100 * COUNT(*) / (SELECT COUNT(*) FROM nyc_trips), 2) AS percentage
FROM nyc_trips
GROUP BY tip_status;

# Tip % by Payment Type
SELECT
    payment_type,
    ROUND(AVG(tip_percentage), 2) AS avg_tip_percentage,
    COUNT(*) AS trips
FROM nyc_trips
WHERE tip_percentage IS NOT NULL
GROUP BY payment_type
ORDER BY avg_tip_percentage DESC;

## REVENUE & FARE STRUCTURE ANALYSIS

# TOTAL REVENUE, AVERAGE REVENUE, AND FARE STRUCTURE

SHOW TABLES;

SELECT  
    SUM(fare_amount) AS total_fare_amount,
    SUM(extra) AS total_extra,
    SUM(mta_tax) AS total_mta_tax,
    SUM(tip_amount) AS total_tip_amount,
    SUM(tolls_amount) AS total_tolls,
    SUM(improvement_surcharge) AS total_improvement_surcharge,
    SUM(total_amount) AS total_revenue
FROM nyc_trips;

# Revenue by Borough
SELECT 
    z.Borough,
    SUM(t.total_amount) AS total_revenue,
    COUNT(*) AS total_trips,
    ROUND(SUM(t.total_amount) / COUNT(*), 2) AS avg_revenue_per_trip
FROM nyc_trips t
JOIN taxi_zones z
    ON t.PULocationID = z.LocationID
GROUP BY z.Borough
ORDER BY total_revenue DESC;

# Revenue by Zone
SELECT 
    z.Zone AS pickup_zone,
    SUM(t.total_amount) AS total_revenue,
    COUNT(*) AS total_trips,
    ROUND(SUM(t.total_amount) / COUNT(*), 2) AS avg_revenue_per_trip
FROM nyc_trips t
JOIN taxi_zones z
    ON t.PULocationID = z.LocationID
GROUP BY z.Zone
ORDER BY total_revenue DESC
LIMIT 20;

# Hourly Revenue Patterns
SELECT 
    HOUR(t.tpep_pickup_datetime) AS hour,
    SUM(t.total_amount) AS total_revenue,
    COUNT(*) AS total_trips,
    ROUND(SUM(t.total_amount) / COUNT(*), 2) AS avg_revenue_per_trip
FROM nyc_trips t
GROUP BY hour
ORDER BY hour;

# High-Value Passenger Segments
SELECT 
    passenger_count,
    SUM(total_amount) AS revenue,
    COUNT(*) AS trips,
    ROUND(SUM(total_amount) / COUNT(*), 2) AS avg_revenue_per_trip
FROM nyc_trips
GROUP BY passenger_count
ORDER BY revenue DESC;

## Time Series Revenue + Trips Trends

# Daily Trips Trend
SELECT 
    DATE(tpep_pickup_datetime) AS trip_date,
    COUNT(*) AS total_trips
FROM nyc_trips
GROUP BY trip_date
ORDER BY trip_date;

# Daily Revenue Trend
SELECT 
    DATE(tpep_pickup_datetime) AS trip_date,
    SUM(total_amount) AS total_revenue
FROM nyc_trips
GROUP BY trip_date
ORDER BY trip_date;

# Weekly Trends
SELECT 
    WEEK(tpep_pickup_datetime) AS week_number,
    COUNT(*) AS total_trips,
    SUM(total_amount) AS total_revenue
FROM nyc_trips
GROUP BY week_number
ORDER BY week_number;

# Month-over-Month Revenue Growth
SELECT 
    MONTH(tpep_pickup_datetime) AS month,
    SUM(total_amount) AS total_revenue
FROM nyc_trips
GROUP BY month
ORDER BY month;

## Operational performance KPI

# Revenue per Mile
SELECT 
    SUM(total_amount) / SUM(trip_distance) AS revenue_per_mile,
    SUM(total_amount) AS total_revenue,
    SUM(trip_distance) AS total_miles
FROM nyc_trips
WHERE trip_distance > 0;

# Revenue per Minute
SELECT 
    SUM(total_amount) / SUM(trip_duration_minutes) AS revenue_per_minute,
    SUM(total_amount) AS total_revenue,
    SUM(trip_duration_minutes) AS total_minutes
FROM nyc_trips
WHERE trip_duration_minutes > 0;

# High-Value Pickup Zones (Top Revenue Zones)
SELECT 
    z.Zone AS pickup_zone,
    SUM(t.total_amount) AS total_revenue,
    COUNT(*) AS total_trips,
    ROUND(SUM(t.total_amount) / COUNT(*),2) AS avg_revenue_per_trip
FROM nyc_trips t
JOIN taxi_zones z 
    ON t.PULocationID = z.LocationID
GROUP BY z.Zone
ORDER BY total_revenue DESC
LIMIT 20;

# Hourly Revenue Intensity
SELECT 
    HOUR(tpep_pickup_datetime) AS hour,
    SUM(total_amount) AS total_revenue,
    COUNT(*) AS total_trips,
    ROUND(AVG(total_amount), 2) AS avg_revenue_per_trip
FROM nyc_trips
GROUP BY hour
ORDER BY total_revenue DESC;

# High-Value Passenger Segments
SELECT 
    passenger_count,
    SUM(total_amount) AS total_revenue,
    COUNT(*) AS trips,
    ROUND(SUM(total_amount)/COUNT(*), 2) AS avg_revenue_per_trip
FROM nyc_trips
GROUP BY passenger_count
ORDER BY total_revenue DESC;

# Profitability Ratios
SELECT
    SUM(fare_amount) / SUM(total_amount) * 100 AS fare_ratio,
    SUM(tip_amount) / SUM(total_amount) * 100 AS tip_ratio,
    SUM(tolls_amount) / SUM(total_amount) * 100 AS tolls_ratio,
    SUM(mta_tax) / SUM(total_amount) * 100 AS mta_tax_ratio,
    SUM(extra) / SUM(total_amount) * 100 AS extra_ratio,
    SUM(improvement_surcharge) / SUM(total_amount) * 100 AS improvement_surcharge_ratio
FROM nyc_trips;


# CONFIRMING CLEANED COLUMNS

SELECT 
    VendorID,
    tpep_pickup_datetime,
    tpep_dropoff_datetime,
    passenger_count,
    trip_distance,
    trip_duration_minutes,
    trip_speed_mph,
    PULocationID,
    DOLocationID,
    payment_type,
    fare_amount,
    extra,
    mta_tax,
    tip_amount,
    tolls_amount,
    improvement_surcharge,
    congestion_surcharge,
    total_amount
FROM nyc_trips
LIMIT 100;


# EXPORTING TABLES
SELECT *
FROM nyc_trips;

SELECT *
INTO OUTFILE 'C:/nyc_export/nyc_trips_clean.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM nyc_trips;

SHOW VARIABLES LIKE 'secure_file_priv';

SELECT *
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/nyc_trips_clean.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM nyc_trips;

SELECT *
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/taxi_zones.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM taxi_zones;