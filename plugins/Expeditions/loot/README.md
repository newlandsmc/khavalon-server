Example:

```{
  "pools": [
    {
      "rolls": 1,
      "entries": [
        {
          "type": "item",
          "material": "DIAMOND_CHESTPLATE",
          "name": "<green>Just a normal chestplate</green>",
          "lore": [
            "Lore line 1",
            "Lore line 2",
            "Hello, %player%!"
          ],
          "weight": 1,
          "amount": {
            "min": 1,
            "max": 9
          },
          "enchants": [
            {
              "name": "UNBREAKING",
              "level": 1,
              "weight": 1
            },
            {
              "name": "PROTECTION",
              "level": {
                "min": 1,
                "max": 4
              },
              "weight": 1
            }
          ]
        }
      ]
    }
  ]
}
