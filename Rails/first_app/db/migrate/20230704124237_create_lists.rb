class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      
      # 以下2行9-5で追加
      t.string :title
      t.string :body
      t.string :author
      t.timestamps
    end
  end
end
