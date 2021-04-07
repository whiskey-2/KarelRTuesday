
@matrice = [5, 6, 2, 66, 5, 22, 6, 7, 8, 25, 72, 77777, 1]

def last #dernier terms
	@matrice = @matrice.sort
	@matrice = @matrice.last
end

def last_easy #dernier terme mais plus facile
	@matrice = @matrice.max
end

def length #longuer de la matrice
	@matrice = @matrice.length
end

def mean #moyenne de la matrice 
	x = @matrice.length
	y = @matrice.sum
	mean = y / x
end

puts(last)
puts(length)
puts(mean)