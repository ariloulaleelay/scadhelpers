#!/usr/bin/env python
import sys
from math import sin, cos, atan, sqrt, pow

def polar(r, angle):
    return '[{r}*cos({angle}),{r}*sin({angle})]'.format(r=r, angle=angle)

def spiral(segments_number):
    alphas = []
    alphas_ray = []

    for i in xrange (0, segments_number):
        alphas.append(float(i) / (segments_number - 1))

    for i in xrange (1, segments_number):
        alphas_ray.append(float(i) / (segments_number - 1))

    polyline_text = ''
    polyline_text += ','.join(map(lambda alpha: '[cos(angle*{0})*(radius_from+radius_delta*{0}-thickness/2),sin(angle*{0})*(radius_from+radius_delta*{0}-thickness/2)]'.format(alpha), alphas))
    polyline_text += ',' + ','.join(map(lambda alpha: '[cos(angle*{0})*(radius_from+radius_delta*{0}+thickness/2),sin(angle*{0})*(radius_from+radius_delta*{0}+thickness/2)]'.format(alpha), reversed(alphas)))
    print '''
module spiral_{segments_number}(radius_from, radius_to, angle, thickness, height) {{
    radius_delta = radius_to - radius_from;
    linear_extrude(height=height)
        polygon([{polyline_text}]);
}}
'''.format(
        polyline_text=polyline_text,
        segments_number=segments_number
    )


def main():
    segments_number = 16 
    while segments_number < 2048:
        spiral(segments_number)
        segments_number *= 2
        
if __name__ == '__main__':
    main()
