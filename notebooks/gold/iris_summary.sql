CREATE OR REPLACE VIEW dev_flowers.gold.iris_summary AS
SELECT
  species,
  COUNT(*)                      AS n_rows,
  AVG(sepal_length)             AS avg_sepal_length,
  AVG(sepal_width)              AS avg_sepal_width,
  AVG(petal_length)             AS avg_petal_length,
  AVG(petal_width)              AS avg_petal_width,
  MIN(sepal_length)             AS min_sepal_length,
  MAX(sepal_length)             AS max_sepal_length
FROM dev_flowers.silver.iris
GROUP BY species;
