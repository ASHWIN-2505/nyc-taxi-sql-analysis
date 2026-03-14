SHOW PROCESSLIST;

# EXPORT FILES FOR POWER BI

# DAILY TRIPS (For Line Chart & KPI)
SELECT 
    DATE(tpep_pickup_datetime) AS trip_date,
    COUNT(*) AS total_trips
FROM nyc_trips
GROUP BY trip_date
ORDER BY trip_date;

# DATASET 2 — Daily Revenue
SELECT
    DATE(tpep_pickup_datetime) AS trip_date,
    SUM(total_amount) AS total_revenue
FROM nyc_trips
GROUP BY DATE(tpep_pickup_datetime)
ORDER BY trip_date;

# DATASET 3 — Hourly Trips
SELECT
    HOUR(tpep_pickup_datetime) AS hour,
    COUNT(*) AS total_trips
FROM nyc_trips
GROUP BY hour
ORDER BY hour;

# DATASET 4 — Hourly Revenue
SELECT
    HOUR(tpep_pickup_datetime) AS hour,
    SUM(total_amount) AS total_revenue
FROM nyc_trips
GROUP BY hour
ORDER BY hour;

# DATASET 5 — Borough-Level Trips & Revenue
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

# DATASET 6 — Pickup Zone Summary
SELECT
    z.Zone AS pickup_zone,
    SUM(t.total_amount) AS total_revenue,
    COUNT(*) AS total_trips,
    ROUND(SUM(t.total_amount) / COUNT(*), 2) AS avg_revenue_per_trip
FROM nyc_trips t
JOIN taxi_zones z
    ON t.PULocationID = z.LocationID
GROUP BY z.Zone
ORDER BY total_revenue DESC;

# DATASET 7 — Dropoff Zone Summary
SELECT
    z.Zone AS dropoff_zone,
    SUM(t.total_amount) AS total_revenue,
    COUNT(*) AS total_trips,
    ROUND(SUM(t.total_amount) / COUNT(*), 2) AS avg_revenue_per_trip
FROM nyc_trips t
JOIN taxi_zones z
    ON t.DOLocationID = z.LocationID
GROUP BY z.Zone
ORDER BY total_revenue DESC; 

# DATASET 8 - Export WEEKLY TRIPS
SELECT 
    WEEK(tpep_pickup_datetime) AS week_number,
    COUNT(*) AS total_trips
FROM nyc_trips
GROUP BY week_number
ORDER BY week_number;

# Export WEEKLY REVENUE
SELECT 
    WEEK(tpep_pickup_datetime) AS week_number,
    SUM(total_amount) AS total_revenue
FROM nyc_trips
GROUP BY week_number
ORDER BY week_number;

# Revenue per Mile
SELECT 
    SUM(total_amount) / SUM(trip_distance) AS revenue_per_mile,
    SUM(total_amount) AS total_revenue,
    SUM(trip_distance) AS total_miles
FROM nyc_trips;

# Revenue per Minute
SELECT 
    SUM(total_amount) / SUM(trip_duration_minutes) AS revenue_per_minute,
    SUM(total_amount) AS total_revenue,
    SUM(trip_duration_minutes) AS total_minutes
FROM nyc_trips;

# pickup zone revenue summary
SELECT 
    tz.Zone AS pickup_zone,
    SUM(t.total_amount) AS total_revenue,
    COUNT(*) AS total_trips,
    ROUND(SUM(t.total_amount) / COUNT(*), 2) AS avg_revenue_per_trip
FROM nyc_trips t
JOIN taxi_zones tz
    ON t.PULocationID = tz.LocationID
GROUP BY tz.Zone
ORDER BY total_revenue DESC;

# Regenerate Dropoff Zone Revenue Summary
SELECT 
    tz.Zone AS dropoff_zone,
    SUM(t.total_amount) AS total_revenue,
    COUNT(*) AS total_trips,
    ROUND(SUM(t.total_amount) / COUNT(*), 2) AS avg_revenue_per_trip
FROM nyc_trips t
JOIN taxi_zones tz
    ON t.DOLocationID = tz.LocationID
GROUP BY tz.Zone
ORDER BY total_revenue DESC;

# Regenerate Hourly Revenue Summary
SELECT 
    HOUR(tpep_pickup_datetime) AS hour,
    SUM(total_amount) AS total_revenue,
    COUNT(*) AS total_trips,
    ROUND(SUM(total_amount) / COUNT(*), 2) AS avg_revenue_per_trip
FROM nyc_trips
GROUP BY hour
ORDER BY hour;

# Pickup Zone Summary
SELECT  
    tz.LocationID,
    tz.Zone AS pickup_zone,
    tz.Borough,
    SUM(n.total_amount) AS total_revenue,
    COUNT(*) AS total_trips,
    AVG(n.total_amount) AS avg_revenue_per_trip
FROM nyc_trips n
JOIN taxi_zones tz 
    ON n.PULocationID = tz.LocationID
GROUP BY tz.LocationID, tz.Zone, tz.Borough
ORDER BY total_revenue DESC;

# Run the Correct SQL for Dropoff Zone Summary
SELECT  
    tz.LocationID,
    tz.Zone AS dropoff_zone,
    tz.Borough,
    SUM(n.total_amount) AS total_revenue,
    COUNT(*) AS total_trips,
    AVG(n.total_amount) AS avg_revenue_per_trip
FROM nyc_trips n
JOIN taxi_zones tz 
    ON n.DOLocationID = tz.LocationID
GROUP BY tz.LocationID, tz.Zone, tz.Borough
ORDER BY total_revenue DESC;

# Run Revenue per Zone
SELECT
    tz.LocationID,
    tz.Zone,
    tz.Borough,
    SUM(n.total_amount) AS total_revenue,
    COUNT(*) AS total_trips
FROM nyc_trips n
JOIN taxi_zones tz
    ON n.PULocationID = tz.LocationID
GROUP BY tz.LocationID, tz.Zone, tz.Borough
ORDER BY total_revenue DESC;

# Revenue per Dropoff Zone
SELECT
    tz.LocationID,
    tz.Zone,
    tz.Borough,
    SUM(n.total_amount) AS total_revenue,
    COUNT(*) AS total_trips
FROM nyc_trips n
JOIN taxi_zones tz
    ON n.DOLocationID = tz.LocationID
GROUP BY tz.LocationID, tz.Zone, tz.Borough
ORDER BY total_revenue DESC;

# HOURLY REVENUE
SELECT 
    DATE(tpep_pickup_datetime) AS trip_date,
    HOUR(tpep_pickup_datetime) AS hour,
    SUM(total_amount) AS total_revenue
FROM nyc_trips
GROUP BY DATE(tpep_pickup_datetime), HOUR(tpep_pickup_datetime)
ORDER BY trip_date, hour;

# HOURLY TRIPS
SELECT 
    DATE(tpep_pickup_datetime) AS trip_date,
    HOUR(tpep_pickup_datetime) AS hour,
    COUNT(*) AS total_trips
FROM nyc_trips
GROUP BY DATE(tpep_pickup_datetime), HOUR(tpep_pickup_datetime)
ORDER BY trip_date, hour;