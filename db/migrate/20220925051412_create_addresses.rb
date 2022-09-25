class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|

      #追加 id→自動作成される,created_at,updated_at→既に記述あり→不要
      t.integer :customer_id, null: false	#会員ID
      t.string :postal_code, null: false	#郵便番号
      t.string :address, null: false	#住所
      t.string :name, null: false	#宛名
      
      t.timestamps
    end
  end
end
