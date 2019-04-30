class FlattenArray

  def self.flatten array_in
    array_in.flatten.compact  # flatten - remove nesting, compact - remove nils
  end

end
