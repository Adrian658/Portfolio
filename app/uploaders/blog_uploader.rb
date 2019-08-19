class BlogUploader < CarrierWave::Uploader::Base

  storage :aws

  def store_dir
    "uploads/blog/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
   %w(jpg jpeg gif png)
  end

end