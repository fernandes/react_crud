# == Schema Information
#
# Table name: contacts
#
#  id         :bigint(8)        not null, primary key
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Contact < ApplicationRecord
  has_one :address, dependent: :destroy
  has_many :telephones, dependent: :destroy
end
