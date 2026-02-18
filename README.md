# Snowflake S3 Ingest Templates

Templates for ingesting files from Amazon S3 into Snowflake:
- AWS IAM role + policies
- Snowflake STORAGE INTEGRATION + external STAGE
- COPY INTO (CSV/JSON)
- RAW -> CURATED merge/upsert
- Optional Snowpipe (auto-ingest)

## Run order
1) 00_setup/00_db_schema.sql
2) 00_setup/01_file_formats.sql
3) 02_snowflake_integrations/01_create_storage_integration.sql
4) 02_snowflake_integrations/02_describe_integration_get_aws_user_arn.sql
5) Configure AWS IAM role trust (01_aws/02_iam_trust_policy_snowflake.json)
6) 02_snowflake_integrations/03_create_external_stage.sql
7) 03_ingest/01_copy_csv_into_raw.sql (or JSON)
8) 04_transform/01_create_curated_tables.sql
9) 04_transform/02_merge_upsert.sql
10) Optional: 05_optional_snowpipe/*# snowflake-s3-ingest-templates
