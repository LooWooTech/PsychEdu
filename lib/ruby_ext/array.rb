class Array
  def average(&block)
    if block_given?
      sum(&block) / size
    else
      sum / size
    end
  end
end
