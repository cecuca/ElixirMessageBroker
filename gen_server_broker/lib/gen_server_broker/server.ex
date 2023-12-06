defmodule GenServerBroker.Server do
  use GenServer, restart: :transient

  def start_link(_) do
    GenServer.start_link(__MODULE__, :started, name: __MODULE__)
    end

  def init(:started) do
    IO.puts("Server is initialized")

    {:ok, :started}

end


def handle_call({:create_queue, queue_name}, _from, state) do

  create_queue(queue_name)
      {:reply, "You have successfully created a queue named #{queue_name}", state}

end

def create_queue(queue_name, list_of_subscribers \\ []) do

spawn fn -> create_queue_thread(list_of_subscribers, queue_name) end

end

defp create_queue_thread(current_state, queue_name) do
 new_state = receive do

 end
 new_state |> create_queue_thread(queue_name)
end

defp update_queue_subscription(queue_list \\ %{}) do

end

def handle_call({:subscribe_to_queue, queue_name}, _from, state) do

  {:reply, "You have successfully subscribed #{queue_name}", state}
end

end
