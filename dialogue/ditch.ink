=== ditch
It's a ditch used for drainage.
The water is pretty high and there appears to be a metal post standing upright in the water.
-> exit_ditch

= post
{
    - is_cable_attached == true && is_car_started == true:
        It's the fully submerged post, with what appears to be creating bubbles.
        I wonder what those bubbles are all about? I wonder if you can catch some.
    - is_cable_attached == true:
        It's that fully submerged post to which you attached one end of a jumper
    - else:
        It's a fully submerged thin metal post that seems to be standing upright in the water
}
{
    - mechanic_skill >= 1000:
        It reminds you of the experiments you did with the electrolysis of water to generate oxygen gas, which if liquified can act as an oxidizer for rocket fuel.
        What would you like to do:
        + { items ? cables } { is_cable_attached == false } [Attach the cables] -> attach_cable
        + { is_cable_attached == true } { is_car_started == true } [Capture the gas bubbles] -> catch_bubbles
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

= catch_bubbles
{
    - items ? cooler:
        You grab the cooler you got from the trunk and hold it above the rising bubbles, which must be oxygen.
        Once satisfied, you shut the container only to hear it's familiar broken "bzzzzz" noice of it freezing everything inside of it.
        ...or maybe in this case, it just cooled it.
        Holding it up to your ear, you hear the familiar sound of sloshing!
        You have successfully liquified oxygen!
        ~ fuels += oxygen
        ~ debug_showstate()
    - else:
        You walk up to the bubbles and waft them towards you.
        Although you can't describe what you're smelling, it's definitely something different than regular air.
        Something cleaner and more refreshing.
}
-> exit_ditch

= exit_ditch
-> END