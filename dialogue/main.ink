INCLUDE testing.ink
INCLUDE car.ink
INCLUDE gas.ink
INCLUDE epilogue.ink


// player
VAR mechanic_skill = 0

// car properties
VAR car_fuel = 0
VAR is_trunk_open = false

// inventory
LIST fuels = (gas), rocket, quantum

//reset_game()

=== function reset_game ===
// reset variables
~ car_fuel = 0
~ mechanic_skill = 0
~ fuels += (gas, rocket, quantum)
