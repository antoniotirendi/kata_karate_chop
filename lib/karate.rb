class Karate
  def initialize(collection)
    @collection = collection
    @left_position = 0
  end

  def chop(element_to_find)
    return -1 if @collection.empty?

    return (@collection[0] == element_to_find ? @left_position : -1) if @collection.length == 1

    center = (@collection.length-1)/2
    return (center + @left_position) if @collection[center] == element_to_find

    if @collection[center] > element_to_find
      @collection = @collection[@left_position..center-1]
    else
      @collection = @collection[center+1..@collection.length-1]
      @left_position += center+1
    end
    chop(element_to_find)
  end
end