defmodule ExMon.Game.Status do
  def print_round_message(%{status: :started} = info) do
    IO.puts("The game is started!")
    IO.inspect(info)
    IO.puts("------------------------")
  end

  def print_round_message(%{status: :continue, turn: player} = info) do
    IO.puts("\n===== #{player} 's turn")
    IO.inspect(info)
    IO.puts("------------------------")
  end

  def print_round_message(%{status: :game_over} = info) do
    IO.puts("\n +++++ GAME OVER ++++++")
    IO.inspect(info)
    IO.puts("------------------------")
  end

  def print_wrong_move_message(move) do
    IO.puts("\n===== Invalid move: #{move}. ===== \n")
  end

  def print_move_message(:computer, :attack, damage) do
    IO.puts("\n ======= The Player attack the cpu and deal #{damage} hit.")
  end

  def print_move_message(:player, :attack, damage) do
    IO.puts("\n ======= The CPU attack the Player and deal #{damage} hit.")
  end

  def print_heal_message(player, :heal, life) do
    IO.puts("\n =======  #{player} healed #{life} life points.")
  end
end
