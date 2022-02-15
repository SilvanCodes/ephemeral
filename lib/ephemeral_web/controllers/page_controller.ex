defmodule EphemeralWeb.PageController do
  use EphemeralWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
