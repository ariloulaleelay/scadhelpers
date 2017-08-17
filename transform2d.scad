function rp2d(p, a) = [p[0] * cos(a) - p[1] * sin(a), p[0] * sin(a) + p[1] * cos(a)];
function tp2d(p, x=0, y=0) = [p[0] + x, p[1] + y];
function sp2d(p, x=1, y=1) = [p[0] * x, p[1] * y]; 
function mpx2d(p) = [-p[0], p[1]];
function mpy2d(p) = [p[0], -p[1]];

function clone_mirror_polygon_y(points) = concat(points, [for (idx = [len(points) - 1 : -1 : 0]) if (points[idx][1] != 0) mpy2d(points[idx])]);
function clone_mirror_polygon_x(points) = concat(points, [for (idx = [len(points) - 1 : -1 : 0]) if (points[idx][0] != 0) mpx2d(points[idx])]);


// NOTE move this to 2d objects file
module polygon_mirror_y(points) {
  polygon(clone_mirror_polygon_y(points));
}
module polygon_mirror_x(points) {
  polygon(clone_mirror_polygon_x(points));
}
