class AddAttachmentControllerToPerks < ActiveRecord::Migration
  def self.up
    change_table :perks do |t|
      t.attachment :controller
    end
  end

  def self.down
    remove_attachment :perks, :controller
  end
end
