getIndex(String destination) {
  if (destination == 'Tours') {
    return 0;
  } else if (destination == 'Treks') {
    return 1;
  } else if (destination == 'Restaurants') {
    return 2;
  } else if (destination == 'Clubs') {
    return 3;
  } else {
    return null;
  }
}
