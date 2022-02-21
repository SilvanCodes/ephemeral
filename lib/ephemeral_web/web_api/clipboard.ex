defmodule EphemeralWeb.WebAPI.Clipboard do
  use ElixirScript.FFI, global: true, name: :"window.navigator.clipboard"

  defexternal(writeText(term))
end
