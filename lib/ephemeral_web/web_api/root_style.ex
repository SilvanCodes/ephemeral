defmodule EphemeralWeb.WebAPI.RootStyle do
  # This is the same as the :root selector in CSS.
  use ElixirScript.FFI, global: true, name: :"document.documentElement.style"

  defexternal(setProperty(name, value))
end
