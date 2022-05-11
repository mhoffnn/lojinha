defmodule Controllers.ProductTest do
  use ExUnit.Case
  doctest Lojinha.Controller.Product

  import Lojinha.Controller.Product

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

    test "read product with id 1" do
      product = read(2)

      assert product.name == "sabão em pó Omo"
      assert product.price == 16.99
      assert product.inventory == 365
    end
  end

  describe "insert/3" do
    @tag task_id: 5
    test "insert some product" do
      {:ok, product} = insert("product_name", 4.99, 50)

      assert product.name == "product_name"
      assert product.price == 4.99
      assert product.inventory == 50
    end
  end

  describe "update/2" do
    @tag task_id: 6
    test "update some product" do
      {:ok, product} = update(3, %{price: 20})

      assert product.price == 20
      assert product.id == 3
    end
  end

  describe "delete/1" do
    @tag task_id: 7
    test "delete some product" do
      {:ok, product} = insert("product_name", 4.99, 50)
      {:ok, product} = delete(product.id)

      assert product
    end
  end
end
