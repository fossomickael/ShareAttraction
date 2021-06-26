class AttractionMember < ApplicationRecord
  belongs_to :user
  belongs_to :attraction

end
