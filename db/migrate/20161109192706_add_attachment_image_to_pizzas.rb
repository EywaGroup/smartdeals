class AddAttachmentImageToPizzas < ActiveRecord::Migration
  def self.up
    change_table :pizzas do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :pizzas, :image
  end
end
