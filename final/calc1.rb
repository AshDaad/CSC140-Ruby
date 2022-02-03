require "tk"
require "tkextlib/tile"


root = TkRoot.new {title "Length converter"}
content = Tk::Tile::Frame.new(root){padding "50 15 50 15"}.grid


$input_variable = TkVariable.new
$output_variable = TkVariable.new
input_frame = Tk::Tile::Labelframe.new(content) {text 'Input'; borderwidth 5; relief "sunken"; width 300; height 200; padding "5 0 5 5"}
output_frame = Tk::Tile::Labelframe.new(content) {text 'Conversion'; borderwidth 5; relief "sunken"; width 300; height 200; padding "5 0 5 5"}
go_button = Tk::Tile::Button.new(content) {text 'Calculate'; command {calculate}}
input_box = Tk::Tile::Entry.new(content) {width 10; textvariable $input_variable}
output_text = Tk::Tile::Label.new(content) {textvariable $output_variable}
Tk::Tile::Label.new(content) {text 'is equivalent to'}.grid( :column => 7, :row => 9)

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


content.grid(:column => 0, :row => 0)
input_frame.grid(:column => 0, :row => 0, :columnspan => 5, :rowspan =>6)
output_frame.grid(:column => 9, :row => 0, :columnspan => 5, :rowspan =>6)
input_box.grid(:column => 0, :row => 7)
go_button.grid( :column => 7, :row => 7)
output_text.grid(:column => 9, :row => 7)

def calculate
  begin
	if $input_dom == $output_dom
		$output_variable.value = $input_variable
		
	#Feet to ...
	elsif $input_dom == 1 && $output_dom == 2
		$output_variable.value = (($input_variable/3.2808)*10000.0).round()/10000.0
	elsif $input_dom == 1 && $output_dom == 3
		$output_variable.value = (($input_variable*12.000)*10000.0).round()/10000.0
	elsif $input_dom == 1 && $output_dom == 4
		$output_variable.value = (($input_variable/0.032808)*10000.0).round()/10000.0
		
	#Meters to ...
	elsif $input_dom == 2 && $output_dom == 1
		$output_variable.value = (($input_variable*3.2808)*10000.0).round()/10000.0
	elsif $input_dom == 2 && $output_dom == 3
		$output_variable.value = (($input_variable*39.370)*10000.0).round()/10000.0
	elsif $input_dom == 2 && $output_dom == 4
		$output_variable.value = (($input_variable/0.010000)*10000.0).round()/10000.0
		
	#Inches to ...
	elsif $input_dom == 3 && $output_dom == 1
		$output_variable.value = (($input_variable*0.083333)*10000.0).round()/10000.0
	elsif $input_dom == 3 && $output_dom == 2
		$output_variable.value = (($input_variable/39.370)*10000.0).round()/10000.0
	elsif $input_dom == 3 && $output_dom == 4
		$output_variable.value = (($input_variable/0.39370)*10000.0).round()/10000.0
	
	#Centimeters to ...
	elsif $input_dom == 4 && $output_dom == 1
		$output_variable.value = (($input_variable*0.032808)*10000.0).round()/10000.0
	elsif $input_dom == 4 && $output_dom == 2
		$output_variable.value = (($input_variable/100.00)*10000.0).round()/10000.0
	elsif $input_dom == 4 && $output_dom == 3
		$output_variable.value = (($input_variable*0.39370)*10000.0).round()/10000.0
	end
	
  rescue
     $output_variable.value = ''
  end
end

Tk.mainloop