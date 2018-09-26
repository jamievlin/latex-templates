size(5cm);

// options
real circrad= 0.25 ;
// edges
// processing edge (0, 1)
path edge_0=(0, 0)--(1, 1);
draw((edge_0),arrow=Arrow(Relative(1.0 - circrad/arclength(edge_0))));

// processing edge (1, 2)
path edge_1=(1, 1)--(1, -1);
draw((edge_1),arrow=Arrow(Relative(1.0 - circrad/arclength(edge_1))));

// processing edge (2, 0)
path edge_2=(1, -1)--(0, 0);
draw((edge_2),arrow=Arrow(Relative(1.0 - circrad/arclength(edge_2))));

// processing edge (3, 0)
path edge_3=(-2, 0)--(0, 0);
draw((edge_3),arrow=Arrow(Relative(1.0 - circrad/arclength(edge_3))));


// vertices
// processing node id 0
unfill(circle((0, 0),circrad));
draw(circle((0, 0),circrad));
label("t", (0, 0));

// processing node id 1
unfill(circle((1, 1),circrad));
draw(circle((1, 1),circrad));
label("a", (1, 1));

// processing node id 2
unfill(circle((1, -1),circrad));
draw(circle((1, -1),circrad));
label("b", (1, -1));

// processing node id 3
unfill(circle((-2, 0),circrad));
draw(circle((-2, 0),circrad));
label("...", (-2, 0));

// more labels

label("1000",(1,0),E);
label("1000",(.5,.5),NW);
label("1000",(.5,-.5),SW);
