import json 
import logging

logger = logging.getLogger()
logger.setLevel(logging.INFO)

glue = boto3.client("glue")

def lambda_handler(event, context):
    # Menampilkan log
    logger.info("Received event: %s", json.dumps(event))

    # Mengambil informasi dari event trigger s3
    for record in event.get("Records", []):
        s3_info = record.get("s3", {})
        bucket = s3_info.get("bucket", {}).get("name")
        key = s3_info.get("object", {}).get("key")
        size = s3_info.get("object", {}).get("size", 0)

        logger.info(f"File uploaded to S3 bucket: {bucket}")
        logger.info(f"File key: {key}")
        logger.info(f"File size: {size} bytes")

    crawler_name = "my-crawler"

    try:
        glue.start_crawler(Name=crawler_name)
        logger.info(f"Crawler '{crawler_name}' started successfully.")
    except glue.exceptions.CrawlerRunningException:
        logger.warning(f"Crawler '{crawler_name}' is already running.")
    except Exception as e:
        logger.error(f"Failed to start crawler '{crawler_name}': {e}")

    return {
        'statusCode': 200,
        'body': json.dumps('S3 event processed. Check logs for details.')
    }

        