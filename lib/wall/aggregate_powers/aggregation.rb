module Aggregation

  def aggregation (aggregation_method, powers_set)
    @aggregation_method = aggregation_method
    @powers_set = powers_set
    @result = @powers_set.shift
    @powers_set.each do |value| 
      @result = @result.send(@aggregation_method, value)
    end
    @result
  end

end