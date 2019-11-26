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
+ [Check the exterior]
        What will you check?
        ++ [Trunk] -> trunk
        ++ [Hood] -> hood
* { fuels ? (gas) } [Fill car with gas]
    ~ car_fuel = gas
    ~ fuels -= gas
    You empty the gas can into the fuel tank, as described by the owner's manual. 
    Your car now has fuel. -> top
+ { car_fuel } [Get In and Start Car] -> start_the_car
+ [Nothing]
- -> END

= inside
You take a seat and decide to...
+ [Open the Glovebox] -> glovebox
+ [Pop the Trunk] -> open_trunk
+ [Pop the Hood] -> open_hood
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

= open_hood
CLICK!
You hear the hood release and see it pop up through the windshield.
- -> END

= start_the_car
{   
    - car_fuel == gas:
        ~ is_car_started = true
        The car roars to life!
        {   is_cable_attached == true:
                Although you appear to have left the jumper cables attached to the ditch for whatever reason. 
                Maybe you should sort that out before you drive off.
                -> exit_car
            - else:
                Are you ready to go?
                * [Yes] -> epilogue.ending_C
                * [No] -> exit_car
        }
    - else:
        You hear the engine turn, but without any fuel you're not going anyway.
        -> exit_car
}

= exit_car
- -> END

=== owners_manual
+ [Yes]
    You spend some time going through the owner's manual for your car. 
    ...
    ..
    .
    WOW! It tell you literally everything you needed to know about the most basic care for your vehicle! 
    You feel like you're on your way to being a being the unverse's best mechanic.
    ~ mechanic_skill++
    ~ debug_showstate()
+ [No]
- -> END

=== trunk
{ 
    - is_trunk_open == false:
        One simply does not open a trunk without releasing the latch first.
        If only there was a way to release the latch. 
        -> END
    - else:
        You open the trunk and check inside and see a the broken handheld cooler that super cooled everything you ever put inside it to the point where it was mush.
        What a weird thing to keep.
        Take the broken cooler?
        + [Yes]
            ~ items += cooler
            ~ debug_showstate()
            You take the broken cooler and close the trunk now that it's empty.
            ~ is_trunk_open = false
            -> end_trunk
        + [No] -> end_trunk
} 
= end_trunk
- -> END

=== hood
{
    - is_hood_open == false:
        The hood appears to be firmly in place, which is probably a good thing when you're driving.
    - else:
        { 
            - mechanic_skill > 0:
                With your improved mechanical skills, you reach in and open the hidden latch of the hood and lift it open.
                Inside you see a battery bolted down and a set of jumper cables stored in case of an emergency.
                What will you do?
                + [Connect the jumper cables] -> connect_cables
                + [Leave everything alone] -> exit_hood
            - else:
                You see it's open, but cannot figure out how to open it for the life of you.
                If only these contraptions came with manuals...
                -> exit_hood
        }
            
}
= connect_cables
You connect the cables to the battery and hold onto the other end.
~ items += cables
~ debug_showstate()
-> exit_hood

= exit_hood
- -> END