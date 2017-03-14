defmodule MPI.Web.PersonController do
  @moduledoc false
  use MPI.Web, :controller
  alias MPI.Repo
  alias MPI.Person
  alias Ecto.Changeset

  action_fallback MPI.Web.FallbackController

  def show(conn, %{"id" => id}) do
    with %Person{} = person <- Repo.get(Person, id) do
      conn
      |> put_status(:ok)
      |> render("person.json", %{person: person})
    end
  end

  def create(conn, params) do
    with %Changeset{valid?: true} = changeset <- Person.changeset(%Person{}, params),
      {:ok, person} <- Repo.insert(changeset) do
        conn
        |> put_status(:created)
        |> render("person.json", %{person: person})
    end
  end

  def update(conn, %{"id" => id} = params) do
    with %Person{} = person <- Repo.get(Person, id),
      %Changeset{valid?: true} = changeset <- Changeset.change(person, params),
      {:ok, %Person{} = person} <- Repo.update(changeset)  do
        conn
        |> put_status(:ok)
        |> render("person.json", %{person: person})
      end
  end
end
