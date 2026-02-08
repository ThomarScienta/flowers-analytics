CREATE OR REPLACE VIEW dev_flowers.gold.iris_onehot AS
SELECT
  sepal_length,
  sepal_width,
  petal_length,
  petal_width,

  CASE WHEN species = 'iris-setosa'     THEN 1 ELSE 0 END AS is_setosa,
  CASE WHEN species = 'iris-versicolor' THEN 1 ELSE 0 END AS is_versicolor,
  CASE WHEN species = 'iris-virginica'  THEN 1 ELSE 0 END AS is_virginica

FROM dev_flowers.silver.iris;
