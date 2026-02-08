from pyspark.ml.feature import VectorAssembler
from pyspark.ml.classification import LogisticRegression

df = spark.table("dev_flowers.gold.iris_onehot")

train = (
    df.drop("is_versicolor", "is_virginica").withColumnRenamed("is_setosa", "label")
)

feature_cols = ["sepal_length", "sepal_width", "petal_length", "petal_width"]

assembler = VectorAssembler(inputCols=feature_cols, outputCol="features")

train_vec = assembler.transform(train)

lr = LogisticRegression(featuresCol="features", labelCol="label")
model = lr.fit(train_vec)

pred = model.transform(train)

display(pred.select("label", "prediction", "probability").limit(10))
