Mix.install([
  {:dagger, github: "dagger/dagger", sparse: "sdk/elixir"}
])

client = Dagger.connect!()

host_dir =
  client
  |> Dagger.Query.host()
  |> Dagger.Host.directory(".")

client
|> Dagger.Query.container()
|> Dagger.Container.from("alpine:latest")
|> Dagger.Container.with_directory("/host", host_dir)
|> Dagger.Container.with_exec(["ls", "/host"])
|> Dagger.Container.stdout()
|> IO.puts()

Dagger.close(client)
