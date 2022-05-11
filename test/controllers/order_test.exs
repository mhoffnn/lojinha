defmodule Controllers.OrderTest do
  use ExUnit.Case
  doctest Lojinha.Controller.Order

  import Lojinha.Controller.Order

  describe "read/0" do
    @tag task_id: 1
    test "do not return bananinha" do
      refute read() == :bananinha
    end

    @tag test_id: 2
    test "returning a list" do
      assert is_list(read())
    end
  end

  describe "read/1" do
    @tag task_id: 3
    test "do not return bananinha" do
      refute read(1) == :bananinha
    end

    test "read order with id 1" do
      order = read(4)

      assert order.id_product == 2
      assert order.id_client == 8
      assert order.amount == 3
      assert order.total_price == 50.96
      assert order.type_payment == nil
      assert order.is_finalized == false
    end
  end

  describe "read_by_client/1" do
    @tag task_id: 3
    test "do not return bananinha" do
      refute read_by_client(1) == :bananinha
    end

    test "read order with id 1" do
      order = read_by_client(4)

      assert is_list(order)
    end
  end

  describe "insert/3" do
    @tag task_id: 5
    test "insert some order" do
      {:ok, order} = insert(2, 2, 5)

      assert order.id_product == 2
      assert order.id_client == 2
      assert order.amount == 5
      assert order.total_price == 84.94
      assert order.type_payment == nil
      assert order.is_finalized == nil
    end
  end

  describe "update/2" do
    @tag task_id: 6
    test "update some order" do
      {:ok, order} = update(2, 2)

      assert order.amount == 2
      assert order.total_price == 33.97
    end
  end

  describe "delete/1" do
    @tag task_id: 7
    test "delete some order" do
      {:ok, order} = insert(2, 2, 3)
      {:ok, order} = delete(order.id)

      assert order
    end
  end

  describe "finalization/2" do
    @tag task_id: 8
    test "finalize some order" do
      {:ok, order} = finalization("C", 3)

      assert order.is_finalized == true
      assert order.type_payment == "C"
    end
  end
end
