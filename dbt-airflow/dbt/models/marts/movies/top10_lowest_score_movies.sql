select 
  m.movie_id,
  movie_name,
  release_date, 
  revenue,
  status,
  vote_average,
  vote_count,
  weighted_rating as score
from 
  {{ ref("stg_movies") }} m
join 
  {{ ref("imdb_weighted_rating") }}
using (movie_id)
order by score 
limit 10