from pyspark.sql import DataFrame
from pyspark.sql import functions as F

def to_iris_silver(df_bronze: DataFrame) -> DataFrame:
    """
    Convert bronze iris df -> cleaned silver df
    Expected bronze cols: sepal_length, sepal_width, petal_length, petal_width, species
    """
    df = (
        df_bronze
        .dropna(subset=["sepal_length", "sepal_width", "petal_length", "petal_width", "species"])
        .withColumn("sepal_length", F.col("sepal_length").cast("double"))
        .withColumn("sepal_width",  F.col("sepal_width").cast("double"))
        .withColumn("petal_length", F.col("petal_length").cast("double"))
        .withColumn("petal_width",  F.col("petal_width").cast("double"))
        .withColumn("species", F.lower(F.trim(F.col("species"))))
        .withColumn("processed_at", F.current_timestamp())
    )

    return df
