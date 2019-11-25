INCLUDE bag.ink
INCLUDE car.ink
INCLUDE ditch.ink
INCLUDE epilogue.ink
INCLUDE gas-station.ink
INCLUDE testing.ink

// player
VAR mechanic_skill = 1

// inventory
LIST fuels = (gas), rocket, quantum
LIST items = cooler, cables

// car properties
VAR car_fuel = 0
VAR is_trunk_open = false
VAR is_hood_open = true

// item properties
VAR is_cooler_full = false

// TODO: Use or remove the reset function
//reset_game()

=== function reset_game ===
// reset variables
~ car_fuel = 0
~ mechanic_skill = 0
~ fuels += (gas, rocket, quantum)