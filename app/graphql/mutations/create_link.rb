module Mutations
  class CreateLink < BaseMutation

    # arguments passed to the `resolved` method
    argument :caption, String, required: true
    argument :url, String, required: true

    # return type from the mutation
    type Types::LinkType

    def resolve(caption: nil, url: nil)
      Link.create!(
        caption: caption,
        url: url,
        user: context[:current_user]
      )
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end

  end
end
