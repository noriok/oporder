require 'ripper'
require 'pp'
require './event'

@event_map = {}

def sexp(s)
  Ripper.sexp(s)
end

def assert(expect, got)
  if expect != got
    puts "expect: #{expect}"
    puts "got   : #{got}"
    raise
  end
end

def dispatch(exp)
  event = @event_map[exp[0]]
  unless event
    puts "unknown event: #{exp[0]}"
    raise
  end

  event.call(exp)
end

def test(program)
  puts "----- program"
  puts program
  e = sexp(program)
  puts "----- sexp"
  pp e
  puts "----- dispatch"
  ret = dispatch(e)
  print "==> "
  p ret
end

def repl
  print("> ")
  loop do
    s = gets
    break if !s
    puts dispatch(sexp(s))
    print("> ")
  end
  puts
end

def setup
  include Event

  em = [:assign, :binary, :dot2, :paren, :program, :unary, :var_field, :var_ref, :vcall]
  em.each {|e|
    @event_map[e] = method(e)
  }

  @event_map[:@int] = method(:at_int)
  @event_map[:@ident] = method(:at_ident)
  @event_map[:@kw] = method(:at_kw)
end

def main
  setup
  repl

=begin
  # test('1 + 2')
  test('1 + 2 * 3')
  test('(1 + 2) * 3')
  test('10 % 3 == 0')
  test('10 & 3 == 0 && 10')

  test('2 ** 2 ** 2')
  test('foo')
  test('false')
  test('1 + 2 / 2 * 4')
  test('a = b or c')
  test('a = b || c')
  test('a = 10')
  # test('a, b = b, a')

  test('2 ** 10 + 1')
  test('!(a == 2)')
  test('not a == 3')
  test('not a')
  test('a..b')
  test('1..10-1')

  # test('foo(1)')
  test('1 & 2 < 20')
=end
end

if $0 == __FILE__
  main
end



