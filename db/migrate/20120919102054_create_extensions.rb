class CreateExtensions < ActiveRecord::Migration
  def change
    create_table :extensions, :force => true do |t|
      t.string :context, limit: 20, null: false
      t.string :exten, limit: 20, null: false
      t.integer :priority, limit: 4, default: 0
      t.string :app, limit: 20, null: false
      t.string :appdata, limit: 128, null: false

      t.timestamps
    end
  end
end
