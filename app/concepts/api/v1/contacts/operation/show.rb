module Api::V1::Contacts::Operation
  class Show < Trailblazer::Operation
    step ->(options, params) { options["representer.render.class"] = Api::V1::Contacts::Representer::Create }
    step ->(options, params) { options["representer.errors.class"] = ErrorsRepresenter }
    step Rescue(ActiveRecord::RecordNotFound, handler: :not_found_message!) {
      step Model( Contact , :find )
    }

    def not_found_message!(exception, options)
      options[:error] = {
        "message": "Not Found",
        "documentation_url": "to be documented"
      }
    end

  end
end
