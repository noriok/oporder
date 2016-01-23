

module Event
  module_function

  def assign(exp)
    assert(exp[0], :assign)

    lhs = dispatch(exp[1])
    rhs = dispatch(exp[2])
    "(#{lhs} = #{rhs})"
  end

  def at_ident(exp)
    assert(exp[0], :@ident)

    exp[1]
  end

  def at_int(exp)
    assert(exp[0], :@int)

    exp[1]
  end

  def at_kw(exp)
    assert(exp[0], :@kw)

    exp[1]
  end

  def program(exp)
    assert(exp[0], :program)

    e = exp[1][0]
    dispatch(e)
  end

  def binary(exp)
    assert(exp[0], :binary)

    lhs = dispatch(exp[1])
    op  = exp[2]
    rhs = dispatch(exp[3])
    "(#{lhs} #{op} #{rhs})"
  end

  def dot2(exp)
    assert(exp[0], :dot2)

    a = dispatch(exp[1])
    b = dispatch(exp[2])
    "(#{a}..#{b})"
  end

  def paren(exp)
    assert(exp[0], :paren)

    dispatch(exp[1][0])
  end

  def unary(exp)
    assert(exp[0], :unary)

    e = dispatch(exp[2])
    "(#{exp[1]} #{e})"
  end

  def var_field(exp)
    assert(exp[0], :var_field)

    dispatch(exp[1])
  end

  def var_ref(exp)
    assert(exp[0], :var_ref)

    dispatch(exp[1])
  end

  def vcall(exp)
    assert(exp[0], :vcall)

    dispatch(exp[1])
  end

end

