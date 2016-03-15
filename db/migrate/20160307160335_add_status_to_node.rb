class AddStatusToNode < ActiveRecord::Migration[5.0]
  def change
    add_column :nodes, :status, :integer, default: 0
  end
end
