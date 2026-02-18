USE DATABASE INGEST_DB;

-- What is in RAW?
SELECT COUNT(*) AS raw_rows FROM RAW.CUSTOMERS_RAW;

-- Quick null checks (basic quality gate)
SELECT
  SUM(IFF(CUSTOMER_ID IS NULL, 1, 0)) AS null_customer_id,
  SUM(IFF(EMAIL IS NULL, 1, 0))       AS null_email
FROM RAW.CUSTOMERS_RAW;

-- List stage files (helps debug “why didn’t it load?”)
LIST @OPS.STG_S3_EXPORTS;
