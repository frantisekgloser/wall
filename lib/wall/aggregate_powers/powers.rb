module Powers

  def powers (power, set)
    @power = power
    @set = set
    @powers_set = []
    @set.each_with_index do |value, index|
      @powers_set[index] = value ** @power
    end
    @powers_set
  end
end