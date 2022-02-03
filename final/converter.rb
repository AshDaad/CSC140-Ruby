require "tk"
require "tkextlib/tile"


root = TkRoot.new {title "Length converter"}
content = Tk::Tile::Frame.new(root){padding "50 15 50 15"}.grid


$input_variable = TkVariable.new
$output_variable = TkVariable.new
$unit = TkVariable.new
input_frame = Tk::Tile::Labelframe.new(content) {text 'Input'; borderwidth 5; relief "sunken"; width 300; height 200; padding "5 0 5 5"}
output_frame = Tk::Tile::Labelframe.new(content) {text 'Conversion'; borderwidth 5; relief "sunken"; width 300; height 200; padding "5 0 5 5"}
go_button = Tk::Tile::Button.new(content) {text 'Calculate'; command {func1}}
input_box = Tk::Tile::Entry.new(content) {width 10; textvariable $input_variable}
output_text = Tk::Tile::Label.new(content) {textvariable $output_variable; font TkFont.new('sans 12')}
underbutton_text = Tk::Tile::Label.new(content) {text 'is equivalent to'}
unit_label = Tk::Tile::Label.new(content) {textvariable $unit; font TkFont}


$input_dom = TkVariable.new
feet = Tk::Tile::RadioButton.new(input_frame){
	text 'Feet' 
	variable $input_dom 
	value 1
	pack('fill'=>'x')

}
meters = Tk::Tile::RadioButton.new(input_frame){
	text 'Meters'
	variable $input_dom
	value 2
	pack('fill'=>'x')
}
inches = Tk::Tile::RadioButton.new(input_frame){
	text 'Inches'
	variable $input_dom
	value 3
	pack('fill'=>'x')
}
centi = Tk::Tile::RadioButton.new(input_frame){
	text 'Centimeters'
	variable $input_dom
	value 4
	pack('fill'=>'x')
}
miles = Tk::Tile::RadioButton.new(input_frame){
	text 'Miles'
	variable $input_dom
	value 5
	pack('fill'=>'x')
}
kilometers = Tk::Tile::RadioButton.new(input_frame){
	text 'Kilometers'
	variable $input_dom
	value 6
	pack('fill'=>'x')
}



$output_dom = TkVariable.new
feet = Tk::Tile::RadioButton.new(output_frame){
	text 'Feet'
	variable $output_dom
	value 1
	pack('fill'=>'x')
}
meters = Tk::Tile::RadioButton.new(output_frame){
	text 'Meters' 
	variable $output_dom 
	value 2
	pack('fill'=>'x')
}
inches = Tk::Tile::RadioButton.new(output_frame){
	text 'Inches'
	variable $output_dom
	value 3
	pack('fill'=>'x')
}
centi = Tk::Tile::RadioButton.new(output_frame){

	text 'Centimeters'
	variable $output_dom
	value 4
	pack('fill'=>'x')
}
miles = Tk::Tile::RadioButton.new(output_frame){
	text 'Miles'
	variable $output_dom
	value 5
	pack('fill'=>'x')
}
kilometers = Tk::Tile::RadioButton.new(output_frame){
	text 'Kilometers'
	variable $output_dom
	value 6
	pack('fill'=>'x')
}



content.grid(:column => 0, :row => 0)
input_frame.grid(:column => 0, :row => 0, :columnspan => 5, :rowspan =>6)
output_frame.grid(:column => 9, :row => 0, :columnspan => 5, :rowspan =>6)
input_box.grid(:column => 0, :row => 7)
go_button.grid( :column => 7, :row => 7)
output_text.grid(:column => 9, :row => 7)
underbutton_text.grid( :column => 7, :row => 9)
unit_label.grid(:column => 10, :row => 7)



def func1
	calculate
	unit
end


def calculate
  begin
	if $input_dom == $output_dom
		$output_variable.value = $input_variable
		
	#Feet to ...
	elsif $input_dom == 1 && $output_dom == 2
		$output_variable.value = (($input_variable/3.2808)*10000000.0).round()/10000000.0
	elsif $input_dom == 1 && $output_dom == 3
		$output_variable.value = (($input_variable*12.000)*10000000.0).round()/10000000.0
	elsif $input_dom == 1 && $output_dom == 4
		$output_variable.value = (($input_variable/0.032808)*10000000.0).round()/10000000.0
	elsif $input_dom == 1 && $output_dom == 5
		$output_variable.value = (($input_variable/0.00018939)*10000000.0).round()/10000000.0
	elsif $input_dom == 1 && $output_dom == 6
		$output_variable.value = (($input_variable/3280.8)*10000000.0).round()/10000000.0
		
	#Meters to ...
	elsif $input_dom == 2 && $output_dom == 1
		$output_variable.value = (($input_variable*3.2808)*10000000.0).round()/10000000.0
	elsif $input_dom == 2 && $output_dom == 3
		$output_variable.value = (($input_variable*39.370)*10000000.0).round()/10000000.0
	elsif $input_dom == 2 && $output_dom == 4
		$output_variable.value = (($input_variable/0.010000)*10000000.0).round()/10000000.0
	elsif $input_dom == 2 && $output_dom == 5
		$output_variable.value = (($input_variable*0.00062137)*10000000.0).round()/10000000.0
	elsif $input_dom == 2 && $output_dom == 6
		$output_variable.value = (($input_variable/1000.000)*10000000.0).round()/10000000.0
		
	#Inches to ...
	elsif $input_dom == 3 && $output_dom == 1
		$output_variable.value = (($input_variable*0.083333)*10000000.0).round()/10000000.0
	elsif $input_dom == 3 && $output_dom == 2
		$output_variable.value = (($input_variable/39.370)*10000000.0).round()/10000000.0
	elsif $input_dom == 3 && $output_dom == 4
		$output_variable.value = (($input_variable/0.39370)*10000000.0).round()/10000000.0
	elsif $input_dom == 3 && $output_dom == 5
		$output_variable.value = (($input_variable*0.0000157828281218333)*10000000.0).round()/10000000.0
	elsif $input_dom == 3 && $output_dom == 6
		$output_variable.value = (($input_variable/39370.0)*10000000.0).round()/10000000.0
	
	#Centimeters to ...
	elsif $input_dom == 4 && $output_dom == 1
		$output_variable.value = (($input_variable*0.032808)*10000000.0).round()/10000000.0
	elsif $input_dom == 4 && $output_dom == 2
		$output_variable.value = (($input_variable/100.000)*10000000.0).round()/10000000.0
	elsif $input_dom == 4 && $output_dom == 3
		$output_variable.value = (($input_variable*0.39370)*10000000.0).round()/10000000.0
	elsif $input_dom == 4 && $output_dom == 5
		$output_variable.value = (($input_variable*0.0000062137119)*10000000.0).round()/10000000.0
	elsif $input_dom == 4 && $output_dom == 6
		$output_variable.value = (($input_variable/100000.000)*10000000.0).round()/10000000.0
		
	#miles to...
	elsif $input_dom == 5 && $output_dom == 1
		$output_variable.value = (($input_variable*5280.0)*10000000.0).round()/10000000.0
	elsif $input_dom == 5 && $output_dom == 2
		$output_variable.value = (($input_variable/0.00062137)*10000000.0).round()/10000000.0
	elsif $input_dom == 5 && $output_dom == 3
		$output_variable.value = (($input_variable*63360.000)*10000000.0).round()/10000000.0
	elsif $input_dom == 5 && $output_dom == 4
		$output_variable.value = (($input_variable/0.0000062137119)*10000000.0).round()/10000000.0
	elsif $input_dom == 5 && $output_dom == 6
		$output_variable.value = (($input_variable/0.62137)*10000000.0).round()/10000000.0
	
	#kilometers to...
	elsif $input_dom == 6 && $output_dom == 1
		$output_variable.value = (($input_variable*3280.8)*10000000.0).round()/10000000.0
	elsif $input_dom == 6 && $output_dom == 2
		$output_variable.value = (($input_variable/0.0010000)*10000000.0).round()/10000000.0
	elsif $input_dom == 6 && $output_dom == 3
		$output_variable.value = (($input_variable*39370.000)*10000000.0).round()/10000000.0
	elsif $input_dom == 6 && $output_dom == 4
		$output_variable.value = (($input_variable/0.00001)*10000000.0).round()/10000000.0
	elsif $input_dom == 6 && $output_dom == 5
		$output_variable.value = (($input_variable*0.62137)*10000000.0).round()/10000000.0
	end
	
  rescue
     $output_variable.value = ''
  end
end

def unit()
	begin
		if $output_dom == 1
			$unit.value = 'ft'
		elsif $output_dom == 2
			$unit.value = 'm'
		elsif $output_dom == 3
			$unit.value = 'in'
		elsif $output_dom == 4
			$unit.value = 'cm'
		elsif $output_dom == 5
			$unit.value = 'mi'
		elsif $output_dom == 6
			$unit.value = 'km'
		end
	rescue
     $unit.value = ''
	end
	# puts $unit
end


Tk.mainloop