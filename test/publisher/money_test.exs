defmodule Publisher.MoneyTest do
  use Publisher.DataCase

  alias Publisher.Money

  describe "carts" do
    alias Publisher.Money.Cart

    import Publisher.MoneyFixtures

    @invalid_attrs %{amount: nil}

    test "list_carts/0 returns all carts" do
      cart = cart_fixture()
      assert Money.list_carts() == [cart]
    end

    test "get_cart!/1 returns the cart with given id" do
      cart = cart_fixture()
      assert Money.get_cart!(cart.id) == cart
    end

    test "create_cart/1 with valid data creates a cart" do
      valid_attrs = %{amount: 42}

      assert {:ok, %Cart{} = cart} = Money.create_cart(valid_attrs)
      assert cart.amount == 42
    end

    test "create_cart/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Money.create_cart(@invalid_attrs)
    end

    test "update_cart/2 with valid data updates the cart" do
      cart = cart_fixture()
      update_attrs = %{amount: 43}

      assert {:ok, %Cart{} = cart} = Money.update_cart(cart, update_attrs)
      assert cart.amount == 43
    end

    test "update_cart/2 with invalid data returns error changeset" do
      cart = cart_fixture()
      assert {:error, %Ecto.Changeset{}} = Money.update_cart(cart, @invalid_attrs)
      assert cart == Money.get_cart!(cart.id)
    end

    test "delete_cart/1 deletes the cart" do
      cart = cart_fixture()
      assert {:ok, %Cart{}} = Money.delete_cart(cart)
      assert_raise Ecto.NoResultsError, fn -> Money.get_cart!(cart.id) end
    end

    test "change_cart/1 returns a cart changeset" do
      cart = cart_fixture()
      assert %Ecto.Changeset{} = Money.change_cart(cart)
    end
  end
end
