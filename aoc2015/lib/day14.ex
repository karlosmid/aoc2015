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

  def part2(input, total_duration) do
    parse(input)
    |> Enum.map(fn deer -> Map.put(deer, :points, 0) end)
    |> round(1, total_duration)
  end

  def round(input, step, total_duration) when step == total_duration,
    do: Enum.max_by(input, & &1.points)

  def round(input, step, total_duration) do
    with_distance =
      Enum.map(input, fn deer ->
        Map.put(deer, :distance, distance(deer.speed, deer.duration, deer.rest, step))
      end)

    max_distance = Enum.max_by(with_distance, & &1.distance).distance

    Enum.map(with_distance, fn deer ->
      if deer.distance >= max_distance do
        Map.put(deer, :points, deer.points + 1)
      else
        deer
      end
    end)
    |> round(step + 1, total_duration)
  end
end
