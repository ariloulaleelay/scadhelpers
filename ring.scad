module ring(diameter_min, diameter_max, height) {
  difference() {
    cylinder(h = height, d = diameter_max);

    tz(-0.05)
    cylinder(h = height + 0.1, d = diameter_min);
  }
}
