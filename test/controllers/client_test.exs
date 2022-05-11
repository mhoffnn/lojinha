defmodule Controllers.ClientTest do
  use ExUnit.Case
  doctest Lojinha.Controller.Client

  import Lojinha.Controller.Client

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

  describe "read_by_id/1" do
    @tag task_id: 3
    test "do not return bananinha" do
      refute read_by_id(1) == :bananinha
    end

    test "read client with id 1" do
      client = read_by_id(1)

      assert client.name == "Matheus"
      assert client.age == 20
    end
  end

  describe "read_by_name/1" do
    @tag task_id: 4
    test "do not return bananinha" do
      refute read_by_name("some_name") == :bananinha
    end
  end

  describe "insert/2" do
    @tag task_id: 5
    test "insert some client" do
      {:ok, client} = insert("name", 22)

      assert client.name == "name"
      assert client.age == 22
    end
  end

  describe "update/2" do
    @tag task_id: 6
    test "update some client" do
      {:ok, client} = update(3, %{age: 20})

      assert client.age == 20
      assert client.id == 3
    end
  end

  describe "delete/1" do
    @tag task_id: 7
    test "delete some client" do
      {:ok, client} = insert("name", 22)
      {:ok, client} = delete(client.id)

      assert client
    end
  end
end
