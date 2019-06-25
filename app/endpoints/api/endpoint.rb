module Api
  class Endpoint < Trailblazer::Endpoint
    # this is totally WIP as we need to find best practices.
    # also, i want this to be easily extendable.
    Matcher = Dry::Matcher.new(
      destroyed: Dry::Matcher::Case.new( # DISCUSS: the "present" flag needs some discussion.
        match:   ->(result) { result.success? && result[:model].try(:destroyed?) },
        resolve: ->(result) { result }),
      # present: Dry::Matcher::Case.new( # DISCUSS: the "present" flag needs some discussion.
      #   match:   ->(result) { result.success? && result["present"] },
      #   resolve: ->(result) { result }),
      success: Dry::Matcher::Case.new(
        match:   ->(result) { result.success? },
        resolve: ->(result) { result }),
      created: Dry::Matcher::Case.new(
        match:   ->(result) { result.success? && result[:model].try(:persisted?) }, # the "model.action" doesn't mean you need Model.
        resolve: ->(result) { result }),
      not_found: Dry::Matcher::Case.new(
        match:   ->(result) { result.failure? && result[:model].nil? },
        resolve: ->(result) { result }),
      # TODO: we could add unauthorized here.
      # unauthenticated: Dry::Matcher::Case.new(
      #   match:   ->(result) { result.failure? }, # FIXME: we might need a &. here ;)
      #   resolve: ->(result) { result }),
      invalid: Dry::Matcher::Case.new(
        match:   ->(result) { result.failure? && result["result.contract.default"] && result["result.contract.default"].failure? },
        resolve: ->(result) { result })
    )

    def matcher
      Api::Endpoint::Matcher
    end
  end
end
