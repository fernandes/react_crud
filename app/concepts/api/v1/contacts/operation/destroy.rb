module Api::V1::Contacts::Operation
  class Destroy < Trailblazer::Operation
    step Model( Contact , :find )
    step ->(options, params) { options[:model].destroy! }
  end
end
