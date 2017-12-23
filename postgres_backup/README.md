# cron container for adminstrating wal-g backups

Default configuration:
- retain data for 7 day
- full backup every day



## env variables to set

```yaml
  AWS_ACCESS_KEY_ID: keyid
  AWS_SECRET_ACCESS_KEY: secret
  WALE_S3_PREFIX: s3://bucket/dir
  AWS_REGION: us-east-1
  PGDATA: /var/lib/postgresql/data
  PGHOST: db
  PGUSER: postgres
  PGPASSWORD: postgres
  RETAIN: 7
```

