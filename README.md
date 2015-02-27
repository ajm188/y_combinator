YCombinator
===

Sometimes, you need some Y combinators to write anonymous recursive functions. Typing out the Y combinator every time you need it is annoying. Use this instead.
YCombinator defines a single class method that returns the Y combinator lambda.

Use
---

If you already know how Y combinators work, you'll probably want to skip
most of this. Just apply your partial function definition to ```YCombinator.y_combinator```.

Factorial is the canonical example for y combinators, let's stick to that.

In a language like Ruby, factorial would be defined as:

```ruby
def factorial(n)
  n.zero? ? 1 : n * factorial(n - 1)
end
```

Now, for some reason, say you wanted to define the factorial function with a lambda. In Ruby, you could very well do this:

```ruby
factorial = ->(n) { n.zero? ? 1 : n * factorial(n - 1) }
```

However, this is kind of cheating, due to the binding time of factorial to the lambda in Ruby.
In pure lambda calculus, you wouldn't be able to do this. So instead, apply the y combinator function to
a partial definition of the factorial function. The y combinator returns the function passed to it, so this means
your partial function can take itself as an argument, and in this way it can refer to itself in its definition, like so:

```ruby
require 'y_combinator'

factorial = YCombinator.y_combinator.(
  ->(partial) {
    ->(n) { n.zero? ? 1 : n * partial.(n - 1) }
  })
factorial.(5) #=> 120
```

If your Ruby implementation supports Tail Call Optimization (see [here](http://nithinbekal.com/posts/ruby-tco/)),
you could define your partial factorial function to be tail recursive,
to take advantage of this. For example:

```ruby
require 'y_combinator'

# Accumulator style
factorial = YCombinator.y_combinator.(
  ->(partial) {
    ->(acc) {
      ->(n) { n.zero? ? acc : partial.(n * acc).(n - 1) }
    }
  })
factorial.(1).(5) #=> 120

# Continuation Passing Style (CPS)
factorial = YCombinator.y_combinator.(
  ->(partial) {
    ->(continuation) {
      ->(n) { n.zero? continuation.(1) : partial.(->(v) { continuation.(n * v) }).(n - 1) }
    }
  })
factorial.(->(v) { v }).(5) #=> 120
```

Contributing
---
I don't really see any changes that would need to be made, since there's not a lot of code and
it's pretty straightforward (see
[Wikipedia](http://en.wikipedia.org/wiki/Fixed-point_combinator#Strict_fixed_point_combinator)),
but fork and make a pull request if you want.
