function n = check_n(G,dot,p,a)
n=1;
R = G;

while 1
    n = n+1;
    r = add_dot(G,R(end,:),p,a);
 
    
    if ismember(r,dot,'row')
        R = [R; r];
    else
        %fprintf("dot(" + r(1) + "," + r(2) + ") is not on curve")
        break;
    end
    
    if r == [0,0];
        break;
    elseif r(2)==0 && R(end-1,2)==0
        break;
    end
end
end