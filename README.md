# Irish Constituencies Neo4j Database
###### Andy Blankley, G00313312

## Introduction
For my Neo4j project I have to design a neo4j graph database for the constituencies in the Republic of Ireland, the candidates that ran in those constituencies and create a relationship between them.

## Database
I started my project by researching some information about the constituencies in the republic of Ireland.
Next I begin creating the 40 constituencies using Cypher language and a text file which later would be imported into Neofj. 
The line below is an example of how I created a single node(constituency) with labels and properties in order to make it unique.
```
CREATE (n22:Constituency  {name:"Kerry", Province: "Munster", Population: "145,502", Seats: "5"})
```
The next step was creating all the candidates who ran in each constituency in the database. 500+ were created!
```
CREATE(:Candidate { name: "Michael Healy-Rae", Age: "48" , Gender: "Male", Party: "Independent", Elected: "Yes"	, Constituency: "Kerry" })
```
Once the candidates and constituencies were created, I then undertook the task of establishing the relationships between candidate - constituency.

In the example below I took the constituency property from where a candidate is located and the name of a constituency and made the relationship between them.The relationship will work for all other candidates in that constituency as long as their constituency name is the same.
```
MATCH (n:Candidate {Constituency: "Kerry"}), (z:Constituency{name: "Kerry"}) Create (n)-[r:Has_Con]->(z) return n,z,r
```


## Queries
1.Find Constituencies that has 3 seats and females elected.
2.Find elected male candidates over 50 in constituencies in Leinster with less then 4 seats.
3.Find non-elected female candidates younger then 50 in Wicklow.

#### Query One
Retrieves Constituencies that has 3 seats and females elected.
```cypher
MATCH
	(n:Candidate)-[Has_Con]-> (z:Constituency)
WHERE n.Gender= "Female" 
AND n.Elected = "Yes" 
AND z.Seats = "3" 
RETURN
	z;
```

#### Query Two
Retrieves elected male candidates over 50 in constituencies in Leinster with less then 4 seats.
```cypher
MATCH
	(n:Candidate)-[Has_Con]-> (z:Constituency)
	
WHERE z.Province = "Leinster"
AND z.Seats<"4" 
AND n.Gender = "Male" 
AND n.Age > "50" 
AND n.Elected = "Yes"
RETURN
	n;
```

#### Query Three
Find non-elected female candidates younger then 50 in Wicklow.
```cypher
MATCH
	(n:Candidate {Constituency: "Wicklow"}) 
WHERE n.Age <= "50" 
AND n.Gender="Female" 
AND n.Elected = "No"  
RETURN
	n;
```

## References
1. [Neo4J website](http://neo4j.com/), the website of the Neo4j database.

2.[Wikipedia website - Irish Constituencies](https://en.wikipedia.org/wiki/Parliamentary_constituencies_in_the_Republic_of_Ireland), Parliamentary constituencies in the Republic of Ireland.

3.[TheJournal website - Candidates](http://www.thejournal.ie/election-2016/constituency/), the website with information on all the candidates running.

4.[Youtube website](https://www.youtube.com/watch?v=LTdOgvpsR3c), tutorial for importing cypher queries.

5.I discussed idea's on queries with the following students: Shane Gleeson