defmodule ExMon.GameTest do
  use ExUnit.Case

  alias Exmon.{Game, Player}

  describe "start/2" do
    test "Start game test" do
      player = Player.build("Rafael", :chute, :soco, :cura)
      computer = Player.build("Robotinik", :chute, :soco, :cura)

      assert {:ok, _pid} = Game.start(computer, player)
    end
  end
end
