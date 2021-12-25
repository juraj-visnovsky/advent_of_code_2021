require_relative 'constants'

class String
  def opening_character?
    LEGAL_PAIRS.keys.include?(self)
  end

  def closing_character?
    LEGAL_PAIRS.values.include?(self)
  end
end
