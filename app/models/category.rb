class Category < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name, :case_sensitive => false
  has_many :restaurants, dependent: :restrict_with_error
end
