require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  
  test 'responds to name, email and body' do 
    msg = Message.new
    assert msg.respond_to?(:body),  'does not respond to :body'
  end

  test 'should be valid when all attributes are set' do
    attrs = { 
      body: 'kthnxbai'
    }

    msg = Message.new attrs
    assert msg.valid?, 'should be valid'
  end

  test 'name, email and body are required by law' do
    msg = Message.new

    refute msg.valid?, 'Blank Mesage should be invalid'

    assert_match /blank/, msg.errors[:body].to_s
  end
end
