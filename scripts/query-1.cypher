// Describe your query
// Query 1 is quite interesting the way it works. It is described as , match candidates with relationships with constituencies (z) where only
// female candidates are shown,  only females who were elected and the number of seats in the constituencies is equal to 3.
// I am then returning (z), showing the constituencies that fall in between this where clause appropriately.


MATCH
	(n:Candidate)-[Has_Con]-> (z:Constituency) where n.Gender= "Female" and n.Elected = "Yes" and z.Seats = "3" 
RETURN
	z;