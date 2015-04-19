class WordProblem
  OPERATORS = {
    "plus"          => "+",
    "minus"         => "-",
    "multiplied by" => "*",
    "divided by"    => "/",
  }

  def initialize(question)
    @question = question
    parse_question
  end

  def answer
    eval(@parsed_question)
  end

  private

  def parse_question
    @parsed_question = parse_beginning
    @parsed_question = remove_question_mark(@parsed_question)
    @parsed_question = replace_words(@parsed_question)
    validate_question
  end

  def replace_words(input)
    OPERATORS.reduce(input) do |replaced_words, (word, operator)|
      replaced_words.gsub(word, operator)
    end
  end

  def remove_question_mark(input)
    raise ArgumentError unless input[-1] == "?"
    input[0..-2]
  end

  def parse_beginning
    raise ArgumentError unless @question.start_with?("What is ")
    @question[8..-1]
  end

  def validate_question
    raise ArgumentError if @parsed_question =~ /[^0-9+\-*\/ ]/
  end
end

WordProblem.new("What is 8 plus 9?").answer
