require 'set'

class WordChainer

  attr_reader :dictionary

  def initialize(dictionary_file_name)
    @dictionary = Set.new
    File.readlines(dictionary_file_name).each do |word|
      @dictionary << word.chomp
    end
  end

  def adjacent_words(word)
    adjacents = Set.new
    @dictionary.each do |d_word|
      adjacents << d_word if adjacent?(word, d_word)
    end
    adjacents
  end


  def adjacent?(word, d_word)
    non_matches = 0

    word.chars.each_index do |i|
      non_matches += 1 if word[i] != d_word[i]
    end

    word.length == d_word.length && non_matches == 1
  end

  def run(start_word, target)
    @start_word = start_word
    @all_seen_words = {}
    @all_seen_words[start_word] = nil
    @current_words = Set.new
    @current_words << start_word

    until @current_words.empty?
      if @all_seen_words.keys.include?(target)
        return build_path(target)
      end
      @new_current_words = Set.new
      explore_current_words

      @current_words = @new_current_words
    end

  end

  def explore_current_words
    @current_words.each do |curr_word|
      adjacent_words(curr_word).each do |word|
        @new_current_words << word unless @all_seen_words.keys.include?(word)
        @all_seen_words[word] = curr_word unless @all_seen_words.keys.include?(word)
      end
    end
    @new_current_words.each do |new_current_word|
      puts "#{new_current_word} from: #{@all_seen_words[new_current_word]}"
    end
  end

  def build_path(target)
    path = []
    current_target = target
    until path.include?(@start_word)
      @all_seen_words.each do |child, parent|
        path << current_target if @all_seen_words[current_target] == parent
        current_target = parent
      end
    end

    path.reverse + [target]
  end

end

if __FILE__ == $PROGRAM_NAME
  chainer = WordChainer.new('dictionary.txt')
  puts chainer.run("feast", "foist")
end
