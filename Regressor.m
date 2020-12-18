


term_11=ddq1*q3^2/2+L2^2*ddq1+L3^2*ddq1/8+dq1*dq3*q3-L3^2*ddq1*cos(2*q2)/8-ddq1*q3^2*cos(2*q2)/2-L2*ddq3*sin(q2)...
        -L3*dq1*dq3/2-L3*ddq1*q3/2-L2*L3*dq2^2*sin(q2)/2+L3*dq1*dq3*cos(2*q2)/2+L3*ddq1*q3*cos(2*q2)/2 ...
        +L2*dq2^2*q3*sin(q2)-dq1*dq3*q3*cos(2*q2)+L3^2*dq1*dq2*sin(2*q2)/4 ...
        +L2*L3*ddq2*cos(q2)/2+dq1*dq2*q3^2*sin(2*q2)-2*L2*dq2*dq3*cos(q2) ...
        -L2*ddq2*q3*cos(q2)-L3*dq1*dq2*q3*sin(2*q2);

term_21= L3^2*ddq2/4-L3*q3*ddq2+q3^2*ddq2-dq2*dq3*(L3-2*q3)+g*sin(q2)*(L3/2-q3) ...
         - dq1^2*cos(q2)*sin(q2)*(L3-2*q3)^2/4+L2*ddq1*cos(q2)*(L3-2*q3)/2;

term_31= (L3-2*q3)*dq2^2/2+ddq3+g*cos(q2)-L2*ddq1*sin(q2) ...
        - (dq1^2*(L3-2*q3)*(2*cos(q2)^2-2))/4 ;
    
    
Y=[0, ddq1 ,dq1 , L2^2*ddq1/4 , ddq1 , 0 , term_11 , ddq1 , 0 ;
   0, 0    , 0  , 0           , ddq2 , dq2, term_21 , ddq2 ,0 ;
   0 , 0   , 0  , 0           , 0    , 0  , term_31 , 0 , dq3];

P=[m1;I1;b1;m2;I2;b2;m3;I3;b3];
%9x1


B= [b1*dq1;b2*dq2;b3*dq3];

% D*ddq       + C*dq         + G    + B  = Y P =Torque
% 3x3*3x1=3x1 + 3x3*3x1= 3x1 + 3x1  + 3x1 = 3x9*9x1
robot_sys= D*ddq+C*dq+G+B;

Test= robot_sys- Y*P;
simplify(Test)
