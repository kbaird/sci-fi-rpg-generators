defmodule GurpsWorldWorkerTest do
  use ExUnit.Case
  doctest GurpsWorld.Worker

  describe "overall_type" do
    test "is :hostile when given 7" do
      assert(GurpsWorld.Worker.overall_type(7) == :hostile)
    end
    test "is :barren when given 8" do
      assert(GurpsWorld.Worker.overall_type(8) == :barren)
    end
    test "is :barren when given 13" do
      assert(GurpsWorld.Worker.overall_type(13) == :barren)
    end
    test "is :garden when given 14" do
      assert(GurpsWorld.Worker.overall_type(14) == :garden)
    end
  end

  describe "world_type size" do
    test "is :standard when given {:hostile, 6}" do
      assert(GurpsWorld.Worker.world_type(:hostile, 6)[:size] == :standard)
    end
    test "is :tiny when given {:hostile, 7}" do
      assert(GurpsWorld.Worker.world_type(:hostile, 7)[:size] == :tiny)
    end
    test "is :tiny when given {:hostile, 9}" do
      assert(GurpsWorld.Worker.world_type(:hostile, 9)[:size] == :tiny)
    end
    test "is :standard when given {:hostile, 10}" do
      assert(GurpsWorld.Worker.world_type(:hostile, 10)[:size] == :standard)
    end
    test "is :standard when given {:hostile, 12}" do
      assert(GurpsWorld.Worker.world_type(:hostile, 12)[:size] == :standard)
    end
    test "is :large when given {:hostile, 13}" do
      assert(GurpsWorld.Worker.world_type(:hostile, 13)[:size] == :large)
    end

    test "is :small when given {:barren, 6}" do
      assert(GurpsWorld.Worker.world_type(:barren, 6)[:size] == :small)
    end
    test "is :tiny when given {:barren, 7}" do
      assert(GurpsWorld.Worker.world_type(:barren, 7)[:size] == :tiny)
    end
    test "is :tiny when given {:barren, 10}" do
      assert(GurpsWorld.Worker.world_type(:barren, 10)[:size] == :tiny)
    end
    test "is :asteroid_belt when given {:barren, 11}" do
      assert(GurpsWorld.Worker.world_type(:barren, 11)[:size] == :asteroid_belt)
    end
    test "is :asteroid_belt when given {:barren, 12}" do
      assert(GurpsWorld.Worker.world_type(:barren, 12)[:size] == :asteroid_belt)
    end
    test "is :standard when given {:barren, 13}" do
      assert(GurpsWorld.Worker.world_type(:barren, 13)[:size] == :standard)
    end
    test "is :standard when given {:barren, 16}" do
      assert(GurpsWorld.Worker.world_type(:barren, 16)[:size] == :standard)
    end
    test "is :large when given {:barren, 17}" do
      assert(GurpsWorld.Worker.world_type(:barren, 17)[:size] == :large)
    end

    test "is :standard when given {:garden, 16}" do
      assert(GurpsWorld.Worker.world_type(:garden, 16)[:size] == :standard)
    end
    test "is :large when given {:garden, 17}" do
      assert(GurpsWorld.Worker.world_type(:garden, 17)[:size] == :large)
    end
  end

  describe "world_type sub_type" do
    test "is :cthonian when given {:hostile, 4}" do
      assert(GurpsWorld.Worker.world_type(:hostile, 4)[:sub_type] == :cthonian)
    end
    test "is :greenhouse when given {:hostile, 6}" do
      assert(GurpsWorld.Worker.world_type(:hostile, 6)[:sub_type] == :greenhouse)
    end
    test "is :sulfur when given {:hostile, 9}" do
      assert(GurpsWorld.Worker.world_type(:hostile, 9)[:sub_type] == :sulfur)
    end
    test "is :ammonia when given {:hostile, 14}" do
      assert(GurpsWorld.Worker.world_type(:hostile, 14)[:sub_type] == :ammonia)
    end
    test "is :greenhouse when given {:hostile, 16}" do
      assert(GurpsWorld.Worker.world_type(:hostile, 16)[:sub_type] == :greenhouse)
    end
    test "is :cthonian when given {:hostile, 17}" do
      assert(GurpsWorld.Worker.world_type(:hostile, 17)[:sub_type] == :cthonian)
    end

    test "is :hadean when given {:barren, 3}" do
      assert(GurpsWorld.Worker.world_type(:barren, 3)[:sub_type] == :hadean)
    end
    test "is :ice when given {:barren, 4}" do
      assert(GurpsWorld.Worker.world_type(:barren, 4)[:sub_type] == :ice)
    end
    test "is :rock when given {:barren, 8}" do
      assert(GurpsWorld.Worker.world_type(:barren, 8)[:sub_type] == :rock)
    end
    test "is :ice when given {:barren, 10}" do
      assert(GurpsWorld.Worker.world_type(:barren, 10)[:sub_type] == :ice)
    end
    test "is :belt when given {:barren, 11}" do
      assert(GurpsWorld.Worker.world_type(:barren, 11)[:sub_type] == :belt)
    end
    test "is :belt when given {:barren, 12}" do
      assert(GurpsWorld.Worker.world_type(:barren, 12)[:sub_type] == :belt)
    end
    test "is :ocean when given {:barren, 14}" do
      assert(GurpsWorld.Worker.world_type(:barren, 14)[:sub_type] == :ocean)
    end
    test "is :ice when given {:barren, 15}" do
      assert(GurpsWorld.Worker.world_type(:barren, 15)[:sub_type] == :ice)
    end
    test "is :hadean when given {:barren, 16}" do
      assert(GurpsWorld.Worker.world_type(:barren, 16)[:sub_type] == :hadean)
    end
    test "is :ocean when given {:barren, 17}" do
      assert(GurpsWorld.Worker.world_type(:barren, 17)[:sub_type] == :ocean)
    end
    test "is :ice when given {:barren, 18}" do
      assert(GurpsWorld.Worker.world_type(:barren, 18)[:sub_type] == :ice)
    end

    test "is :garden when given {:garden, 3}" do
      assert(GurpsWorld.Worker.world_type(:garden, 3)[:sub_type] == :garden)
    end
    test "is :garden when given {:garden, 18}" do
      assert(GurpsWorld.Worker.world_type(:garden, 18)[:sub_type] == :garden)
    end
  end

end
