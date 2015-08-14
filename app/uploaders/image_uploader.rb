# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :display do
    process :eager => true
    process :resize_to_fill => [350, 500]
  end

  version :thumbnail do
    process :eager => true
    process :resize_to_fill => [340, 340, :face]
  end

   def default_url 
     "http://res.cloudinary.com/bisonshare/image/upload/v1421184236/bisonshare_o5kfr1.jpg"
   end
  
end