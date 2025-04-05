import gleap/models/gleaper
import gleap/views/pages/home

pub fn home() {
  home.root(gleaper.get_all())
}
