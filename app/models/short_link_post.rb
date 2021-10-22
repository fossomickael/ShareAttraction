class ShortLinkPost < ApplicationRecord
  belongs_to :short_link
  belongs_to :post
  
end
