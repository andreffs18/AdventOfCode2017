defmodule Day3Puzzle1 do
  @doc """

  """


  @fabric %{}

  @spec main :: String.t()
  def main do
    IO.puts("### Day3 - Puzzle1 ###")

    #{params, _} = OptionParser.parse!(System.argv, strict: [filename: :string])

    #params[:filename]
    #|> File.read!
    #|> String.split

    ["#123 @ 3,2: 5x4"]
    |> Enum.map(&counter/1)
    |> Enum.reduce(%{:two => 0, :three => 0}, fn counter, map ->
      values = Map.values(counter)

      if Enum.member?(values, 2) do
        map = Map.put(map, :two, Map.get(map, :two, 0) + 1)
      end

      if Enum.member?(values, 3) do
        map = Map.put(map, :three, Map.get(map, :three, 0) + 1)
      end

      map
    end)
    |> checksum
  end


  def populate_fabric(string) do
    [[_, id, left, top, wide, tall]] = Regex.scan(~r/#(\d+) @ (\d+),(\d+): (\d+)x(\d+)/u, string)
    Map.put(@fabric, left)
    Map.put(@fabric, left)
  end

  def print_fabric() do
    for row <- Map.keys(@fabric) do
      line = ""

      for column <- Map.values(@fabric) do
        line = line <> Map.get(fabric, row)
      end

      IO.puts line
    end
  end

end


IO.inspect Day3Puzzle1.main()
