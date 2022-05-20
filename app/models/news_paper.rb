class NewsPaper < ApplicationRecord
  has_many :articles, dependent: :destroy
end
