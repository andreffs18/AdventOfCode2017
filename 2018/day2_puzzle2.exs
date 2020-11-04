defmodule Day2Puzzle2 do
  @doc """
  The boxes will have IDs which differ by exactly one character at the same position in both strings. For example, given the following box IDs:

  - abcde
  - fghij
  - klmno
  - pqrst
  - fguij
  - axcye
  - wvxyz
  The IDs abcde and axcye are close, but they differ by two characters (the second and fourth). However, the IDs fghij and fguij differ by exactly one character, the third (h and u). Those must be the correct boxes.

  What letters are common between the two correct box IDs? (In the example above, this is found by removing the differing character from either ID, producing fgij.)
  """

  @spec main :: String.t()
  def main do
    IO.puts("### Day2 - Puzzle1 ###")

    {params, _} = OptionParser.parse!(System.argv, strict: [filename: :string])

    list = params[:filename]
    |> File.read!
    |> String.split

    output = Enum.reduce_while(list, 0, fn elem1, acc ->
      for elem2 <- list do
        if valid_match?(elem1, elem2) do
          IO.inspect difference(elem1, elem2), label: "VALID!!"
          {:halt, difference(elem1, elem2)}
        end
      end

      {:cont, acc}
    end)
    output
  end

  @spec valid_match?(String.t(), String.t()) :: Boolean.t()
  def valid_match?(string1, string2) do
    1 == [String.codepoints(string1), String.codepoints(string2)]
    |> Enum.zip
    |> Enum.map(fn {s1, s2} -> s1 != s2 end)
    |> Enum.reduce_while(0, fn elem, acc ->
      if elem == true, do: {:cont, acc + 1}, else: {:cont, acc}
    end)
  end

  @spec difference(String.t(), String.t()) :: String.t()
  def difference(string1, string2) do
    [String.codepoints(string1), String.codepoints(string2)]
    |> Enum.zip
    |> Enum.reject(fn {s1, s2} -> s1 != s2 end)
    |> Enum.map(&elem(&1, 1))
    |> Enum.join("")
  end

end


IO.inspect Day2Puzzle2.main()
