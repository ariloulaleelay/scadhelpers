function rp2d(p, a) = [p[0] * cos(a) - p[1] * sin(a), p[0] * sin(a) + p[1] * cos(a)];
function tp2d(p, x=0, y=0) = [p[0] + x, p[1] + y];
function sp2d(p, x=1, y=1) = [p[0] * x, p[1] * y]; 
function mpx2d(p) = [-p[0], p[1]];
function mpy2d(p) = [p[0], -p[1]];
