resource "aws_kinesis_stream" "test_stream"{
	name = "first-kinesis"
	shard_count = 1
	retention_period = 24
}