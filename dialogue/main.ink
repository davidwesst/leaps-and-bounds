INCLUDE fuel.ink
INCLUDE testing.ink

VAR car_fuel = 0
VAR mechanic_skill = 0

LIST fuels = (gas), rocket, quantum

=== function reset_game ===
// reset variables
~ car_fuel = 0
~ mechanic_skill = 0
~ fuels += (gas, rocket, quantum)
