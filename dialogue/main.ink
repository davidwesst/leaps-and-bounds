INCLUDE car.ink
INCLUDE epilogue.ink
INCLUDE gas.ink
INCLUDE testing.ink

// player
VAR mechanic_skill = 1

// car properties
VAR car_fuel = 0
VAR is_trunk_open = false
VAR is_hood_open = true

// item properties
VAR is_cooler_full = false
VAR is_cable_connected = false

// inventory
LIST fuels = (gas), rocket, quantum

LIST items = cooler, cables

// TODO: Use or remove the reset function
//reset_game()

=== function reset_game ===
// reset variables
~ car_fuel = 0
~ mechanic_skill = 0
~ fuels += (gas, rocket, quantum)