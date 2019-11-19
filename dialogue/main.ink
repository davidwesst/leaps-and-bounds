INCLUDE fuel.ink

VAR car_fuel = 0
VAR mechanic_skill = 0

LIST fuels = (gas), rocket, quantum

=== function reset_game ===
// reset variables
~ car_fuel = 0
~ mechanic_skill = 0
~ fuels += (gas, rocket, quantum)

/*
    Test Scaffolding
    
    To test script in Inky set test_mode to greater than 0 (i.e. test_mode = 1) and select knot and stitch to jump to (i.e. car)
*/
VAR test_mode = 1
-> car
