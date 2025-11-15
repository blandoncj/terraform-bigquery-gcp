output "dataset_id" {
  value       = google_bigquery_dataset.ventas_dataset.dataset_id
  description = "ID del dataset creado"
}

output "tabla_id" {
  value       = google_bigquery_table.transacciones.table_id
  description = "ID de la tabla creada"
}

output "ruta_completa" {
  value       = "${google_bigquery_dataset.ventas_dataset.project}.${google_bigquery_dataset.ventas_dataset.dataset_id}.${google_bigquery_table.transacciones.table_id}"
  description = "Ruta completa para consultas SQL"
}
