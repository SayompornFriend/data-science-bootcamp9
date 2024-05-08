--Join table movie,moviedirector,franchise,moviegenre
SELECT 
	m.Title,
	f.franchisename,
    g.Genre
    --d.DirectorName
    --t.ActorName
FROM movie m
LEFT JOIN franchise f on m.FranchiseID = f.FranchiseId
left join moviegenre g on m.MovieID = g.MovieGenreID
--LEFT join moviedirector d on m.MovieID = d.MovieID
--LEFT join topbilledcast t on m.MovieID = t.MovieID
;
