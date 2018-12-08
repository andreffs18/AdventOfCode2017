defmodule Day1Puzzle1 do
  @doc """
  For example, if the device displays frequency changes of +1, -2, +3, +1, then starting from a frequency of zero, the following changes would occur:

  Current frequency  0, change of +1; resulting frequency  1.
  Current frequency  1, change of -2; resulting frequency -1.
  Current frequency -1, change of +3; resulting frequency  2.
  Current frequency  2, change of +1; resulting frequency  3.
  In this example, the resulting frequency is 3.

  Here are other example situations:

  +1, +1, +1 results in  3
  +1, +1, -2 results in  0
  -1, -2, -3 results in -6
  """

  @spec main :: String.t()
  def main do
    IO.puts("### Day1 - Puzzle1 ###")

    {params, _} = OptionParser.parse!(System.argv, strict: [filename: :string])

    params[:filename]
    |> File.read!
    |> String.split
    |> Enum.map(&String.to_integer(&1))
    |> Enum.sum
    |> IO.inspect
  end

end


Day1Puzzle1.main()
