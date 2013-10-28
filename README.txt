Submission for Molecule Software Test

To Run:
To run test suite type: rake
coverage report included in coverage/index.html

To run the program type: rake run

Originally I planned to do the test in ruby on rails but due to time constraints and school schedule I settled on accomplishing the test in Ruby.

After reading through the test description I realized that the core of application was the Mark-to-Market formula. 

I began with the file mtm_spec.rb and built the tests for the core of the application and then wrote the corresponding code to make the tests pass in mtm.rb file.

Breakdown of the files:

read_csv.rb
Processes the csv trades and the price curve csv's and returns them in a hash with id being the key for trades and month/year being the key for the price curves. Also after reading the test description I came to the conclusion that the only relevant information for the price curves was the month/year and the settle price.

mtm.rb
This contains the equation broken down into it's respective parts: subtraction, multiplication, and the summation of all the values.

calulate.rb
Runs through the hashes that are generated to communicate with mtm.rb to calculate the mark-to-market values for the trade portfolio.

display.rb
Various display functions that print to the console.

driver.rb
Contains the code to start and run through the program and iterate through the trade portfolio.



*Note*
Since the trade portfolio has many columns, it is best run in a maximized console window.


