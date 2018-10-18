# == Schema Information
#
# Table name: addresses
#
#  id             :bigint(8)        not null, primary key
#  street_address :string
#  neighborhood   :string
#  city           :string
#  state          :string
#  country        :string
#  contact_id     :bigint(8)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Address < ApplicationRecord
  belongs_to :contact
end
