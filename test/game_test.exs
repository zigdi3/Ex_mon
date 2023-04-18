defmodule ExMon.GameTest do
  use ExUnit.Case
  doctest ExMon

  alias Exmon.Game, as: Game
  alias Exmon.Player, as: Player 

  describe "start/2" do
    test "Start game test" do
      player = Player.build("Rafael", :chute, :soco, :cura)
      computer = Player.build("Robotinik", :chute, :soco, :cura)

      assert {:ok, _pid} = Game.start(computer, player)
    end
  end
  describe  "info/0" do
    test "Return the current game state" do
      player = Player.build("Rafael", :chute, :soco, :cura)
      computer = Player.build("Robotinik", :chute, :soco, :cura)
      
      Game.start(computer, player)

    expected_response = %{
      computer: %Player {
        life: 100,
        name: "Robotinik",
        moves: %{ move_avg: :soco, move_rnd: :chute, move_heal: :cura }
      },
      player: %Player {
        life: 100,
        name: "Rafael",
        moves: %{ move_avg: :soco, move_rnd: :chute, move_heal: :cura }
      },
      status: :started,
      turn: %Player {
        life: 100,
        name: "Rafael",
        moves: %{ move_avg: :soco, move_rnd: :chute, move_heal: :cura }
      }
    }

      assert expected_response == Game.info()
  
    end
  end

  describe "update/1" do
    test "return update state from game" do
      player = Player.build("Rafael", :chute, :soco, :cura)
      computer = Player.build("Robotinik", :chute, :soco, :cura)

      Game.start(computer, player)

    expected_response = %{
      computer: %Player {
        life: 100,
        name: "Robotinik",
        moves: %{ move_avg: :soco, move_rnd: :chute, move_heal: :cura }
      },
      player: %Player {
        life: 100,
        name: "Rafael",
        moves: %{ move_avg: :soco, move_rnd: :chute, move_heal: :cura }
      },
      status: :started,
      turn: %Player {
        life: 100,
        name: "Rafael",
        moves: %{ move_avg: :soco, move_rnd: :chute, move_heal: :cura }
      }
    }

    updated_state = %{
      computer: %Player {
        life: 96,
        name: "Robotinik",
        moves: %{ move_avg: :soco, move_rnd: :chute, move_heal: :cura }
      },
      player: %Player {
        life: 60,
        name: "Rafael",
        moves: %{ move_avg: :soco, move_rnd: :chute, move_heal: :cura }
      },
      status: :started,
      turn: %Player {
        life: 60,
        name: "Rafael",
        moves: %{ move_avg: :soco, move_rnd: :chute, move_heal: :cura }
      }
    }

  Game.update(updated_state)

      assert expected_response != Game.info()
       
    end
  end
end
