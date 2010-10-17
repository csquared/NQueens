def method(array)
  array.each do |a|
    yield a
  end
end

method([1,2,3]) {|a| puts a}