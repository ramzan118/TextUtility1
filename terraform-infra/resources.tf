resource "databricks_cluster" "databricks_cluster" {
  cluster_name            = "MiniProjectCluster"
  spark_version           = "13.3.x-scala2.12"
  node_type_id            = "Standard_DS3_v2"
  autotermination_minutes = 30
  num_workers             = 2
}
