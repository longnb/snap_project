class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :boximages

  validates :name, presence: true
end
