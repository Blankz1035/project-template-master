// Describe your query
// Query 2 is quite interesting the way it works. It is described as , match candidates with relationships with constituencies (z) where z.Province
// of the the constituencies is ONLY Leinster, the number of seats in the constituencies is less than 4. I also set n.Gender to Male to just find the Males
// in Leinster who were older then 50 and were elected.
// I am then returning (n), showing the Candidates that fall in between this where clause appropriately.


MATCH
	(n:Candidate)-[Has_Con]-> (z:Constituency) where z.Province = "Leinster" and z.Seats<"4" and n.Gender = "Male" and n.Age > "50" and n.Elected = "Yes"
RETURN
	n;