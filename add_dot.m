function result = add_dot(P, Q, p, a)

%%% infinity에 대한 처리
if P==[0,0]
    result = [Q(1), Q(2)];
    return
elseif Q ==[0,0]
    result = [P(1), P(2)];
    return
end

%%% infinity가 아닌 경우
x1 = P(1);
y1 = P(2);
x2 = Q(1);
y2 = Q(2);


if (x1==x2)&&(y1~=y2)
    result = [0, 0];
    return
end

if(x1==x2&&y1==y2)
     s=mod(mod(3*x1*x1+a,p)*Inv(p,mod(2*y1,p)),p);
else
     s=mod(mod(y2-y1,p)*Inv(p,mod(x2-x1,p)),p);
end

x3=mod(s*s-x1-x2,p);
y3=mod(s*(x1-x3)-y1,p);

result=[x3, y3];
end