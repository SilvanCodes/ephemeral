defmodule EphemeralWeb.PageControllerTest do
  use EphemeralWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Ephemeral"
  end
end
