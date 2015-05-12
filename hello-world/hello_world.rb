class HelloWorld
  def self.hello(name = nil)
    greet set_name_if_doesnt_exist(name)
  end

  def self.set_name_if_doesnt_exist(name, default = "world")
    (name && name.empty?) ? default : name
  end

  def self.greet(name)
    "#{GreetingCapitalizer.capital_default}, #{name}!"
  end
end

class GreetingCapitalizer
  def self.capital_default
    Greetings.default.capitalize
  end
end

class Greetings
  def self.default
    all.first
  end

  def self.all
    [
      "hello",
      "hi",
      "sup",
      "hey",
      "yo",
      "good morning",
      "good afternoon",
      "good evening",
    ]
  end
end
