class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|

      #追加 id→自動作成される,created_at,updated_at→既に記述あり→不要
      t.integer :item_id, null: false	#商品ID
      t.integer :order_id, null: false	#注文ID
      t.integer :price, null: false	#購入時価格(税込)
      t.integer :amount, null: false	#数量
      t.integer :making_status, null: false, default:0	#製作ステータス,enumで管理
      
      t.timestamps
    end
  end
end
