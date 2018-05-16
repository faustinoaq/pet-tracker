class Pet < Granite::ORM::Base
  adapter pg
  table_name pets


  # id : Int64 primary key is created for you
  field name : String
  field breed : String
  field age : Int32
  timestamps
end
