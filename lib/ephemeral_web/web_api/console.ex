defmodule EphemeralWeb.WebAPI.Console do
  use ElixirScript.FFI, global: true, name: :console

  defexternal(log(term))
end
