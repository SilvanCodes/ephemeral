defmodule EphemeralWeb.Component.ContactList do
  use EphemeralWeb, :component

  import EphemeralWeb.Component.CopyToClipboard

  @spec contact_list(%{contacts: List.t()}) :: Phoenix.LiveView.Rendered.t()
  def contact_list(assigns) do
    ~H"""
    <%= for {key, %{metas: [%{lifeline: lifeline}]}} <- @contacts do %>
    <.box>
      <.stack>
        <p id={"id-#{key}"}><%= key %> <.copy_to_clipboard target={"#id-#{key}"} /></p>
        <p style={"background: linear-gradient(270deg, white 0 #{lifeline}%, black #{lifeline}% 100%); height: var(--s-1); max-inline-size: 100%"}></p>
      </.stack>
    </.box>
    <% end %>
    """
  end
end
