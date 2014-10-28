
// TODO change for loop to children() method
// will break backward capatibility with openscad

module tx(v) {
  for (c = [0:$children-1]) {
    translate([v, 0, 0])
      child(c);
  }
}

module ty(v) {
  for (c = [0:$children-1]) {
    translate([0, v, 0])
      child(c);
  }
}

module tz(v) {
  for (c = [0:$children-1]) {
    translate([0, 0, v])
      child(c);
  }
}

module rx(v) {
  for (c = [0:$children-1]) {
    rotate([v, 0, 0])
      child(c);
  }
}

module ry(v) {
  for (c = [0:$children-1]) {
    rotate([0, v, 0])
      child(c);
  }
}

module rz(v) {
  for (c = [0:$children-1]) {
    rotate([0, 0, v])
      child(c);
  }
}

module mx() {
  for (c = [0:$children-1]) {
    mirror([1, 0, 0])
      child(c);
  }
}

module my() {
  for (c = [0:$children-1]) {
    mirror([0, 1, 0])
      child(c);
  }
}

module mz() {
  for (c = [0:$children-1]) {
    mirror([0, 0, 1])
      child(c);
  }
}
