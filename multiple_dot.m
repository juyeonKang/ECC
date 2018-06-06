function result = multiple_dot(times, dot,p,a)
k = times;
tmp_dot = dot;
if(k>1)
    for i=1:k-1
        tmp_dot = add_dot(dot,tmp_dot,p,a);
    end
end
result = tmp_dot;
end