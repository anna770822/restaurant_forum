class Restaurant < ApplicationRecord
  validates_presence_of :name, :tel, :address, :opening_hours, :description
  mount_uploader :image, PhotoUploader
  
  belongs_to :category, :optional => true
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_user, through: :favorites, source: :user

end
