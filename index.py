import json 
import os
import boto3

#  Ambil nama tabel dari environment variable
TABLE_NAME = os.environ.get('DYNAMODB_TABLE')

# Inisialisasi DynamoDB
dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table(TABLE_NAME)

def lambda_handler(event, context):
    try: 
        # Untuk scan semua item dari tabel
        response = table.scan()
        items = response.get('Items', [])

        return {
            'statusCode': 200,
            'body': json.dumps(items)
        }
    
    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps({'error': str(e)})
        }