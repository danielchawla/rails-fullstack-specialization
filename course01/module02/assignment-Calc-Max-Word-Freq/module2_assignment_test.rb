require 'test/unit'
require_relative 'module2_assignment'

class LineAnalyzerTest < Test::Unit::TestCase

	def setup
		@line_analyzer = LineAnalyzer.new("hello hello there you you you", 3)
	end

	def test_calculate_max
		assert_equal 3, @line_analyzer.highest_wf_count
	end

	def test_calculate_word
		assert_equal ["you"], @line_analyzer.highest_wf_words
	end

end

class SolutionTest < Test::Unit::TestCase

	def setup
		@solution = Solution.new
	end

	def test_analyze_file()
		assert_equal 0, @solution.analyzers.length
		@solution.analyze_file 
		assert_equal 3, @solution.analyzers.length
		@solution.calculate_line_with_highest_frequency
		@solution.print_highest_word_frequency_across_lines
	end


end

