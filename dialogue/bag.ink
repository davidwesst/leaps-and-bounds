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
            ~ fuels = (gas)
            ~ debug_showstate()
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