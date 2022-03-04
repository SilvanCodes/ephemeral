defmodule EphemeralWeb.Component.ContactList do
  use EphemeralWeb, :component

  import EphemeralWeb.Component.CopyToClipboard
  import EphemeralWeb.Component.ProgressBar

  @spec contact_list(%{contacts: List.t()}) :: Phoenix.LiveView.Rendered.t()
  def contact_list(assigns) do
    ~H"""
    <%= for {key, %{metas: [%{lifeline: lifeline}]}} <- @contacts do %>
    <.box>
      <.stack>
        <p id={"id-#{key}"}><%= key %> <.copy_to_clipboard target={"#id-#{key}"} /></p>
        <.progress_bar progress={lifeline}/>
      </.stack>
    </.box>
    <% end %>
    """
  end
end
