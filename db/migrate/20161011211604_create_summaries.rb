class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.string :title
      t.boolean :public, default: true
      t.text :description

      t.timestamps null: false
    end
  end
end
