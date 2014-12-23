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
    polyline_text += ','.join(map(lambda alpha: '[cos(a*{0})*(q+w*{0}),sin(a*{0})*(q+w*{0})]'.format(alpha), alphas))
    polyline_text += ',' + ','.join(map(lambda alpha: '[cos(a*{0})*(e+w*{0}),sin(a*{0})*(e+w*{0})]'.format(alpha), reversed(alphas)))
    print '''
module spiral_{segments_number}(radius_from, radius_to, thickness, height, angle) {{
    radius_delta = radius_to - radius_from;
    q=radius_from - thickness/2;
    e=radius_from + thickness/2;
    w=radius_delta;
    a=angle;
    linear_extrude(height=height)
        polygon([{polyline_text}]);
}}
'''.format(
        polyline_text=polyline_text,
        segments_number=segments_number
    )

def extended_spiral(segments_number):
    alphas = []
    alphas_ray = []

    for i in xrange (0, segments_number):
        alphas.append(float(i) / (segments_number - 1))

    for i in xrange (1, segments_number):
        alphas_ray.append(float(i) / (segments_number - 1))

    polyline_text = ''
    polyline_text += ','.join(map(lambda alpha: '[cos(a*{0})*(q+w*{0}),sin(a*{0})*(q+w*{0})]'.format(alpha), alphas))
    polyline_text += ',' + ','.join(map(lambda alpha: '[cos(a*{0})*(e+ww*{0}),sin(a*{0})*(e+ww*{0})]'.format(alpha), reversed(alphas)))
    print '''
module extended_spiral_{segments_number}(radius_from, radius_to, thickness_from, thickness_to, height, angle) {{
    q=radius_from - thickness_from / 2;
    e=radius_from + thickness_from / 2;
    w=(radius_to - radius_from) - (thickness_to - thickness_from) / 2;
    ww=(radius_to - radius_from) + (thickness_to - thickness_from) / 2;
    a=angle;
    linear_extrude(height=height)
        polygon([{polyline_text}]);
}}
'''.format(
        polyline_text=polyline_text,
        segments_number=segments_number
    )


def main():
    segments_number = 16 
    while segments_number <= 4096:
        spiral(segments_number)
        extended_spiral(segments_number)
        segments_number *= 2
        
if __name__ == '__main__':
    main()
