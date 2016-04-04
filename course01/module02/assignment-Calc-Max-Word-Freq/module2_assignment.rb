class LineAnalyzer
  attr_reader :highest_wf_count, :highest_wf_words, :content, :line_number

  def initialize(content, line_number)
    @content = content
    @line_number = line_number
    calculate_word_frequency()
  end

  def calculate_word_frequency()
    @words = Hash.new(0)
    @highest_wf_words = Array.new()

    @content.split().each { |word| @words[word.downcase] += 1 }

    @highest_wf_count = 0
    @words.each do |word, count| 
      if count > @highest_wf_count
        @highest_wf_count = count 
      end
    end

    @words.each do |word, count| 
      if count == @highest_wf_count
        @highest_wf_words << word.downcase
      end
    end
  end

end


class Solution
  attr_reader :analyzers, :highest_count_across_lines, :highest_count_words_across_lines

  def initialize
    @analyzers = Array.new
  end

  def analyze_file()
    line_number = 1
    File.foreach('test.txt') do |line|
      @analyzers << LineAnalyzer.new(line, line_number)
      line_number += 1
    end
  end

  def calculate_line_with_highest_frequency()
    
    @highest_count_across_lines = 0
    @highest_count_words_across_lines = Array.new

    @analyzers.each do |analyzer|
      if analyzer.highest_wf_count > @highest_count_across_lines
        @highest_count_across_lines = analyzer.highest_wf_count
      end
    end

    @analyzers.each do |analyzer|
      if analyzer.highest_wf_count == @highest_count_across_lines
        @highest_count_words_across_lines << analyzer
      end
    end
  end

  def print_highest_word_frequency_across_lines()
    puts "The following words have the highest frequency per line:"
    @analyzers.each do |analyzer|
      if @highest_count_across_lines == analyzer.highest_wf_count
        puts "#{analyzer.highest_wf_words} (appears in line \##{analyzer.line_number})"
      end
    end
  end

end
