require_relative 'enumerable'

# The MyList class is a simple wrapper around an array.
# It includes the MyEnumerable module, which provides the #all?, #any?, and #filter methods.
# The #each method is also defined, which is required by the MyEnumerable module.
class MyList
  include MyEnumerable

  def initialize(*args)
    @list = args
  end

  def each
    return to_enum(:each) unless block_given?
    counter = 0
    while counter < @list.length
      yield(@list[counter])
      counter += 1
    end
    @list
  end
end
