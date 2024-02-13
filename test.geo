// 
// Split-ring resonator
// Inner Radius(r0) 3 cm
// Outer Radius(R) 6 cm 
// Width (w) = 1 cm
// Gap t = 0.5 cm 
//


// Definition of variables

cm = 1e-02;
R = 6 * cm; r = 3 * cm ; 
t = 1 * cm; w = 1 * cm ;

// lc = 0.1 * cm;
lc = 0.5 * cm;

// Point defenition

// circle related
Point(0) = {0, 0, 0, lc}; 

Point(1) = {r * Sqrt(1 - (0.5*t/r)^2), 
            0.5*t, 0, lc}; 

Point(2) = {r * Sqrt(1 - (0.5*t/r)^2),
            -0.5*t, 0, lc}; 
Point(3) = {-r, 0, 0, lc}; 


Point(4) = {(r + w)*Sqrt(1 - (0.5*t/(r + w))^2),
            0.5*t, 0, lc};
Point(5) = {(r + w)*Sqrt(1 - (0.5*t/(r + w))^2), 
            -0.5*t, 0, lc};
Point(6) = {-(r + w),0, 0, lc};



// Point(7) = {R*Sqrt(1 - (0.5*t/R)^2), 0.5*t, 0, lc}; 
// Point(8) = {R*Sqrt(1 - (0.5*t/R)^2), -0.5*t, 0, lc}; 
Point(9) = {2*R, 0, 0, lc}; 
Point(10) = {-2*R, 0, 0, lc}; 

// Point(10) = {(R + w) *Sqrt(1 - (0.5*t/(R+w))^2) , 0.5*t, 0, lc}; 
// Point(11) = {(R + w) *Sqrt(1 - (0.5*t/(R+w))^2) , -0.5*t, 0, lc}; 
// Point(12) = {-(R + w)  , 0, 0, lc}; 
Point(11) = {5 * R, 0, 0, 4*lc};
Point(12) = {-5 * R, 0, 0, 4*lc};

Point(13) = {(r + w)*Sqrt(1 - (0.5*t/(r + w))^2),
            0.5*t + 0.5*cm, 0, lc};
Point(14) = {(r + w)*Sqrt(1 - (0.5*t/(r + w))^2), 
            -0.5*t - 0.5* cm, 0, lc};

Point(15) = {(r + w)*Sqrt(1 - (0.5*t/(r + w))^2) + 0.5 * cm,
            0.5*t + 0.5*cm, 0, lc};
Point(16) = {(r + w)*Sqrt(1 - (0.5*t/(r + w))^2) + 0.5 * cm, 
            -0.5*t - 0.5* cm, 0, lc};

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

// Circle(7) = {7,0,9}; 
// Circle(8) = {9,0,8};

// Circle(9)  = {10, 0, 12}; 
// Circle(10) = {12, 0, 11};
// Line(11)   = {7, 10};
// Line(12)   = {8, 11};
Circle(13) = {9,0, 10};
Circle(14) = {10,0, 9};
Circle(15) = {11,0, 12};
Circle(16) = {12,0, 11};


// surace of split ring
Curve Loop(1) = {1,2,6,-4,-3,-5};
Plane Surface(1) = {1};
Color Blue{ Surface{ 1 }; }

// surface of insertion
Curve Loop(2) = {5, 8,9,10,11,12,-6,-7};
Plane Surface(2) = {2};
Color Green{ Surface{ 2 }; }

// surface inside the ring 
Curve Loop(3) = {1,2,-7};
Plane Surface(3) = {3};
Color Yellow{ Surface{ 3 }; }

// surface out the ring 1 part

Curve Loop(4) = {13,14};
Plane Surface(4) = {4, 1, 2};
Color Yellow{ Surface{ 4 }; }



// Curve Loop(3) = {14};
// Plane Surface(3) = {3,2};
// Color Red{ Surface{ 3 }; }

// Curve Loop(4) = {7, 6,-9,-5};
// Plane Surface(4) = {4};
// Color Red{ Surface{ 4 }; }



// Curve Loop(10) = {3,2};
// Plane Surface(11) = {10,8};
// Color Yellow{ Surface{ 11 }; }

// Curve Loop(12) = {4,3};
// Plane Surface(13) = {12,10};
// Color Red{ Surface{ 13 }; }

// Curve Loop(14) = {5,4};
// Plane Surface(15) = {14,12};
// Color Blue{ Surface{ 15 }; }
