class ApplicationRecord < ActiveRecord::Base
  validates_presence_of :name, :tel, :address, :opening_hours, :description
  self.abstract_class = true
end
