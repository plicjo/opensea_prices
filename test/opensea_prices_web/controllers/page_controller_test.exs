defmodule OpenseaPricesWeb.PageControllerTest do
  use OpenseaPricesWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Please enable it to continue"
  end
end
