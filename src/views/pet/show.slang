h1 Show Pet
p = pet.name
p = pet.breed
p = pet.age
p
  == link_to("back", "/pets", class: "btn btn-success btn-xs")
  == link_to("edit", "/pets/#{pet.id}/edit", class: "btn btn-success btn-xs")
  == link_to("delete", "/pets/#{pet.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-xs")
