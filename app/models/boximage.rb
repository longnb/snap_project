class Boximage < ActiveRecord::Base
  attr_accessible :description, :name, :user_id, :category_id
  #has_many  :schedules, dependent: :destroy
  #has_many :assigneds, foreign_key: "Project_id", dependent: :destroy
  belongs_to :user
  belongs_to :category

  has_many :images
  validates :name , presence: true, length: {maximum: 200}  
  validates :description, presence: true
  validates :user_id, presence: true

  default_scope order: 'boximages.created_at DESC'
end
