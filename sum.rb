class VovaBilan
	def sum(a, b)
  		puts "#{a} + #{b} = #{a+b}"
	  	a + b
	end

	def b(b)
		return b*2
		"instance method"
	end

	class << self
		def b
			"method of class"
		end

		def sum(a, b)
  			puts "#{a} - #{b} = #{a-b}"
	  		a - b
		end
	end

	def self.name
		"VBilan"
	end
		
end
