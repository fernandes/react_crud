require 'test_helper'

class Api::V1::ContactsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/api/v1/contacts"
    assert_response :success
    assert_equal index_json, json
  end

  test "create" do
    assert_difference -> { Contact.count } do
      post "/api/v1/contacts", params: contact_params, as: :json
      assert_response :created
      assert_equal test_create_expected_hash(json), json
    end
  end

  test "create return errors" do
    incomplete_params = contact_params
    incomplete_params.delete(:first_name)
    incomplete_params[:telephones][1].delete(:number)
    post "/api/v1/contacts", params: incomplete_params, as: :json
    assert_response :unprocessable_entity
    errors_hash = {"errors"=>{
      "first_name"=>["can't be blank", "is too short (minimum is 1 character)"],
      "telephones[1].number"=>["can't be blank"],
    }}
    assert_equal errors_hash, json
  end

  test "show contact" do
    user_id = contacts(:mary).id
    get "/api/v1/contacts/#{user_id}"
    assert_response :success
    assert_equal index_json[0], json
  end

  test "show contact - not found" do
    get "/api/v1/contacts/42"
    assert_response :not_found
    expected_json = {"error"=>{"message"=>"Not Found", "documentation_url"=>"to be documented"}}
    assert_equal expected_json, json
  end

  test "update" do
    user_id = contacts(:joao).id
    patch "/api/v1/contacts/#{user_id}", params: {last_name: 'Santos'}, as: :json
    assert_response :success
    assert_equal user_id, json['id']
    assert_equal "Santos", json['last_name']
  end

  test "destroy" do
    assert_difference -> { Contact.count }, -1 do
      user_id = contacts(:joao).id
      delete "/api/v1/contacts/#{user_id}"
      assert_response :no_content
    end
  end

  private
    def index_json
      [  
        {  
           "id" =>365790011,
           "first_name" =>"Mary",
           "last_name" =>"Jane",
           "address" => {
              "id" =>365790011,
              "street_address" =>"1 Mary Ave",
              "neighborhood" =>"Mary Hood",
              "city" =>"Maryland",
              "state" =>"MR",
              "country" =>"MR"
           },
           "telephones" => [
              {  
                 "id" =>365790011,
                 "number" =>"+1 11 1111-1111",
                 "label" =>"mobile"
              }
           ]
        },
        {  
           "id" =>398418507,
           "first_name" =>"Joao",
           "last_name" =>"Silva",
           "address" => {
              "id" =>398418507,
              "street_address" =>"1 Joao St",
              "neighborhood" =>"Joao Hood",
              "city" =>"Joaoland",
              "state" =>"JO",
              "country" =>"JO"
           },
           "telephones" => [
              {  
                 "id" =>398418507,
                 "number" =>"+2 11 1111-1111",
                 "label" =>"home"
              }
           ]
        }
     ]
    end

    def test_create_expected_hash(json)
      {
        id: json['id'],
        first_name: "Mary",
        last_name: "Jane",
        address: {
          id: json['address']['id'],
          street_address: "767 5th Avenue",
          neighborhood: "",
          city: "New York",
          state: "NY",
          country: "US",
        },
        telephones: [
          {id: json['telephones'][0]['id'], number: '+1 212-336-1440', label: 'commercial'},
          {id: json['telephones'][1]['id'], number: '+1 212-336-1441', label: 'mobile'},
        ]
      }.deep_stringify_keys!
    end

    def contact_params
      {
        first_name: 'Mary',
        last_name: 'Jane',
        address: {
          street_address: '767 5th Avenue',
          neighborhood: '',
          city: 'New York',
          state: 'NY',
          country: 'US',
        },
        telephones: [
          {
            number: '+1 212-336-1440',
            label: 'commercial'
          },
          {
            number: '+1 212-336-1441',
            label: 'mobile'
          },
        ]
      }
    end
end

# api_v1_contacts_create_url
# api_v1_contacts_create_url
# api_v1_contacts_destroy_url
