=== ditch
It's a ditch used for drainage.
The water is pretty high and there appears to be a metal post standing upright in the water.
-> exit_ditch

= post
It's thin metal post that seems to be standing upright in the water.
{
    - mechanic_skill >= 1000:
        It reminds you of the experiments you did with the electrolysis of water to generate oxygen gas, which if liquified can act as an oxidizer for rocket fuel.
        What would you like to do:
        + { items ? cables } Attach the cables -> attach_cable
        + [Nothing] -> exit_ditch
    - else:
        It reminds you of...
        ...nothing. It's on the tip of your brain, but you can't think of it.
        If only you could find something to jog your memory.
        -> exit_ditch
}

= attach_cable
~ is_cable_attached = true
~ items -= cables
You attach the cable to the post in the water.
Good thing the cable isn't carrying current, or else that could have been dangerous!
-> exit_ditch

= exit_ditch
-> END