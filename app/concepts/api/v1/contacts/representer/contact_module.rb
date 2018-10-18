module Api::V1::Contacts::Representer
  module ContactModule
    include Reform::Form::Module

    property :id, writeable: false
    property :first_name
    property :last_name
  end
end
