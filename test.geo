// 
// Split-ring resonator
// Inner Radius(r0) 3 cm
// Outer Radius(R) 6 cm 
// Width (w) = 1 cm
// Gap t = 0.5 cm 
// Lenght L = 5 cm


// Definition of variables

cm = 1e-02;
R = 6 * cm; r = 2.54 * cm ; 
t = 0.5 * cm; w = 1.27 * cm ;
L = 5 * cm;
// lc = 0.1 * cm;
lc = 0.5 * cm;

// Point defenition

//lower part 
//**********************************************************
// circle related
Point(0) = {0, 0, -0.5*L, lc}; 

Point(1) = {r * Sqrt(1 - (0.5*t/r)^2), 
            0.5*t, -0.5*L, lc}; 

Point(2) = {r * Sqrt(1 - (0.5*t/r)^2),
            -0.5*t, -0.5*L, lc}; 
Point(3) = {-r, 0, -0.5*L, lc}; 


Point(4) = {(r + w)*Sqrt(1 - (0.5*t/(r + w))^2),
            0.5*t, -0.5*L, lc};
Point(5) = {(r + w)*Sqrt(1 - (0.5*t/(r + w))^2), 
            -0.5*t, -0.5*L, lc};
Point(6) = {-(r + w),0, -0.5*L, lc};



// Point(7) = {R*Sqrt(1 - (0.5*t/R)^2), 0.5*t, 0, lc}; 
// Point(8) = {R*Sqrt(1 - (0.5*t/R)^2), -0.5*t, 0, lc}; 
Point(9) = {2*R, 0, -0.5*L, 4*lc}; 
Point(10) = {-2*R, 0, -0.5*L, 4*lc}; 

// Point(10) = {(R + w) *Sqrt(1 - (0.5*t/(R+w))^2) , 0.5*t, 0, lc}; 
// Point(11) = {(R + w) *Sqrt(1 - (0.5*t/(R+w))^2) , -0.5*t, 0, lc}; 
// Point(12) = {-(R + w)  , 0, 0, lc}; 
Point(11) = {2 * R + 0.5*cm, 0, -0.5*L, 10*lc};
Point(12) = {-2 * R - 0.5*cm, 0, -0.5*L, 10*lc};

Point(13) = {(r + w)*Sqrt(1 - (0.5*t/(r + w))^2),
            0.5*t + 0.5*cm, -0.5*L, lc};
Point(14) = {(r + w)*Sqrt(1 - (0.5*t/(r + w))^2), 
            -0.5*t - 0.5* cm, -0.5*L, lc};

Point(15) = {(r + w)*Sqrt(1 - (0.5*t/(r + w))^2) + 0.5 * cm,
            0.5*t + 0.5*cm, -0.5*L, lc};
Point(16) = {(r + w)*Sqrt(1 - (0.5*t/(r + w))^2) + 0.5 * cm, 
            -0.5*t - 0.5* cm, -0.5*L, lc};


Point(17) = {0, 2 * R , -0.5*L, 10*lc};
Point(18) = {0, -2 * R , -0.5*L, 10*lc};
Point(19) = {0, 2 * R+ 0.5*cm, -0.5*L, 10*lc};
Point(20) = {0, -2 * R - 0.5*cm, -0.5*L, 10*lc};
// Point(2) = {r, 0, 0, lc}; Point(3) = {r + w, 0, 0, lc};

// set point to the 0,0,0 
//with the target mesh size (lc) close to the
// point:


// circle defenition

Circle(1) = {1,0,3};
Circle(2) = {3,0,2}; 

Circle(3) = {4,0,6};
Circle(4) = {6,0,5};
Line(5)   = {1,4};
Line(6)   = {2,5};

Line(7)   = {1,2};
Line(8)   = {4,13};
Line(9)   = {13, 15};
Line(10)   = {15, 16};
Line(11)   = {16, 14};
Line(12)   = {14,  5};


Circle(13) = {9,0, 17};
Circle(14) = {17,0, 10};
Circle(15) = {10,0, 18};
Circle(16) = {18,0, 9};

Circle(17) = {11,0, 19};
Circle(18) = {19,0, 12};
Circle(19) = {12,0, 20};
Circle(20) = {20,0, 11};



// surace of split ring
Curve Loop(1) = {1,2,6,-4,-3,-5};
Plane Surface(1) = {1};
Color Blue{ Surface{ 1 }; }
Extrude {0, 0, L} { Surface{1}; }

// surface of insertion
Curve Loop(2) = {5, 8,9,10,11,12,-6,-7};
Plane Surface(2) = {2};
Color Green{ Surface{ 2 }; }
Extrude {0, 0, L} { Surface{2}; }

// surface inside the ring 
Curve Loop(3) = {1,2,-7};
Plane Surface(3) = {3};
Color Yellow{ Surface{ 3 }; }
Extrude {0, 0, L} { Surface{3}; }
// // surface out the ring 1 part

//remove  mesh  from ring resonator
Curve Loop(4) = {13,14, 15, 16};
Plane Surface(4) = {4};
Color Yellow{ Surface{ 4 }; }
Extrude {0, 0, L} { Surface{4}; }
// // surface out the ring 2 part

Curve Loop(5) = {17,18, 19 ,20};
Plane Surface(5) = {5};
Color Black{ Surface{ 4 }; }
Extrude {0, 0, L} { Surface{5}; }
// Color Yellow{ Surface{ 5 }; }


