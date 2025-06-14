resource "databricks_notebook" "spark_notebook" {
  path     = "/Users/admin/SparkDataProcessing"
  language = "PYTHON"
  content_base64 = base64encode(<<EOT
from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("MiniProject").getOrCreate()

data = [
    ("2025-01-01", "Product A", 120),
    ("2025-01-02", "Product B", 150),
    ("2025-01-03", "Product A", 90),
    ("2025-01-04", "Product C", 200),
    ("2025-01-05", "Product B", 130),
]

columns = ["date", "product", "sales"]
df = spark.createDataFrame(data, columns)
df.show()
EOT
  )
}
