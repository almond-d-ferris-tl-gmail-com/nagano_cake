class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|

      #追加 id→自動作成される,created_at,updated_at→既に記述あり→不要
      t.integer :item_id, null: false	#商品ID
      t.integer :customer_id, null: false	#会員ID
      t.integer :amount, null: false	#数量

      t.timestamps
    end
  end
end
