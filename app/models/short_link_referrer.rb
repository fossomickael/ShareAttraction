class ShortLinkReferrer < ApplicationRecord
  belongs_to :user
  belongs_to :short_link
end
