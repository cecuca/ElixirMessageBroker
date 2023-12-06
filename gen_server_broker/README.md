# GenServerBroker

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `gen_server_broker` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:gen_server_broker, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/gen_server_broker>.

1)Создать клиента со следующими возможностями:
    -Запрос серверу на создание очереди
    -Запрос серверу на подключение к очереди
    -Отправка сообщения в очередь
2)Создать сервер со следующими возможностями:
    -Получить запрос от клиента на создание очереди\подключение к очереди\отправку сообщения к очереди и обработать его
    -Предоставить клиенту обратно данные об успешном\неуспешном создании очереди\подключение к очереди\отправки сообщения
    -Сообщение, попавшее в очередь должно последовательно рассылаться процессам, подписавшимся на очередь(Избегать броадкаст)
3)Создать супервайзер, который будет совершать следующие действия:
    -В течении некоторого времени N неактивно простаивающий поток очереди должен быть закрыт во избежании утечки памяти