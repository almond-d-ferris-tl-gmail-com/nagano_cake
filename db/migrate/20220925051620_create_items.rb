class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      #追加 id→自動作成される,created_at,updated_at→既に記述あり→不要
      t.integer :genre_id, null: false	#ジャンルID
      t.string :name, null: false	#商品名
      t.text :introduction, null: false	#商品説明文
      t.integer :price, null: false	#税抜価格
      t.boolean :is_active, null: false, default:true	#販売ステータス
      
      t.timestamps
    end
  end
end
