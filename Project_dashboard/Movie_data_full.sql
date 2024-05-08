--Join table movie,moviedirector,franchise,moviegenre
SELECT 
	m.Title,
    m.Lifetime_Gross,
    m.Year,
    m.Studio,
    m.Rating,
    m.Runtime,
    m.Budget,
    m.VoteAvg,
    m.VoteCount,
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
