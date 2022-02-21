defmodule EphemeralWeb.Component.ContactList do
  use EphemeralWeb, :component

  import EphemeralWeb.Component.CopyToClipboard

  @spec contact_list(%{contacts: List.t()}) :: Phoenix.LiveView.Rendered.t()
  def contact_list(assigns) do
    ~H"""
    <%= for {key, _value} <- @contacts do %>
    <.box>
      <p id={key}><%= key %> <.copy_to_clipboard target={"##{key}"} /></p>
    </.box>
    <% end %>
    """
  end
end
