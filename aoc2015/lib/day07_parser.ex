defmodule Day07Parser do
  import NimbleParsec

  def wrap_single(x), do: [x]
  def wrap_value([x]), do: {:value, x}
  def wrap_not([x]), do: {:not, unwrap(x)}
  def make_binary_op([[left], [op], [right]]), do: {op, unwrap(left), unwrap(right)}
  def make_instruction([expr, [wire]]), do: {List.to_string(wire), expr}

  defp unwrap([val]), do: val
  defp unwrap(val), do: val

  whitespace = ignore(optional(ascii_char([?\s])))

  integer =
    ascii_string([?0..?9], min: 1)
    |> map({String, :to_integer, []})
    |> map({__MODULE__, :wrap_single, []})

  identifier =
    ascii_string([?a..?z], min: 1)
    |> map({__MODULE__, :wrap_single, []})

  value_or_wire =
    choice([integer, identifier])

  unary_op =
    ignore(string("NOT"))
    |> ignore(whitespace)
    |> concat(value_or_wire)
    |> map({__MODULE__, :wrap_not, []})

  binary_op =
    value_or_wire
    |> map({__MODULE__, :wrap_single, []})
    |> ignore(whitespace)
    |> concat(
    choice([
      string("AND") |> replace(:and),
      string("OR") |> replace(:or),
      string("LSHIFT") |> replace(:lshift),
      string("RSHIFT") |> replace(:rshift)
    ])
    |> map({__MODULE__, :wrap_single, []})
    )
    |> ignore(whitespace)
    |> concat(value_or_wire |> map({__MODULE__, :wrap_single, []}))
    |> reduce({__MODULE__, :make_binary_op, []})

  direct =
    value_or_wire
    |> map({__MODULE__, :wrap_value, []})

  expr =
    choice([unary_op, binary_op, direct])

  instruction =
    expr
    |> ignore(whitespace)
    |> ignore(string("->"))
    |> ignore(whitespace)
    |> concat(identifier |> map({__MODULE__, :wrap_single, []}))
    |> eos()
    |> reduce({__MODULE__, :make_instruction, []})

  defparsec(:parse_instruction, instruction)
end
