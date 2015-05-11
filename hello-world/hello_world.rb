class HelloWorld
  def self.hello(name)
    name = "world" if name.empty?
    "Hello, #{name}!"
  end
end
