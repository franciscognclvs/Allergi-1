class Something
	@a=10
	def test
		puts @a
	end
end

obj = Something.new
obj.test

p obj
p@a