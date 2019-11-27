
/*
    Test Scaffolding
    
    To test script in Inky set test_mode to greater than 0 (i.e. test_mode = 1) and select knot and stitch to jump to (i.e. car)
*/
VAR test_mode = 1

=== function debug_showstate ===
{ test_mode > 0:
    (DEBUG)
    <> -- MECHANICAL SKILL: {mechanic_skill}
    <> -- ITEMS: {items}
    <> -- FUELS: {fuels}
    <> -- CAR STARTED: {is_car_started}
}