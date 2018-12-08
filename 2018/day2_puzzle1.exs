defmodule Day2Puzzle1 do
  @doc """
  For example, if you see the following box IDs:

  - abcdef contains no letters that appear exactly two or three times.
  - bababc contains two a and three b, so it counts for both.
  - abbcde contains two b, but no letter appears exactly three times.
  - abcccd contains three c, but no letter appears exactly two times.
  - aabcdd contains two a and two d, but it only counts once.
  - abcdee contains two e.
  - ababab contains three a and three b, but it only counts once.
  Of these box IDs, four of them contain a letter which appears exactly twice, and three of them contain a letter which appears exactly three times. Multiplying these together produces a checksum of 4 * 3 = 12.

  What is the checksum for your list of box IDs?
  """

  @spec main :: String.t()
  def main do
    IO.puts("### Day2 - Puzzle1 ###")

    {params, _} = OptionParser.parse!(System.argv, strict: [filename: :string])

    params[:filename]
    |> File.read!
    |> String.split
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

  @spec counter(String.t()) :: Map.t()
  def counter(string) do
    string
    |> String.codepoints
    |> Enum.reduce(%{}, fn char, map ->
      Map.put(map, char, (Map.get(map, char, 0) + 1))
    end)
  end

  @spec checksum(Map.t()) :: Integer.t()
  def checksum(checksum_map) do
    IO.inspect checksum_map
    Map.get(checksum_map, :three) * Map.get(checksum_map, :two)
  end
end


IO.inspect Day2Puzzle1.main()
