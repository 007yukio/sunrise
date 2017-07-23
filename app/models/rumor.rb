class Rumor < ActiveRecord::Base
    validates :title, presence: true
    validates :content, presence: true
    validates :content, length:{ in: 1..140}
end
