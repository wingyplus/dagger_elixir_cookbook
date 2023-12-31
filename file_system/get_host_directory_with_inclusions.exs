Mix.install([
  {:dagger, github: "dagger/dagger", sparse: "sdk/elixir"}
])

tmp_dir = System.tmp_dir!()
target = Path.join([tmp_dir, "out"])
File.mkdir_p!(target)
File.write!(Path.join([target, "foo.txt"]), "1")
File.write!(Path.join([target, "bar.txt"]), "2")
File.write!(Path.join([target, "bar.rar"]), "3")

client = Dagger.connect!(workdir: target)

client
|> Dagger.Query.host()
|> Dagger.Host.directory(".", include: ["*.rar"])
|> Dagger.Directory.entries()
|> IO.inspect()

Dagger.close(client)
