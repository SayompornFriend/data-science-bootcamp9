Table movie {
  movieID id pk
  title text
  lifetime_gross int
  year year
  studio text
  rating numeric
  runtime int
  budget int
  release_date date
  vote_avg numeric
  vote_count int
  franchise_ID id 
}

Table topbillcast{
  moviecastID id pk
  movieID id
  actor_name text
}

Table moviedirector{
  moviedirectorID id pk
  director_name text
  movieID id
}

Table moviegenre {
  moviegenreID id pk
  movieID id 
  genre text
}

Table franchise {
  franchiseID id pk
  franchiseName  text
  yearBegan year
  creator text
}

Ref: "movie"."movieID" < "topbillcast"."movieID"
Ref: "movie"."movieID" < "moviedirector"."movieID"
Ref: "movie"."movieID" < "moviegenre"."movieID"
Ref: "franchise"."franchiseID" < "movie"."franchise_ID"  
