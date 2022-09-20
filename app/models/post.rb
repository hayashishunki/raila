# == Schema Information
#
# Table name: posts
#
#  id            :bigint           not null, primary key
#  content(内容) :text             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Post < ApplicationRecord
  validates :content, { presence: true, length: { maximum: 140 } }
end
