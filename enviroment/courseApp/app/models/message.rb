class Message
    include ActiveModel::Model
    attr_accessor :body
    validates :body, presence: true
end
