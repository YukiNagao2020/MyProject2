class Tag < ApplicationRecord
  belongs_to :post, dependent: :destroy
end
