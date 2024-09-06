defmodule Publisher.InfoFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Publisher.Info` context.
  """

  @doc """
  Generate a author.
  """
  def author_fixture(attrs \\ %{}) do
    {:ok, author} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Publisher.Info.create_author()

    author
  end
end
