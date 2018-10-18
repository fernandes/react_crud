module Api::V1::Contacts::Representer
  module AddressModule
    include Representable::JSON
    include Reform::Form::Module

    property :id, writeable: false
    property :street_address
    property :neighborhood
    property :city
    property :state
    property :country
  end
end
