defmodule EphemeralWeb.ContactLive do
  use EphemeralWeb, :live_view
  alias EphemeralWeb.Presence
  alias Phoenix.PubSub

  import EphemeralWeb.Component.ContactList

  @presence_topic "presence"

  def mount(_params, _session, socket) do
    if connected?(socket) do
      PubSub.subscribe(Ephemeral.PubSub, @presence_topic)

      Presence.track(socket.transport_pid, @presence_topic, UUID.uuid4(), %{
        online_at: inspect(System.system_time(:second))
      })
    end

    {:ok, assign(socket, contacts: [])}
  end

  def handle_info(%{event: "presence_diff"}, socket) do
    IO.puts("PRESENCE DIFF")
    {:noreply, assign(socket, contacts: Presence.list(@presence_topic))}
  end

  def handle_info(message, socket) do
    IO.inspect(message, label: "contact_live message")
    {:noreply, socket}
  end

  def handle_event(event, params, socket) do
    IO.inspect(event, label: "contact_live event")
    IO.inspect(params, label: "contact_live params")
    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <.contact_list contacts={@contacts} />
    """
  end
end
