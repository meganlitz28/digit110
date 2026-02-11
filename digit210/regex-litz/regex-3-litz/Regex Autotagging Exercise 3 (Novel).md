


> Written with [StackEdit](https://stackedit.io/).


> First, I looked for ...
                 Find: `&`
                 Replace: `&amp;`
                     
 > Then I tried to find the lines...

	 Find: ^(.+)$
     Replace: <line>\1</line>



> Then I tried to find the paragraphs...

	 Find: ^\n\n
     Replace: </p>\n<p>



> Then I tried to find the Chapters and to replace them...

	 Find: [IVXLCDM]+\.\s+(.*?)(?:</line>|$)
     Replace : <title>$1</title> 




> Then I tried to add the root...

	 Find: \A([\s\S]+)\z and turned on the dot match
     Replace: <novel>\1</novel>
