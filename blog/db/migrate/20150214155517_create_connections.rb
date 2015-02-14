class CreateConnections < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.belongs_to :tags
      t.belongs_to :blogs

      t.timestamps
    end
  end
end
