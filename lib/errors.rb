module UdaciListErrors
  class InvalidItemType < StandardError
  end

  class IndexExceedsListSize < StandardError
  end

  class InvalidPriorityValue < StandardError
  end

  class ArgumentError < StandardError
  end

  class InvalidIndices < StandardError
  end
end
