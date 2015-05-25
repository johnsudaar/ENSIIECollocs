# encoding: utf-8

class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  process resize_to_fit: [800, 800]
  storage :fog


  version :thumb do
    process resize_to_fill: [200,200]
  end

  def filename
    @name ||= "#{Time.now.to_i}-#{super}" if original_filename.present? and super.present?
  end

  def store_dir
    "public/uploads/"
  end
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
