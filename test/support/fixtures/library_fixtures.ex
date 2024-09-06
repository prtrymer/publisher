defmodule Publisher.LibraryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Publisher.Library` context.
  """

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}) do
    {:ok, book} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> Publisher.Library.create_book()

    book
  end
end
