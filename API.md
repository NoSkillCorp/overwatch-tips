#Overwatch Tips API

##Tips

Here is an example of json of a tip :
```javascript
{
    "id": 12,
    "category": "as",
    "gaming_object_type": "Character",
    "gaming_object_id": 1,
    "playing_sentence": "Playing as Bastion",
    "score":11,
    "positive_score":13,
    "negative_score":2,
    "description": "It's really useful to not die in order to kill people",
    "created_at": "2016-05-06T16:08:04.334Z"
}
```

You can ask for a random positive tip here :
> http://www.overwatch-tips.com/api/v1/tips/random

## Characters

Here is an example of json of a character :
```javascript
{
    "id":127,
    "type":"Character",
    "name":"Bastion",
    "slug":"bastion",
    "description":"Bip bip bop bowi bip !",
    "best_tip":{...}
}
```

You can ask for the list of all characters here :
> http://www.overwatch-tips.com/api/v1/characters

You can ask for a specific character by its slug or its id here :
> http://www.overwatch-tips.com/api/v1/characters/bastion

> http://www.overwatch-tips.com/api/v1/characters/1

## Maps

Here is an example of json of a map :
```javascript
{
    "id":148,
    "type":"Map",
    "name":"Dorado",
    "slug":"dorado",
    "description":"Mexico City, Mexico",
    "best_tip":{...}
}
```

You can ask for the list of all maps here :
> http://www.overwatch-tips.com/api/v1/maps

You can ask for a specific map by its slug or its id here :
> http://www.overwatch-tips.com/api/v1/maps/dorado

> http://www.overwatch-tips.com/api/v1/maps/22






