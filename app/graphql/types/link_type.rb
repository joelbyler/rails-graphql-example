module Types
  class LinkType < BaseObject
    description "A link to be shared and voted on"

    field :id, ID, 'Unique identifier for this resource', null: false
    field :url, String, 'Url for navigating to this link', null: false
    field :caption, String, 'Describe this link for other users', null: false

    # `posted_by` is automatically camelcased as `postedBy`
    # field can be nil, because we added users relationship later
    # "method" option remaps field to an attribute of Link model
    field :posted_by, UserType, 'The user who posted this link', null: true, method: :user

    field :votes, [Types::VoteType], 'Votes for the link', null: false
  end
end
