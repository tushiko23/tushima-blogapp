# == Schema Information
#
# Table name: profiles
#
#  id           :integer          not null, primary key
#  birthday     :date
#  gender       :integer
#  introduction :text
#  nickname     :string
#  subscribed   :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer          not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
class Profile < ApplicationRecord
  enum :gender, { male: 1, female: 2, other: 3 }
  belongs_to :user

  def age
    return '不明' unless birthday.present?
    # today = Time.zone.today
    # age = today.year - birthday.year - ((today.month > birthday.month || (today.month == birthday.month && today.day >= birthday.day)) ? 0 : 1)
    # age
    years = Time.zone.now.year - birthday.year
    days = Time.zone.now.day - birthday.day

    if days < 0
      "#{years - 1}歳"
    else
      "#{years}歳"
    end
  end
end
