# Dataset de BigQuery
resource "google_bigquery_dataset" "ventas_dataset" {
  dataset_id    = "ventas_dataset"
  friendly_name = "Dataset de Ventas"
  description   = "Dataset creado con Terraform para gestionar ventas"
  location      = "US"

  labels = {
    ambiente = "desarrollo"
    equipo   = "analytics"
  }
}

# Tabla de BigQuery
resource "google_bigquery_table" "transacciones" {
  dataset_id = google_bigquery_dataset.ventas_dataset.dataset_id
  table_id   = "transacciones"
  
  deletion_protection = false

  schema = jsonencode([
    {
      name        = "id_transaccion"
      type        = "INTEGER"
      mode        = "REQUIRED"
      description = "ID único de la transacción"
    },
    {
      name        = "fecha"
      type        = "DATE"
      mode        = "REQUIRED"
      description = "Fecha de la transacción"
    },
    {
      name        = "cliente"
      type        = "STRING"
      mode        = "REQUIRED"
      description = "Nombre del cliente"
    },
    {
      name        = "producto"
      type        = "STRING"
      mode        = "NULLABLE"
      description = "Nombre del producto vendido"
    },
    {
      name        = "cantidad"
      type        = "INTEGER"
      mode        = "NULLABLE"
      description = "Cantidad de productos"
    },
    {
      name        = "precio_unitario"
      type        = "FLOAT"
      mode        = "NULLABLE"
      description = "Precio por unidad"
    },
    {
      name        = "total"
      type        = "FLOAT"
      mode        = "REQUIRED"
      description = "Monto total de la venta"
    },
    {
      name        = "metodo_pago"
      type        = "STRING"
      mode        = "NULLABLE"
      description = "Forma de pago (efectivo, tarjeta, transferencia)"
    }
  ])
}
