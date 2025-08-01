.name,

(.ingredients | length),

(.ingredients
    | map(select(.item == "sugar") | .amount.quantity)
    | add),

(.ingredients + .["optional ingredients"]
    | map(select(.substitute) | {(.item): .substitute})
    | add)
