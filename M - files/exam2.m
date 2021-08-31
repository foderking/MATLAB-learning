alp = 2062.83; bet = 46000; n = 1937.17;
yo =  0.1; c = 5000; w = 100; theta = 1.2566; k = 50000;

yy = zeros(7, 1);
yy(1) = 0;
yy(2) = ( yo * (c*w*cos(theta) + k*sin(theta)) - (bet*yy(ii-1)) ) / (n + alp)

for ii = 3:7
    ( (yo * (c*w*cos(theta*(ii-2)) + k*sin(theta*(ii-2))) ) - (bet*yy(ii-1)) - (n*yy(ii-2)) ) / (alp)
end