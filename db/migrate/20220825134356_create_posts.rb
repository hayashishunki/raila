class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      # 説明文も加えておくと良さげです。
      # validation系はDB本体にもかけておくとRails側でチェック漏れた時にもデータ登録されないので書いておきましょう
      # (例) t.integer :hoge, null: false, comment: 'ほげ'
      t.text :content

      t.timestamps
    end
  end
end
