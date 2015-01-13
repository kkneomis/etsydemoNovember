# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :display do
    process :eager => true
    process :resize_to_fill => [700, 700]
  end

  version :thumbnail do
    process :eager => true
    process :resize_to_fill => [240, 320, :face]
  end

end