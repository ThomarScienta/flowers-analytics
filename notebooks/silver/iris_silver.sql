CREATE OR REPLACE TABLE dev_flowers.silver.iris AS
SELECT
  CAST(sepal_length AS DOUBLE) AS sepal_length,
  CAST(sepal_width  AS DOUBLE) AS sepal_width,
  CAST(petal_length AS DOUBLE) AS petal_length,
  CAST(petal_width  AS DOUBLE) AS petal_width,
  LOWER(species)               AS species,
  current_timestamp()          AS processed_at
FROM dev_flowers.bronze.iris
WHERE sepal_length IS NOT NULL;
