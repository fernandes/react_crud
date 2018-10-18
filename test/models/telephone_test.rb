# == Schema Information
#
# Table name: telephones
#
#  id         :bigint(8)        not null, primary key
#  number     :string
#  label      :string
#  contact_id :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TelephoneTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
