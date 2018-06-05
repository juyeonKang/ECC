G = dot(4,:);
n=1;
R = G;

while 1
    R(end,:)
    n = n+1;
    r = add_dot(G,R(end,:),p,a);
 
    
    if ismember(r,dot)
        R = [R; r]
    else
        fprintf("dot(" + r(1) + "," + r(2) + ") is not on curve")
        break;
    end
    
    if r == [0,0];
        break
    elseif (r(1)==G(1)) && (r(2)~=G(2));
        break;
    end
end