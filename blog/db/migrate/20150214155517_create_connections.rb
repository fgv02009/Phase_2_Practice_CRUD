class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.belongs_to :tag
      t.belongs_to :blog

      t.timestamps
    end
  end
end
