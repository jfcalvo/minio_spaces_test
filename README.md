# MinioSpacesTest

## How to run it

1. Install Elixir (tested with version `1.4.2`).
1. Export `AWS_ACCESS_KEY_ID` env var with the content of `AccessKey` printed out by minio.
2. Export `AWS_SECRET_ACCESS_KEY` env var with the content of `SecretKey` printed out by minio.
3. Create a new bucket in your minio with the name `test-bucket`.
4. Execute `mix deps.get` to install application depencies.
5. Execute `iex -S mix` to run the console inside the application context.

## Once inside the application console

1. Execute `MinioSpacesTest.init_multipart_upload_filename_without_spaces` to run a multipart upload init request with a filename without spaces (working for me and it should return the `upload_id`).

  Getting the following output on my machine:

  ```elixir
  iex(1)> MinioSpacesTest.init_multipart_upload_filename_without_spaces
  "69425ebd-f246-4c61-9b55-24a67a272187"
  ```

2. Execute `MinioSpacesTest.init_multipart_upload_filename_with_spaces` to run a multipart upload init request with a filename with spaces (not working for me, returning an error).

  Getting the following output on my machine:

  ```elixir
  iex(2)> MinioSpacesTest.init_multipart_upload_filename_with_spaces
  ** (MatchError) no match of right hand side value: {:error, {:http_error, 403, %{body: "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<Error><Code>SignatureDoesNotMatch</Code><Message>The request signature we calculated does not match the signature you provided. Check your key and signing method.</Message><Key></Key><BucketName></BucketName><Resource>/test-bucket/video+1.mp4</Resource><RequestId>3L137</RequestId><HostId>3L137</HostId></Error>", headers: [{"Accept-Ranges", "bytes"}, {"Content-Type", "application/xml"}, {"Server", "Minio/RELEASE.2017-03-16T21-50-32Z (darwin; amd64)"}, {"Vary", "Origin"}, {"X-Amz-Request-Id", "14B7743BAA996AC7"}, {"Date", "Fri, 21 Apr 2017 15:46:41 GMT"}, {"Transfer-Encoding", "chunked"}], status_code: 403}}}
      (minio_spaces_test) lib/minio_spaces_test.ex:15: MinioSpacesTest.multipart_upload_initialize/1
  ```

## Tips

* Check `config/config.exs` if you need to change something related with `ex_aws`.
