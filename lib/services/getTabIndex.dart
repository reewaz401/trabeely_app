getIndex(String destination) {
  if (destination == 'All') {
    return 0;
  } else if (destination == 'Tours') {
    return 1;
  } else if (destination == 'Treks') {
    return 2;
  } else if (destination == 'Hotels') {
    return 3;
  } else if (destination == 'Restauranest') {
    return 4;
  } else if (destination == 'Clubs') {
    return 5;
  }
}
