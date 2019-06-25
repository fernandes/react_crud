class Api::V1::ContactsController < ApiController
  def index
    endpoint Api::V1::Contacts::Operation::Index
  end

  def create
    endpoint Api::V1::Contacts::Operation::Create
  end

  def show
    endpoint Api::V1::Contacts::Operation::Show
  end

  def update
    endpoint Api::V1::Contacts::Operation::Update
  end

  def destroy
    endpoint Api::V1::Contacts::Operation::Destroy
  end
end
