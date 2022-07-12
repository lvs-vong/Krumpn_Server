defmodule KrumpnServerWeb.PageController do
  use KrumpnServerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
