#see if object can be converted to string
puts String.try_convert("str")
puts String.try_convert(44)

this_str = "Hello"
puts this_str
this_str << " world"
puts this_str
this_str + " world2"
puts this_str
this_str.concat(33) #33 is ascii value for !
puts this_str
this_str.concat("The End.")
puts this_str