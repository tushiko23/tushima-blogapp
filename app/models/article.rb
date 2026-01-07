# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  content    :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Article < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { minimum: 2 }
  validates :title, format: { with: /\A(?!\@)/ }
  validates :content, presence: true
  validates :content, length: { minimum: 10 }
  validates :content, uniqueness: true

  validate :title_length_and_content_length

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end

  def title_length_and_content_length
    char_length = self.title.length + self.content.length
    unless char_length > 100
      errors.add(:content, 'タイトルと内容合わせて100字以上で入力だよ')
    end
  end
end
