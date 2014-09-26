def zero_coords(entry, s_zone, s_end)

	sz_y = s_zone[:y] - entry[:y]
	sz_x = s_zone[:x] - entry[:x]

	ez_y = s_end[:y] - entry[:y]
	ez_x = s_end[:x] - entry[:x]

	{ 
		entry_point: { y: 0, x: 0},
		sz_boundary: { y: sz_y, x: sz_x},
		end_boundary: { y: ez_y, x: ez_x}
	}

end

def zero_1_coords(coord)

	x = coord[:x] - @entry[:x]
	y = coord[:y] - @entry[:y]

	{ y: (y).round(5), x: (x).round(5)}

end

def find_distance_between_coords(a,b)

	difs = {}
	difs[:y] = a[:y] - b[:y]
	difs[:x] = a[:x] - b[:x]


	c = Math.sqrt((difs[:y]*difs[:y]) + (difs[:x]*difs[:x]))

end

def find_paddle_time_between_points(a,b)

	per_second = 0.00000533

	distance = find_distance_between_coords(a,b)

	number_of_seconds = (distance / per_second).floor

end

def get_curve_array(no_of_points)

	point_increment = 1.0 / no_of_points
	points = []

	(1..no_of_points).each do |n|
		points << n * point_increment
	end

	points.map {|n| n * n }
end

def get_point_positions(no_of_points, distance)

	curve_array = get_curve_array(no_of_points)

	point_positions = []

	curve_array.each {|n| point_positions << n* distance}

	point_positions

end

def get_coords_between(a,b,seconds)

	difs = {}
	difs[:y] = a[:y] - b[:y]
	difs[:x] = a[:x] - b[:x]

	curve_array = get_curve_array(seconds)

	second_counter = 0
	coords_array = []
	curve_array.each do |curve_val|

		second_counter += 1

		x_val = ((curve_val * difs[:x]) + @entry[:x] ).round(5)
		y_val = ((curve_val * difs[:y]) + @entry[:y] ).round(5)

		coords_array.push( { :x => x_val , :y => y_val, :second => (second_counter + @session_counter)  } )
		
	end

	


	puts "------------------------------------------------------------------>"

	coords_array

end

def paddle_out()
	length = ((rand * 600) + 300).floor

	coords = get_coords_between(@current_location,@sz_boundary,length)

	@session_gps.push(*coords)

	puts "paddling out for #{length}s"
	@session_counter += length

	@current_location = zero_1_coords(coords.last)
end

def surf_wave()
	length = ((rand * 20) + 5).floor

	coords = get_coords_between(@current_location,@end_boundary,length)

	@session_gps.push(*coords)

	puts "surfing for #{length}s"
	@session_counter += length

	@current_location = zero_1_coords(coords.last)
end

def paddle_back()
	length = ((rand * 600) + 300).floor

	coords = get_coords_between(@current_location,@sz_boundary,length)	

	@session_gps.push(*coords)

	puts "paddling for #{length}s"
	@session_counter += length

	@current_location = zero_1_coords(coords.last)
end

def wait_for_wave()

	length = ((rand * 120) + 10).floor

	coords = get_coords_between(@current_location,@sz_boundary,length)

	@session_gps.push(*coords)

	puts "waiting for #{length}s"
	@session_counter += length

	@current_location = zero_1_coords(coords.last)
end

def end_surf()
	length = ((rand * 600) + 300).floor

	coords = get_coords_between(@current_location,@entry_point,length)

	@session_gps.push(*coords)

	puts "paddling back in for #{length}s"

	@current_location = zero_1_coords(coords.last)
end

def surf_session

	puts "session is #{@surf_session_length}s long"

	@current_location = {x: 0, y: 0}

	paddle_out()
																	puts @current_location
		while @session_counter < @surf_session_length
			wait_for_wave()
																	puts @current_location
			surf_wave()
																	puts @current_location
			paddle_back()
																	puts @current_location
		end
	end_surf()
																	puts @current_location;

end

	@session_gps = []

	@surf_session_length = ((rand * 3600) + 1800).floor
	@session_counter = 0

	@entry = { y: 50.414753, x: -5.102473 }
	@sz_bound = { y: 50.413837, x: -5.105597 }
	@end_bound = { y: 50.415471, x: -5.102851 }

	a = zero_coords(@entry, @sz_bound, @end_bound)

	@entry_point = a[:entry_point]
	@sz_boundary = a[:sz_boundary]
	@end_boundary = a[:end_boundary]


	# surf_session

	# puts @session_gps

	# puts zero_1_coords({y: 50.415471, x: -5.102851})

	# puts get_coords_between(@end_boundary,@sz_boundary,100)	


