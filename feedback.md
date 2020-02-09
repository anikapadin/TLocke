## Jan 20
Clear and concise code with sufficient comments - looks great. One thing that needs changing now is how you output the results when `T` is an array - something to thing about.

## Jan 26
I can't run your problem 3 program, did you forget to include somethihg?

## Feb 2
Problem 3 checks out now that you have included the data file, however, then you went and committed the exact same error in problem 4! Remember these programs we're writing should run assuming nothing in the working memory of the computer. Likewise with 4a, you loaded the data, but that particular path on line 1 will only work on your computer.

## Feb 9
Problem 4 checks out, but there seems to be a undefined variable in your problem4a, make sure that you are clearing your workspace before running this program. The program may be running because some other variable `names` was left behind by `problem4.m`. The graphs from the climate program are looking good. Just some advice, though, `textscan` is a very micromanaging-y way of importing files - there are easier ways that don't resort to "hard coding" (such as in line 8 of `climate.m`, you needed to know how many lines were in the file, but what if I wanted the same file to process more of the same data? your program would fail).
