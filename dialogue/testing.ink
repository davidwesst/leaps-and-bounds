
/*
    Test Scaffolding
    
    To test script in Inky set test_mode to greater than 0 (i.e. test_mode = 1) and select knot and stitch to jump to (i.e. car)
*/
VAR test_mode = 1

~ items += (cables)
~ car_fuel = gas
~ is_cable_attached = false
~ mechanic_skill = 1000
-> car.start_the_car

=== function debug_showstate ===
{ test_mode > 0:
    (DEBUG)
    <> -- MECHANICAL SKILL: {mechanic_skill}
    <> -- ITEMS: {items}
    <> -- FUELS: {fuels}
}