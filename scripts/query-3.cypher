// Describe your query
// Simple interesting query that searches all candidates who reside in the constituency of Wicklow, age is either 50 or less and Female.
// I also added in elected to show the result in the constituency for the election making it quite interesting and easy to find out information.



MATCH
	(n:Candidate {Constituency: "Wicklow"}) where n.Age <= "50" and n.Gender="Female" and n.Elected = "No"  

RETURN
	n;