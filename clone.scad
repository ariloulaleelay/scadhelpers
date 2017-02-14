module mirror_clone(mirror_options, center=[0, 0, 0]) {
  union() {
    for (c = [0 : $children - 1]) {
      child(c);

      translate(center)
      mirror(mirror_options)
      translate([-center[0], -center[1], -center[2]])
      child(c);
    }
  }
}

module translate_clone(translate_options) {
  union() {
    for (c = [0 : $children - 1]) {
      child(c);

      translate(translate_options)
      child(c);
    }
  }
}

module rotate_clone(rotate_options) {
  union() {
    for (c = [0 : $children - 1]) {
      child(c);

      rotate(rotate_options)
      child(c);
    }
  }
}
