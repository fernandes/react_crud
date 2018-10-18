require 'test_helper'

class ErrorsRepresenter < Representable::Decorator
  
end

class ErrorsRepresenterTest < ActionDispatch::IntegrationTest
  class DummyOperation < Trailblazer::Operation
    class Contact
      include ActiveModel::Model
      attr_accessor :name, :address

      def telephones
        []
      end
    end

    class Address
      include ActiveModel::Model
      attr_accessor :location
    end

    class Telephone
      include ActiveModel::Model
      attr_accessor :number
    end

    class DataContract < Reform::Form
      property :name
      validates :name, presence: true, length: {minimum: 1}

      property :address, populate_if_empty: Address do
        property :location
        validates :location, presence: true, length: {minimum: 1}
      end

      collection :telephones, populate_if_empty: Telephone do
        property :number
        validates :number, presence: true, length: {minimum: 1}
      end
    end
  
    step Model( Contact , :new )
    step Contract::Build(constant: DataContract)
    step Contract::Validate()
    step Contract::Persist()
  end

  test "create" do
    res = DummyOperation.(params: {
      name: '',
      address: { location: '' },
      telephones: [
        { number: '123' },
        {}
      ]
    })
    assert res.failure?
    errors = res["result.contract.default"].errors.messages
    expected_result = { 
      :errors => {
        :name=>["can't be blank", "is too short (minimum is 1 character)"],
        :"address.location"=>["can't be blank", "is too short (minimum is 1 character)"],
        :"telephones[1].number"=>["can't be blank", "is too short (minimum is 1 character)"]
      }
    }.to_json

    assert_equal expected_result, ::ErrorsRepresenter.new(errors).to_json
  end
end
