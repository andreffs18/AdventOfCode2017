defmodule Day1Puzzle2 do
  @doc """
  You notice that the device repeats the same frequency change list over and over. To calibrate the device, you need to find the first frequency it reaches twice.

  For example, using the same list of changes above, the device would loop as follows:

  Current frequency  0, change of +1; resulting frequency  1.
  Current frequency  1, change of -2; resulting frequency -1.
  Current frequency -1, change of +3; resulting frequency  2.
  Current frequency  2, change of +1; resulting frequency  3.
  (At this point, the device continues from the start of the list.)
  Current frequency  3, change of +1; resulting frequency  4.
  Current frequency  4, change of -2; resulting frequency  2, which has already been seen.
  In this example, the first frequency reached twice is 2. Note that your device might need to repeat its list of frequency changes many times before a duplicate frequency is found, and that duplicates might be found while in the middle of processing the list.

  Here are other examples:

  +1, -1 first reaches 0 twice.
  +3, +3, +4, -2, -4 first reaches 10 twice.
  -6, +3, +8, +5, -6 first reaches 5 twice.
  +7, +7, -2, -7, -4 first reaches 14 twice.
  """

  @spec main :: String.t()
  def main do
    IO.puts("### Day1 - Puzzle2 ###")

    {params, _} = OptionParser.parse!(System.argv, strict: [filename: :string])

    params[:filename]
    |> File.read!
    |> String.split
    |> Enum.map(&String.to_integer(&1))
    |> Stream.cycle
    |> Enum.reduce_while([0], fn elem, acc ->
      current_sum = elem + List.first(acc)
      IO.inspect %{"elem" => elem, "acc" => acc, "current_sum" => current_sum}
      case Enum.member?(acc, current_sum) do
        true ->
          {:halt, current_sum}
        false ->
          {:cont, [current_sum | acc]}
      end
    end)
  end
end


Day1Puzzle2.main()
