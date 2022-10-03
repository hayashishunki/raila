# == Schema Information
#
# Table name: posts
#
#  id            :bigint           not null, primary key
#  content(内容) :text             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#
class Post < ApplicationRecord
  validates :content, { presence: true, length: { maximum: 140 } }
  validates :user_id, presence: true

  def user_return
    return User.find_by(id: self.user_id)
  end
end
