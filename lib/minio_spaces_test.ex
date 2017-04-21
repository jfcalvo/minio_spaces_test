defmodule MinioSpacesTest do
  @bucket "test-bucket"
  @upload_path_without_spaces "video_1.mp4"
  @upload_path_with_spaces "video 1.mp4"

  def init_multipart_upload_filename_without_spaces do
    multipart_upload_initialize(@upload_path_without_spaces)
  end

  def init_multipart_upload_filename_with_spaces do
    multipart_upload_initialize(@upload_path_with_spaces)
  end

  defp multipart_upload_initialize(upload_path) do
    {:ok, %{upload_id: multipart_upload_id}} = ExAws.S3.Upload.initialize(
      %ExAws.S3.Upload{
        bucket: @bucket,
        path: upload_path,
        src: ""
      },
      %{}
    )

    multipart_upload_id
  end
end
