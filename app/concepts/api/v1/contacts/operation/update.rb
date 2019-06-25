module Api::V1::Contacts::Operation
  class Update < Trailblazer::Operation
    step ->(options, params) { options["representer.render.class"] = Api::V1::Contacts::Representer::Create }
    step ->(options, params) { options["representer.errors.class"] = ErrorsRepresenter }
    step Model( Contact , :find )
    step Contract::Build(constant: Api::V1::Contacts::Contract::Create)
    step Contract::Validate()
    step Contract::Persist()
  end
end
