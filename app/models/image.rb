class Image < ActiveRecord::Base
  make_flaggable :like

  belongs_to :boximage
  attr_accessible :title, :user_id,:boximage_id,:file,:url
  mount_uploader :file, FileUploader 

  validate :title, :presence => true
  validate :user_id, :presence => true
  validate :boximage_id, :presence => true
  validates_presence_of :file_url
end
