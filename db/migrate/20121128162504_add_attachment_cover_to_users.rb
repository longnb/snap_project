class AddAttachmentCoverToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.has_attached_file :cover
    end
  end

  def self.down
    drop_attached_file :users, :cover
  end
end
