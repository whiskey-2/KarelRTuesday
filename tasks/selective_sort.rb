require 'byebug'

arr = []

9000.times do 
	arr << rand(1..100)
end

debut = Time.now

ii = 0
j = 1
tmp = 0

len = arr.length

while ii < len - 1
	j = ii + 1
	plus_petit = ii
	while j < (len)
		if arr[plus_petit] < arr[j]
			plus_petit = j
		end
		j = j + 1
	end		
	tmp = arr[ii]
	arr[ii] = arr[plus_petit]
	arr[plus_petit] = tmp

	ii = ii + 1
end

fin = Time.now
diff = fin - debut
puts diff
