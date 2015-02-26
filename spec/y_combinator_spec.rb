require_relative '../lib/y_combinator'

def fact(n)
  n.zero? ? 1 : n * fact(n - 1)
end

RSpec.describe YCombinator do
  describe '::y_combinator' do
    let(:fact_y) {
      YCombinator.y_combinator.(
        ->(partial) {
          ->(n) { n.zero? ? 1 : n * partial.(n - 1) }
        })
    }

    it 'correctly defines recursive factorial' do
      (1..10).each do |n|
        expect(fact_y.(n)).to eq fact(n)
      end
    end
  end
end
