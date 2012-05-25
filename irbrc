# Colored irb
# wirble rubygem is necessary
begin
  require 'wirble'
  Wirble.init
  Wirble.colorize
rescue LoadError => ex
  warn "Wirble didn't load #{ex}"
end
