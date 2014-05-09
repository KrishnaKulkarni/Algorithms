Algorithms
==========

I find analyzing and constructing algorithms to be one of the most fun and captivating aspects of programming. 
This repo is a sample that highlights work I've done before with algorithms, a collection of algorithms I 
programmed that were fun, interesting, or clever.

Stockpicker
-----------
I'm especially proud of and attached to the work in Stockpicker. The stockpicker problem is as follows: given an array of numbers representing the daily prices of a hypothetical stock, determine a buy date and sell date (i.e. arrays indices i and j with i < j) to maximize your profit from you purchase and sale of the stock. 

A naive algorithm that simply compares each of the possible date pairings iteratively produces a solution that is O(n^2) in time. The algorithm I came up (described in more depth in a text file in the folder) uses a less straightforward method of transforming the data and then systematically chopping it down to solve the problem in O(n) time.

Recursive Exercises
------------------
The folder Recursive Exercises contains several exercises recreating classic recursive algorithms including:
- computing fibonacci numbers
- computing exponentials
- Mergesort
- generating a comprehensive list of subsets, given a set
- Making change optimally given a coin set and amount to me made change of

Recursion is clearly a pretty neat technique for solving problems, and one for which I hope to continually hone my skills.

Other Folders
------------
There are also other folders on solving problems using blocks & procs and solving an interesting graph search problem of finding "word chains" -- (paths that connect words such that each step in the path alters just one letter in the word (e.g. word --> ward --> bard --> barn)). Those folders are up for revision.
