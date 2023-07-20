class Question
  attr_reader :prompt, :answers

  def initialize(prompt, answers)
    @prompt = prompt
    @answers = answers
  end

  def display
    puts @prompt
    @answers.each_with_index { |answer, index| puts "#{index + 1}. #{answer}" }
  end

  def correct_answer?(response)
    response = response.to_s.strip.downcase

    correct_answer = @answers.find { |answer| answer.downcase == response }
    return true if correct_answer

    false
  end
end

class QuizGame
  def initialize(questions)
    @questions = questions
    @score = 0
    @total_questions = 10
  end

  def start
    puts "Welcome to the Quiz Game!"
    puts "Answer the following questions with word responses, case does not matter. Spelling errors will be observed as incorrect:\n\n"

    # Randomly select 10 random questions
    selected_questions = @questions.shuffle.take(@total_questions)

    selected_questions.each do |question|
      question.display
      response = gets.chomp

      if question.correct_answer?(response)
        puts "Correct!\n\n"
        @score += 1
      else
        puts "Incorrect!\n\n"
      end
    end

    finish
  end

  def finish
    puts "Quiz finished!"
    puts "Your final score is: #{@score}/#{@total_questions}"
  end
end

# Question pool
questions = [
  Question.new("What is the capital of France?", ["Paris", "London", "Berlin"]),
  Question.new("Which planet is known as the 'Red Planet'?", ["Mars", "Venus", "Jupiter"]),
  Question.new("What is 5 + 3?", ["7", "8", "9"]),
  Question.new("Which country is known as the Land of the Rising Sun?", ["Japan", "China", "South Korea"]),
  Question.new("What is the largest continent on Earth?", ["Asia", "Europe", "Africa"]),
  Question.new("Which river is the longest in the world?", ["Nile", "Amazon", "Yangtze"]),
  Question.new("Which city is famous for its canals and gondolas?", ["Venice", "Amsterdam", "Bruges"]),
  Question.new("What is the currency of Brazil?", ["Real", "Peso", "Dollar"]),
  Question.new("Which desert is the largest hot desert in the world?", ["Sahara", "Arabian", "Gobi"]),
  Question.new("Which mountain range stretches along the border between Europe and Asia?", ["Ural", "Alps", "Andes"]),
  Question.new("Which famous structure in India is a mausoleum built by Shah Jahan?", ["Taj Mahal", "Great Wall", "Eiffel Tower"]),
  Question.new("What is the largest island in the Mediterranean Sea?", ["Sicily", "Cyprus", "Sardinia"]),
  Question.new("Which African country is known as the 'Rainbow Nation'?", ["South Africa", "Nigeria", "Kenya"]),
  Question.new("Which Australian city is famous for its opera house and harbor bridge?", ["Sydney", "Melbourne", "Brisbane"]),
  Question.new("What is the largest lake in Africa?", ["Victoria", "Tanganyika", "Malawi"]),
  Question.new("Which country is known as the Land of Fire and Ice?", ["Iceland", "Greenland", "Norway"]),
  Question.new("Which famous landmark in Egypt is a pyramid?", ["Pyramids of Giza", "Sphinx", "Luxor Temple"]),
  Question.new("What is the national flower of Japan?", ["Cherry Blossom", "Lotus", "Rose"])
]

# Game initialization
quiz_game = QuizGame.new(questions)
quiz_game.start
