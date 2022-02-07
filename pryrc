# Returns a filtered backtrace, omitting Rails/Sorbet layers.

def bt
  caller.select do |line|
    line.start_with?("/home/spin/src/github.com/Shopify/shopify/components")
  end
end
