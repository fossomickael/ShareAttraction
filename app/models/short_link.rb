class ShortLink < ApplicationRecord

  ALPHABET = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".split(//)
  belongs_to :user, optional: true
  belongs_to :attraction

  after_create :set_short_url

  validates :long_url, presence: true

  def self.bijective_decode(string)
    # based on base2dec() in Tcl translation
    # at http://rosettacode.org/wiki/Non-decimal_radices/Convert#Ruby
    i = 0
    base = ALPHABET.length
    string.each_char { |c| i = i * base + ALPHABET.index(c) }
    i
  end
  
  private

  def set_short_url
    self.update_column(:short_url, bijective_encode(id))
  end

  def bijective_encode(int)
    # from http://refactormycode.com/codes/125-base-62-encoding
    # with only minor modification
    return ALPHABET[0] if int.zero?

    string = ''
    base = ALPHABET.length
    while int.positive?
      string << ALPHABET[int.modulo(base)]
      int /= base
    end
    string.reverse
  end

  
end
