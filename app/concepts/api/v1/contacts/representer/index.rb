module Api::V1::Contacts::Representer
  module Index
    include Representable::JSON::Collection

    items class: Contact do
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
end
