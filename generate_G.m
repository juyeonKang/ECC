function [G, max_n] = generate_G(dot,p,a)
k = size(dot,1);
max_n = 0;
for i=1:k:2
    n = check_n(dot(i,:),dot,p,a);
    if n>max_n;
        max_n = n;
        G = dot(i,:);
        if max_n==k
            break;
        end
    end
end
end