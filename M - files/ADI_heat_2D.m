%-------------------------------------------------%
%  2D Transient Heat Conduction Using ADI Method  %
%                 -Pulkit Jain                    %
%-------------------------------------------------%

%Boundary Conditions
%{
1st quadrant of square block:

           BCy2: -kdT/dy = h(T-Tinf)
                 ________
                |        |
BCx1 : dT/dx=0  |        |  BCx2: -kdT/dx = h(T-Tinf)
                |________|

              BCy1 : dT/dy=0

Note on matrix and mesh:
      Matrix                      Mesh Grid
| T(r,c)   T(r,c+1) | <---> | T(i,j)    T(i+1,j) |
|T(r+1,c) T(r+1,c+1)| <---> |T(i,j+1)  T(i+1,j+1)|
%}
%Consider only first quadrant due to symmetry

%Parameters
a=1.6*10^(-5);  %alpha in m2/s
k=61;  %conductivity in W/mK =(W/mC)
xm=4*10^(-2); ym=4*10^(-2);  %x and y max in m (in 1st quad)
x0=0; y0=0;
T0=100;  %Initial temp in C
Tinf=25;  %Outside temp in C
h=400;  %heat trans coeff in W/m2K (=W/m2C)
tmax=60;  %calc at this time (in s)

%Discretise
nx=10; ny=10;  %nx*ny grid (no. of pts are nx+1*ny+1)
dx=xm/nx; dy=ym/ny;
dt=1; %time stepping in s

%For convinience
rx = a*dt/(dx^2); ry = a*dt/(dy^2);
Told=T0.*ones(ny+1,nx+1); Tnew=zeros(ny+1,nx+1);

%%%%%%% ADI Loop %%%%%%%
for t=dt:dt:tmax
    %Step 1
    l=[0; (-rx/2).*ones(nx-1,1); -k/(dx*h)];  %lower diagonal
    d=[-1; (1+rx).*ones(nx-1,1); k/(dx*h)+1]; %main diagonal
    u=[1; (-rx/2).*ones(nx-1,1); 0];          %upper diagonal
    b=zeros(nx+1,1);  %RHS vector
    for j=2:ny
        b(1)=0;  %BCx1
        b(2:nx)= Told(j,2:nx)'+(ry/2).*(Told(j+1,2:nx)'-2.*Told(j,2:nx)'+Told(j-1,2:nx)');  %interior pts
        b(nx+1)=Tinf;  %BCx2
        Tnew(j,:)=(thomas(l,d,u,b,nx+1))';  %solve and store
    end
    Tnew(1,:)=Tnew(2,:);  %BCy1
    Tnew(ny+1,:)=(h*Tinf.*ones(1,nx+1) + k/dy*Tnew(ny,:))/(k/dy+h);  %BCy2
    Told=Tnew;  %update
    
    %Step 2
    l=[0; (-ry/2).*ones(ny-1,1); -k/(dy*h)];  %lower diagonal
    d=[-1; (1+ry).*ones(ny-1,1); k/(dy*h)+1]; %main diagonal
    u=[1; (-ry/2).*ones(ny-1,1); 0];          %upper diagonal
    b=zeros(ny+1,1);  %RHS vector
    for i=2:nx
        b(1)=0;  %BCy1
        b(2:ny)= Told(2:ny,i)+(rx/2).*(Told(2:ny,i+1)-2.*Told(2:ny,i)+Told(2:ny,i-1));  %interior pts
        b(ny+1)=Tinf;  %BCy2
        Tnew(:,i)=(thomas(l,d,u,b,ny+1));  %solve and store
    end
    Tnew(:,1)=Tnew(:,2);  %BCx1
    Tnew(:,nx+1)=(h*Tinf.*ones(ny+1,1) + k/dx*Tnew(:,nx))/(k/dx+h);  %BCx2
    Told=Tnew;  %update
end

%Plot for full plate
[X,Y]=meshgrid(x0:dx:(xm*2),y0:dy:(ym*2));
T=[flip(flip(Tnew,2)), flip(Tnew,1); flip(Tnew,2), Tnew];  %mirroring the first quadrant profile
T(ny+1,:)=[]; T(:,nx+1)=[];  %duplicate inner boundary
contourf(X,Y,T,Tinf:T0,'ShowText','on');

%%% Solver for tri diagonal system using Thomas algorithm %%%
function sol = thomas(l,d,u,b,n)
    g=zeros(n,1); h=zeros(n,1); sol=zeros(n,1);
    g(1)=d(1); h(1)=b(1);
    for i=2:n
        g(i)=d(i)-l(i)*u(i-1)/g(i-1);
        h(i)=b(i)-l(i)*h(i-1)/g(i-1);
    end
    sol(n)=h(n)/g(n);
    for i=n-1:-1:1
        sol(i)=(h(i)-u(i)*sol(i+1))/g(i);
    end
end