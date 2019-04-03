module Types
  class QueryType < BaseObject
    description "The query root of this schema"

    field :filterLinks, 'Search for specific links', function: Resolvers::LinksSearch

    # queries are just represented as fields
    # `all_links` is automatically camelcased to `allLinks`
    field :all_links, [LinkType], 'Fetch all links', null: false

    # this method is invoked, when `all_link` fields is beeing resolved
    def all_links
      Link.all
    end

  end
end
