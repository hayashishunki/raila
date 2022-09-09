class Post < ApplicationRecord
  # インデント数が4つになってます
  # {}を使う際は基本的に{ }スペースを入れてください
  # NG: {a:1}, OK: { a: 1 }
    validates :content, {presence: true, length: {maximum: 140}}
end
