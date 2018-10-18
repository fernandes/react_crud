module Api::V1::Contacts::Representer
  module Create
    include Representable::JSON
    include ContactModule

    property :address, populate_if_empty: Address do
      include AddressModule
    end

    collection :telephones, populate_if_empty: Telephone do
      include TelephoneModule
    end
  end
end
