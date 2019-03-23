#What are all the types of pokemon that a pokemon can have?
select name
from `pokemon`.types;

#What is the name of the pokemon with id 45?
select name
from pokemon.pokemons
where pokemons.id=45;

#How many pokemon are there?
SELECT COUNT(id)
FROM pokemons;

#How many types are there?
SELECT COUNT(id)
FROM types;

#How many pokemon have a secondary type?
SELECT COUNT(secondary_type)
FROM pokemons;

#What is each pokemon's primary type?
SELECT pokemons.primary_type
FROM pokemons
GROUP BY primary_type;

#What is Rufflet's secondary type?
SELECT secondary_type
from pokemon.pokemons
where pokemons.name='Rufflet';

#What are the names of the pokemon that belong to the trainer with trainerID 303?
SELECT pokemons.name
FROM pokemon.pokemon_trainer, pokemon.pokemons
WHERE pokemon_trainer.pokemon_id = pokemon.pokemons.id and  pokemon.pokemon_trainer.trainerID=303;

#How many pokemon have a secondary type Poison
SELECT COUNT(*)
FROM pokemons
INNER JOIN types ON secondary_type = types.id
WHERE types.name = 'Poison';

#What are all the primary types and how many pokemon have that type?
SELECT COUNT(pokemons.primary_type)
FROM pokemons
INNER JOIN types ON primary_type = types.id
GROUP BY types.id;

#How many pokemon at level 100 does each trainer with at least one level 100 pokemone have? (Hint: your query should not display a trainer
SELECT pokemon_trainer.trainerID, COUNT(pokelevel)
FROM pokemon_trainer
WHERE pokemon_trainer.pokelevel = '100'
GROUP BY pokemon_trainer.trainerID;

#How many pokemon only belong to one trainer and no other?
SELECT pokemon_id, COUNT(pokemon_id)
FROM pokemon_trainer
GROUP BY pokemon_id
HAVING COUNT(pokemon_id) = 1;

SELECT p.name AS "Pokemon Name", t.trainername AS "Trainer Name",
       my.pokelevel AS "Level", primary_type AS "Primary Type",
       secondary_type AS "Secondary Type"
FROM pokemon_trainer AS my
LEFT OUTER JOIN trainers AS t ON t.trainerID = my.trainerID
LEFT OUTER JOIN pokemons AS p ON pokemon_id = my.pokemon_id
LEFT OUTER JOIN types AS ty ON primary_type = ty.id
LEFT OUTER JOIN types AS sy ON secondary_type = sy.id
ORDER BY my.pokelevel ASC;




