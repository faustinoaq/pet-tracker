div.row
  div.col-sm-11
    h2 Pets
  div.col-sm-1
    a.btn.btn-success.btn-xs href="/pets/new" New
div.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th Breed
        th Age
        th Actions
    tbody
      - pets.each do |pet|
        tr
          td = pet.name
          td = pet.breed
          td = pet.age
          td
            span
              == link_to("read", "/pets/#{pet.id}", class: "btn btn-success btn-xs")
              == link_to("edit", "/pets/#{pet.id}/edit", class: "btn btn-success btn-xs")
              == link_to("delete", "/pets/#{ pet.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-xs")
