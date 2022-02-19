defmodule EphemeralWeb.ContactList do
  use EphemeralWeb, :component

  @spec contact_list(%{contacts: List.t()}) :: Phoenix.LiveView.Rendered.t()
  def contact_list(assigns) do
    ~H"""
    <%= for {key, _value} <- @contacts do %>
    <.box>
      <p><%= key %></p>
    </.box>
    <% end %>
    """
  end
end
