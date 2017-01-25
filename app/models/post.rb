class Post < ActiveRecord::Base
  belongs_to :category

  before_validation { self.key ||= SecureRandom.hex(4) }
end
