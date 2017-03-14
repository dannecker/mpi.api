defmodule MPI.Web.Router do
  @moduledoc false
  use MPI.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MPI.Web do
    pipe_through :api

    resources "/persons/", PersonController
  end
end
