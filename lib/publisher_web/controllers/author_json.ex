defmodule PublisherWeb.AuthorJSON do
  alias Publisher.Info.Author

  @doc """
  Renders a list of authors.
  """
  def index(%{authors: authors}) do
    %{data: for(author <- authors, do: data(author))}
  end

  @doc """
  Renders a single author.
  """
  def show(%{author: author}) do
    %{data: data(author)}
  end

  defp data(%Author{} = author) do
    %{
      id: author.id,
      name: author.name
    }
  end
end
