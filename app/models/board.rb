# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Board < ApplicationRecord
  def posts
    my_id = self.id
    matching_posts = Post.where({:board_id => my_id})
    return matching_posts
  end
  has_many(:posts2, class_name:"Post", foreign_key:"board_id")
end
