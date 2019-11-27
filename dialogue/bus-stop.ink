=== newsstand
The abandoned newstand has some old local newspapers in it.
Take a look?
+ [Yes] -> newspaper
+ [No] -> END

= newspaper
{
    - mechanic_skill > 0:
        You look through the the newsletter and see the write up entitled: Local Chemist wins top prize for rocket fuel at local science fair.
        ...
        ..
        .
        WAIT A SECOND. Fuel is a car thing AND fuel is a chemistry thing????
        You remember your Ph.D. in chemistry education and apply it to your current mechanical skill set!
        ~ mechanic_skill = 1000
    - else:
        ...
        No point.
        hey would just get you remembering your past, which is likely not applicable to the current situation.
        Or could it?
}

- -> END
