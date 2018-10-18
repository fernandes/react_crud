module Api::V1::Contacts::Representer
  module TelephoneModule
    include Representable::JSON
    include Reform::Form::Module

    property :id, writeable: false
    property :number
    property :label
  end
end
