function result = mapping(text,p)
%%%% 메시지 매핑
%%%% Modified Koblitz Encoding Method for ECC
%%%% 2013 ACEEE
%%%% Ravi Kishore Kodali and Prof. Narasimha Sarma NVS
%%%% National Institute of Technology, Warangal
%%%% Department of  E. and C. E., N.I.T., Warangal, India

%%%% 필요한 변수!
load('parameter.mat')

%%%% result 틀 마련
N = length(text);
result = [0,0];

%%%%% X,Y computation example
for i=0:p-1
    j=i+1;
    X(j) = mod(i^3+a*i+b,p);
    Y(j) = mod(i^2,p);
end

for i=1:N
    M = text(i); %% ASCII (0~128 중 문자 하나!), 97이면 'a'
    if ismember(X(M+1), Y)
        idx = find(Y==X(M+1));
        m = [M, idx(1)-1];
    else
        idx = find(Y==X(p-M+1));
        m = [p-M, idx(2)-1];
    end
    result = [result; m];
end
result = result(2:end,:);
end