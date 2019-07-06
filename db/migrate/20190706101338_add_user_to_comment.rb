class AddUserToComment < ActiveRecord::Migration[5.2]
  def change
    change_table :comments do |c|
      c.belongs_to :user, index: true
    end
  end
end
