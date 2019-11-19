=== bag
It's a bag.
Do you look inside?
+ [Yes]
    { 
        - mechanic_skill > 0:
            { 
                - bag > 1:
                    You recognize that the weird looking canister is a gas can full of gasoline!
                - else:
                    You see what is clearly a gas can and it's full of gas.
            }
            ~ fuels = gas
            How convienient!
        - else:
            You see a weird canister that contains a strong smelling liquid that smells a lot like the gas stations you have visited previously.
            Alas, you don't know what you don't know and you close the bag.
            If you're going to be the universe's greatest mechanic, I wonder if there is a way to increase your skills...
    }
+ [No]
    Really? Wow. 
    Okay, sure. 
    You DON'T look inside because that makes sense.
    
- -> END

=== car
Your trusty car.
Well, trusty might be a strong word right now, but this is car is the gateway to your dream and so running or not, you're going to make this work.
- (top)
What would you like to do?
+ [Look Inside] -> inside_car
+ { fuels == gas } [Fill car with gas]
    ~ car_fuel = gas
    ~ fuels -= gas
    You empty the gas can into the fuel tank, as described by the owner's manual. 
    Your car now has fuel. -> top
+ { car_fuel } [Start the car] -> start_the_car
+ [Nothing]

- -> END

=== inside_car
You get into the car and look around.
Where would you like to look?
+ [Glovebox] -> glovebox
- -> END

= glovebox
You look at the car's glovebox, also known as the glovie. 
Open the car's glovebox?
+ [Yes]
    You notice the manual to your vehicle is inside the glovebox. It's in pristine condition!
    Do you want to take a look though it? -> owners_manual
+ [No]

- -> DONE

= owners_manual
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

=== start_the_car
You start the car and continue your journey on the highway.
-> END