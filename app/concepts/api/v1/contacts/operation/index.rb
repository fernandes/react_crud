module Api::V1::Contacts::Operation
  class Index < Trailblazer::Operation
    step ->(options, params) { options["representer.render.class"] = Api::V1::Contacts::Representer::Index }
    step ->(options, params) { options["representer.errors.class"] = ErrorsRepresenter }
    step ->(options, params) { options[:model] = Contact.all }
  end
end
