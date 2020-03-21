class Book < ApplicationRecord 
	belongs_to :user
	validates :title, presence: true
	validates :body ,presence: true, length: {maximum: 200}

  has_many :favorites
  has_many :book_comments

  def favorited_by?(user)
    Favorite.where(user_id: user.id, book_id: self.id).exists?
  end

  def self.search(title, method)
    return self.all if title.blank?
    case method
    when 1
      self.where(title: title)
    when 2
      self.where("title LIKE ?", "#{title}%")
    when 3
      self.where("title LIKE ?", "%#{title}")
    when 4
      self.where("title LIKE ?", "%#{title}%")
    else
      self.all
    end
  end
end
