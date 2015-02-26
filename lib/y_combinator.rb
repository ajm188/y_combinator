module YCombinator  
  # Returns a +lambda+ that is the y combinator.
  # Y combinators are used to create anonymous recursively-
  # defined functions. The y combinator should be applied
  # to a partial function definition (this is the
  # 'recursion' part). When the y combinator is applied
  # to a partial function definition, it returns the
  # partial function definition applied to itself.
  # This means that an anonymous function can take
  # itself as an argument and then refer to itself
  # in its definition. This creates the recursion.
  def self.y_combinator
    ->(f) {
      ->(x) { f.(->(v) { x.(x).(v) }) }.(
      ->(x) { f.(->(v) { x.(x).(v) }) } )
    }
  end
end
