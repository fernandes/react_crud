class Api::V1::ContactsController < ApiController
  def index
    endpoint Api::V1::Contacts::Index
  end

  def create
    endpoint Api::V1::Contacts::Create
  end

  def show
    endpoint Api::V1::Contacts::Show
  end

  def update
    endpoint Api::V1::Contacts::Update
  end

  def destroy
    endpoint Api::V1::Contacts::Destroy
  end
end
