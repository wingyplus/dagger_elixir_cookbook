Mix.install([
  {:dagger, github: "dagger/dagger", sparse: "sdk/elixir"}
])

client = Dagger.connect!()

client
|> Dagger.Query.host()
|> Dagger.Host.directory(".")
|> Dagger.Directory.entries()
|> IO.inspect()

Dagger.close(client)
