require 'test_helper'

class Mutations::CreateLinkTest < ActiveSupport::TestCase
  def perform(user: nil, **args)
    Mutations::CreateLink.new(object: nil, context: {}).resolve(args)
  end

  test 'create a new link' do
    link = perform(
      url: 'http://example.com',
      caption: 'caption',
    )

    assert link.persisted?
    assert_equal link.caption, 'caption'
    assert_equal link.url, 'http://example.com'
  end
end
