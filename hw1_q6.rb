class CartesianProduct
  include Enumerable

  def initialize(list1, list2)
    @list1, @list2 = list1, list2
  end

  def each
    @list1.each do |e1|
      @list2.each do |e2|
        yield e1, e2
      end
    end
  end

end
