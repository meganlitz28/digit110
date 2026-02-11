

> First, I looked for ...
                 Find: `&`
                 Replace: `&amp;`
                     
 > Then I tried to find the groups...

	 Find: ([^\n]+(\n[^\n]+)*)
     Replace: <sp>\n$1\n</sp>


> Then I tried to add the root...

	 Find: \A([\s\S]+)\z and turned on the dot match
     Replace: <play>\1</play>