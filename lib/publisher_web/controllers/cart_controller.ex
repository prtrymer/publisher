defmodule PublisherWeb.CartController do
  use PublisherWeb, :controller

  alias Publisher.Money
  alias Publisher.Money.Cart

  action_fallback PublisherWeb.FallbackController

  def index(conn, _params) do
    carts = Money.list_carts()
    render(conn, :index, carts: carts)
  end

  def create(conn, %{"cart" => cart_params}) do
    with {:ok, %Cart{} = cart} <- Money.create_cart(cart_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/carts/#{cart}")
      |> render(:show, cart: cart)
    end
  end

  def show(conn, %{"id" => id}) do
    cart = Money.get_cart!(id)
    render(conn, :show, cart: cart)
  end

  def update(conn, %{"id" => id, "cart" => cart_params}) do
    cart = Money.get_cart!(id)

    with {:ok, %Cart{} = cart} <- Money.update_cart(cart, cart_params) do
      render(conn, :show, cart: cart)
    end
  end

  def delete(conn, %{"id" => id}) do
    cart = Money.get_cart!(id)

    with {:ok, %Cart{}} <- Money.delete_cart(cart) do
      send_resp(conn, :no_content, "")
    end
  end
end
