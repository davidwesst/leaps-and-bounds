=== car
{ test_mode > 0:
    DEBUG
    <> fuels = {fuels}
    <> skill = {mechanic_skill}
}
Your trusty car.
Well, trusty might be a strong word right now, but this is car is the gateway to your dream and so running or not, you're going to make this work.
- (top)
What would you like to do?
+ [Get into car] -> inside
+ [Check the trunk] -> trunk
+ { fuels ? (gas) } [Fill car with gas]
    ~ car_fuel = gas
    ~ fuels -= gas
    You empty the gas can into the fuel tank, as described by the owner's manual. 
    Your car now has fuel. -> top
+ { car_fuel } [Start the car] -> start_the_car
+ [Nothing]
- -> END

= inside
You take a seat and decide to...
+ [Open the Glovebox] -> glovebox
+ [Pop the Trunk] -> open_trunk
+ [Start the Car] -> start_the_car
+ [Get out]
- -> END

= glovebox
You look at the car's glovebox, also known as the glovie. 
Open the car's glovebox?
+ [Yes]
    You notice the manual to your vehicle is inside the glovebox. It's in pristine condition!
    Do you want to take a look though it? -> owners_manual
+ [No]
- -> END

= open_trunk
POP!
You hear the trunk open.
~ is_trunk_open = true
- -> END

= start_the_car
{
    - car_fuel == gas:
        -> epilogue.ending_C
    - else:
        You hear the engine turn, but without any fuel you're not going anyway.
}
-> END

=== owners_manual
+ [Yes]
    You spend some time going through the owner's manual for your car. 
    ...
    ..
    .
    WOW! It tell you literally everything you needed to know about the most basic care for your vehicle! 
    You feel like you're on your way to being a being the unverse's best mechanic.
    ~ mechanic_skill++
    { test_mode > 0:
        DEBUG: mechanic skill increased
    }
+ [No]
- -> END

=== trunk
{ 
    - is_trunk_open == false:
        One simply does not open a trunk without releasing the latch first.
        If only there was a way to release the latch.
    - else:
        You open the trunk and check inside and see...
        ...nothing (yet).
        You shut the trunk thuroughly disappointed. 
        ~ is_trunk_open = false
}
- -> END