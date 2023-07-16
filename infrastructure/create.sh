# Data lake bucket
gcloud storage buckets create gs://ajp-industries-f1-data-lake --project ajp-industries-f1-elt --location australia-southeast1

# Raw folder
gsutil cp -r ../data/* gs://ajp-industries-f1-data-lake/raw

# Bigquery dataset
# For some reason on my PC bq.cmd works but not bq
bq.cmd --location=australia-southeast1 mk \
   --dataset \
   --description="Landing zone for F1 data" \
   ajp-industries-f1-elt:f1_landing

bq.cmd --location=australia-southeast1 mk \
   --dataset \
   --description="Processed zone for F1 data" \
   ajp-industries-f1-elt:f1_processed

bq.cmd --location=australia-southeast1 mk \
   --dataset \
   --description="Presentation zone for F1 data" \
   ajp-industries-f1-elt:f1_presentation   

bq.cmd --location=australia-southeast1 mk --table \
   --external_table_definition="../data_ingestion/external_tables/circuits.json" \
   ajp-industries-f1-elt:f1_landing.circuits
   