# Data lake bucket
#gcloud storage buckets create gs://ajp-industries-f1-data-lake --project ajp-industries-f1-elt --location australia-southeast1

# Raw folder
#gsutil cp -r ../data/* gs://ajp-industries-f1-data-lake/raw

# Bigquery dataset
# For some reason on my PC bq.cmd works but not bq
# bq.cmd --location=australia-southeast1 mk \
#    --dataset \
#    --description="Landing zone for F1 data" \
#    ajp-industries-f1-elt:f1_landing

# bq.cmd --location=australia-southeast1 mk \
#    --dataset \
#    --description="Processed zone for F1 data" \
#    ajp-industries-f1-elt:f1_processed

# bq.cmd --location=australia-southeast1 mk \
#    --dataset \
#    --description="Presentation zone for F1 data" \
#    ajp-industries-f1-elt:f1_presentation   

bq.cmd --location=australia-southeast1 mk --table \
   --external_table_definition="../warehouse/bigquery/external_tables/circuits.json" \
   ajp-industries-f1-elt:f1_landing.circuits

bq.cmd --location=australia-southeast1 mk --table \
   --external_table_definition="../warehouse/bigquery/external_tables/constructors.json" \
   ajp-industries-f1-elt:f1_landing.constructors

bq.cmd --location=australia-southeast1 mk --table \
   --external_table_definition="../warehouse/bigquery/external_tables/drivers.json" \
   ajp-industries-f1-elt:f1_landing.drivers

bq.cmd --location=australia-southeast1 mk --table \
   --external_table_definition="../warehouse/bigquery/external_tables/lap_times.json" \
   ajp-industries-f1-elt:f1_landing.lap_times

bq.cmd --location=australia-southeast1 mk --table \
   --external_table_definition="../warehouse/bigquery/external_tables/pit_stops.json" \
   ajp-industries-f1-elt:f1_landing.pit_stops

bq.cmd --location=australia-southeast1 mk --table \
   --external_table_definition="../warehouse/bigquery/external_tables/qualifying.json" \
   ajp-industries-f1-elt:f1_landing.qualifying

bq.cmd --location=australia-southeast1 mk --table \
   --external_table_definition="../warehouse/bigquery/external_tables/races.json" \
   ajp-industries-f1-elt:f1_landing.races

bq.cmd --location=australia-southeast1 mk --table \
   --external_table_definition="../warehouse/bigquery/external_tables/results.json" \
   ajp-industries-f1-elt:f1_landing.results
   