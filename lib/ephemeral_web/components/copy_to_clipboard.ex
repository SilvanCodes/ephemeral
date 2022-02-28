defmodule EphemeralWeb.Component.CopyToClipboard do
  use EphemeralWeb, :component

  import Phoenix.LiveView.JS, only: [dispatch: 2]
  import EphemeralWeb.Gettext

  defmodule JS do
    alias EphemeralWeb.WebAPI.Window
    alias EphemeralWeb.WebAPI.Clipboard
    alias EphemeralWeb.WebAPI.RootStyle

    def call do
      if Clipboard != nil do
        Window.addEventListener("copy_to_clipboard", fn event ->
          event.target.textContent
          |> Clipboard.writeText()
        end)
      else
        # Hide component when clipboard is unsupported
        RootStyle.setProperty("--copy-to-clipboard", "none")
      end
    end
  end

  def copy_to_clipboard(assigns) do
    ~H"""
      <i title={gettext("Copy to clipboard")}
         class="mi-copy elc-icon copy-to-clipboard"
         phx-click={dispatch("copy_to_clipboard", to: @target)}
      />
    """
  end
end
