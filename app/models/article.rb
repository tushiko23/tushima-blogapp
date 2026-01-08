# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
class Article < ApplicationRecord
  belongs_to :user
  has_many  :comments, dependent: :destroy
  validates :title, presence: true
  validates :title, length: { minimum: 2 }
  validates :title, format: { with: /\A(?!\@)/ }
  validates :content, presence: true
  validates :content, length: { minimum: 10 }
  validates :content, uniqueness: true

  def author_name
    user.display_name
  end

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end
end
