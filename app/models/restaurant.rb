class Restaurant < ApplicationRecord
  validates_presence_of :name, :tel, :address, :opening_hours, :description
  mount_uploader :image, PhotoUploader
  
end
