## Jan 20
Clear and concise code with sufficient comments - looks great. One thing that needs changing now is how you output the results when `T` is an array - something to thing about.

## Jan 26
I can't run your problem 3 program, did you forget to include somethihg?

## Feb 2
Problem 3 checks out now that you have included the data file, however, then you went and committed the exact same error in problem 4! Remember these programs we're writing should run assuming nothing in the working memory of the computer. Likewise with 4a, you loaded the data, but that particular path on line 1 will only work on your computer.

## Feb 9
Problem 4 checks out, but there seems to be a undefined variable in your problem4a, make sure that you are clearing your workspace before running this program. The program may be running because some other variable `names` was left behind by `problem4.m`. The graphs from the climate program are looking good. Just some advice, though, `textscan` is a very micromanaging-y way of importing files - there are easier ways that don't resort to "hard coding" (such as in line 8 of `climate.m`, you needed to know how many lines were in the file, but what if I wanted the same file to process more of the same data? your program would fail).

## Feb 17
It looks like you updated problem 2 this week, specifically with the units. Right now, I can't get your program to work, I think you're trying to do too much with the string you take in a `T`. I would take a long look at what `T` is, what datatype? And proceed from there.

## Feb 24
2b is works, but something very strange is going on - can you confirm this (it may be my machine, but I don't think so) - you run the program multiple times, it doesn't take new inputs - it just spits out the same results. Am I crazy?
You have the barest of starts with projectile and problem 6 looks good, now don't forget that lesson!

## Update
4a should be fixed and problem 5/projectile is more complete.  I think I bit off a bit more than I can chew trying to accept multiple inputs on 2b. 

## Mar 8
Okay, 4a looks good, gives the correct results. Problem 5 is more complete, but has a syntax error on line 21 - it has to do with the meaning of `!` in MATLAB. I don't see anything else that should prevent the program from running correctly beyond that. 
The encoded program that you have seems good, you decode the secret message, exactly.

## Mar 8 Update
Fixed that syntax error in projectile.  
## Mar 16
Yes, you did and as expected, it runs just fine. I would suggest that you suppress all the output coming form this function that appears in the command window.
However, I don't see any project summary from you, are you in a group?

## Update
Not sure why my summary didn't get through.  I copied it into a word document and pushed it with this.  Let me know if you're still having issues.
I also finished 6a, 7a, and the first project so I believe I am all caught up on outstading work at the moment.

## Mar 24 
I don't know why I missed it, but this sounds like a great project that will continue beyond this semester. With the shutdown, will you still be able to make headway on this project? I hope the simulations are still doable - if you don't produce the results that you were hoping, you can always focus on the program itself and explaining how it works/what you've learned about it.
Problem 6a looks good, the only comment is to make sure that you include comments, such as "this function takes angles in radians", so that you know if you ever come back to this function that it does. 7a looks good too. Very nice and concise code used to write to the excel sheet. 
Your ptable is a thing a beauty, I think the only suggestion I have is you might want to set varargin{k} to a less annoying more descriptive variable at the beginning, but that is fairly nitpicky. And you went the extra mile with the stability functionality.
## Mar 30
I think you're all caught up so I didn't see anything new.
