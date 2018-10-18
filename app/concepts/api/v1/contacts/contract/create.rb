module Api::V1::Contacts::Contract
  class Create < Reform::Form
    include Api::V1::Contacts::Representer::ContactModule

    validates :first_name, presence: true, length: {minimum: 1}
    validates :last_name, presence: true, length: {minimum: 1}

    property :address, populate_if_empty: Address do
      include Api::V1::Contacts::Representer::AddressModule
    end

    collection :telephones, populate_if_empty: Telephone do
      include Api::V1::Contacts::Representer::TelephoneModule

      validates :number, presence: true
    end
  end
end
