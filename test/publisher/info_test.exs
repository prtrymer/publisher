defmodule Publisher.InfoTest do
  use Publisher.DataCase

  alias Publisher.Info

  describe "authors" do
    alias Publisher.Info.Author

    import Publisher.InfoFixtures

    @invalid_attrs %{name: nil}

    test "list_authors/0 returns all authors" do
      author = author_fixture()
      assert Info.list_authors() == [author]
    end

    test "get_author!/1 returns the author with given id" do
      author = author_fixture()
      assert Info.get_author!(author.id) == author
    end

    test "create_author/1 with valid data creates a author" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Author{} = author} = Info.create_author(valid_attrs)
      assert author.name == "some name"
    end

    test "create_author/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Info.create_author(@invalid_attrs)
    end

    test "update_author/2 with valid data updates the author" do
      author = author_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Author{} = author} = Info.update_author(author, update_attrs)
      assert author.name == "some updated name"
    end

    test "update_author/2 with invalid data returns error changeset" do
      author = author_fixture()
      assert {:error, %Ecto.Changeset{}} = Info.update_author(author, @invalid_attrs)
      assert author == Info.get_author!(author.id)
    end

    test "delete_author/1 deletes the author" do
      author = author_fixture()
      assert {:ok, %Author{}} = Info.delete_author(author)
      assert_raise Ecto.NoResultsError, fn -> Info.get_author!(author.id) end
    end

    test "change_author/1 returns a author changeset" do
      author = author_fixture()
      assert %Ecto.Changeset{} = Info.change_author(author)
    end
  end
end
