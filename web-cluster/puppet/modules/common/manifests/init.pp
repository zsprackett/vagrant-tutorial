class common {
  include common::data
}

class common::data {
  $internal_network = '33.33.33.0/24'

  $db_host = '33.33.33.100'
  $db_name = 'exampledb'
  $db_user = 'exampleuser'
  $db_pass = 'examplepass'
}
