getIndex(String destination) {
  if (destination == 'Tours') {
    return 0;
  } else if (destination == 'Treks') {
    return 1;
  } else if (destination == 'Weekends') {
    return 2;
  } else if (destination == 'Adventures') {
    return 3;
  } else {
    return null;
  }
}
