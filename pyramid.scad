module pyramid(width, length, height) {
  p0 = [-width / 2, -length / 2, 0];
  p1 = [width / 2, -length / 2, 0];
  p2 = [width / 2, length / 2, 0];
  p3 = [-width / 2, length / 2, 0];
  p4 = [0, 0, height];

  polyhedron(
    points=[p0, p1, p2, p3, p4],
    triangles=[
      [4, 1, 0],
      [4, 2, 1],                                                                         
      [4, 3, 2],                                                                         
      [4, 0, 3],                                                                         
      [0, 1, 2],                                                                         
      [2, 3, 0]  
    ]
  );
}

module hollow_pyramid(width, length, thickness, height) {
  factor = (width - thickness * 2) / width;
  difference() {
    pyramid(width, length, height);

    pyramid(width - thickness * 2, length - thickness * 2, height * factor);
  }
}
