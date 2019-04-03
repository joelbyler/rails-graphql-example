require 'test_helper'

module Resolvers
  class LinksSearchTest < ActiveSupport::TestCase
    def find(args)
      ::Resolvers::LinksSearch.call(nil, args, nil)
    end

    # those helpers should be handled with something like `factory_bot` gem
    def create_user
      User.create name: 'test', email: 'test@example.com', password: '123456'
    end

    def create_link(**attributes)
      Link.create! attributes.merge(user: create_user)
    end

    test 'filter option' do
      link1 = create_link caption: 'test1', url: 'http://test1.com'
      link2 = create_link caption: 'test2', url: 'http://test2.com'
      link3 = create_link caption: 'test3', url: 'http://test3.com'
      link4 = create_link caption: 'test4', url: 'http://test4.com'

      result = find(
        filter: {
          'caption_contains' => 'test1',
          'OR' => [{
            'url_contains' => 'test2',
            'OR' => [{
              'url_contains' => 'test3'
            }]
          }, {
            'caption_contains' => 'test2'
          }]
        }
      )

      assert_equal result.map(&:caption).sort, [link1, link2, link3].map(&:caption).sort
    end
  end
end
