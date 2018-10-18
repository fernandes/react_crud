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

require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
