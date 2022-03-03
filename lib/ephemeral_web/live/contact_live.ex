defmodule EphemeralWeb.ContactLive do
  use EphemeralWeb, :live_view
  alias EphemeralWeb.Presence
  alias Phoenix.PubSub

  import EphemeralWeb.Component.ContactList

  @presence_topic "presence"
  @pulse_rate Application.fetch_env!(:ephemeral, EphemeralWeb.ContactLive)[:pulse_rate]
  @end_of_lifeline Application.fetch_env!(:ephemeral, EphemeralWeb.ContactLive)[:end_of_lifeline]

  defguard is_connected(socket) when not is_nil(socket.transport_pid)

  def mount(_params, _session, socket) when is_connected(socket) do
    uuid = UUID.uuid4()

    PubSub.subscribe(Ephemeral.PubSub, @presence_topic)

    Presence.track(self(), @presence_topic, uuid, %{
      lifeline: 0
    })

    Process.send_after(self(), {:pulse, 0}, @pulse_rate)

    {:ok,
     assign(socket,
       contacts: [],
       uuid: uuid
     )}
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, contacts: [])}
  end

  def handle_info({:pulse, @end_of_lifeline}, socket) do
    Process.exit(self(), :normal)
    {:noreply, socket}
  end

  def handle_info({:pulse, length_of_lifeline}, socket = %{assigns: %{uuid: uuid}}) do
    length_of_lifeline = length_of_lifeline + @pulse_rate

    Presence.update(self(), @presence_topic, uuid, %{
      lifeline: length_of_lifeline / @end_of_lifeline * 100
    })

    Process.send_after(self(), {:pulse, length_of_lifeline}, @pulse_rate)

    {:noreply, socket}
  end

  def handle_info(%{event: "presence_diff"}, socket) do
    {:noreply, assign(socket, contacts: Presence.list(@presence_topic))}
  end

  def render(assigns) do
    ~H"""
    <.contact_list contacts={@contacts} />
    """
  end
end
