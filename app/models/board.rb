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
  def posts2
    my_id = self.id
    matching_posts = Post.where({:board_id => my_id}).order(:expires_on => :asc )
    return matching_posts
  end
  has_many(:posts, class_name:"Post", foreign_key:"board_id")

  def active_posts
    active_posts = self.posts.where("expires_on > ?", Date.today)
    return active_posts
  end

  def expired_posts
    expired_posts = self.posts.where("expires_on < ?", Date.today)
    return expired_posts
  end

end
