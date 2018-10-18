class Api::V1::Contacts::Destroy < Trailblazer::Operation
  step Model( Contact , :find )
  step ->(options, params) { options[:model].destroy! }
end
