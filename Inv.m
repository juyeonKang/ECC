function result = Inv(m,a)

% memory assignment
r=zeros(1,50);
q=zeros(1,50);
u=zeros(1,50);
v=zeros(1,50);

% initialization
u(1)=0; u(2)=1;
v(1)=1; v(2)=0;
q(1)=0; q(2)=0;

r(1)=m; r(2)=a;


% iteration
i=2;
while r(i)~=0
    i=i+1;
    r(i)=mod(r(i-2),r(i-1));
    q(i)=floor(r(i-2)/r(i-1));
    u(i)=u(i-2)-u(i-1)*q(i);
    v(i)=v(i-2)-v(i-1)*q(i);
end

N=i-1;
if r(N)==1
   if u(N)<0 || u(N)>=m
      if u(N)<0
         u(N)=u(N)+m;
      else 
         u(N)=u(N)-m;
      end
   end 
else
   u(N)=0;
end

result=u(N);
end
