defmodule EphemeralWeb.Component.ProgressBar do
  use EphemeralWeb, :component

  @spec progress_bar(%{progress: float()}) :: Phoenix.LiveView.Rendered.t()
  def progress_bar(assigns) do
    ~H"""
    <div class="progress-bar" style={"max-inline-size: #{@progress}%"}></div>
    """
  end
end
