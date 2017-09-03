defmodule MindjammerWorldWorkerTest do
  use ExUnit.Case
  alias MindjammerWorld.Worker
  doctest Worker

  describe "df(4)" do
    test "is < 5",  do: assert(Worker.df(4) < 4)
    test "is > -5", do: assert(Worker.df(4) > -5)
  end
end
