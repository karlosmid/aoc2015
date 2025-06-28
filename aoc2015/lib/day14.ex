defmodule Day14 do
  def parse(input) do
    input
    |> Enum.map(fn line ->
      [_, name, speed, duration, rest] =
        Regex.run(
          ~r/(\w+) can fly (\d+) km\/s for (\d+) seconds, but then must rest for (\d+) seconds\./,
          line
        )

      %{
        name: name,
        speed: String.to_integer(speed),
        duration: String.to_integer(duration),
        rest: String.to_integer(rest)
      }
    end)
  end

  def distance(speed, duration, rest, time) do
    last_section = rem(time, duration + rest)

    last_duration =
      if last_section > duration do
        duration
      else
        last_section
      end

    div(time, duration + rest) * speed * duration + last_duration * speed
  end

  def part1(input, total) do
    parse(input)
    |> Enum.map(fn %{name: name, speed: speed, duration: duration, rest: rest} ->
      %{name: name, distance: distance(speed, duration, rest, total)}
    end)
    |> Enum.max_by(& &1.distance)
  end
end
