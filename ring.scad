module ring(diameter_min, diameter_max, height) {
  tolerance = 0.1;
  difference() {
    cylinder(h = height, d = diameter_max);

    tz(-tolerance / 2)
    cylinder(h = height + tolerance, d = diameter_min);
  }
}

module ring_sector(diameter_min, diameter_max, height, angle) {
  difference() {
    ring(diameter_min, diameter_max, height);

    union() {
      rotate([0, 0, angle])
      translate([-diameter_max / 2 - tolerance / 2, 0, -tolerance / 2])
      cube([diameter_max + tolerance, diameter_max + tolerance, height + tolerance]);

      mirror([0, 1, 0])
      translate([-diameter_max / 2 - tolerance / 2, 0, -tolerance / 2])
      cube([diameter_max + tolerance, diameter_max + tolerance, height + tolerance]);
    }
  }
}
