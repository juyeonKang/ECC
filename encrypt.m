clc; clear;

%%%% 파라미터 지정 
%%%% p_소수 // a,b_타원곡선 정의 계수 // G_base point // n_order of G
p = 199; a = 2; b = 0;
find_dot(p,a,b);
load('parameter.mat');
[G n] = generate_G(dot,p,a);

%%%% 개인키 d
d = 10;
%%%% 공개키 Q
Q = multiple_dot(d,G,p,a);

%%%% C1 = k*G
k = 11;
C1 = multiple_dot(k,G,p,a);

%%%% 메시지 매핑
%%%% Modified Koblitz Encoding Method for ECC
%%%% 2013 ACEEE
%%%% Ravi Kishore Kodali and Prof. Narasimha Sarma NVS
%%%% National Institute of Technology, Warangal
%%%% Department of  E. and C. E., N.I.T., Warangal, India

%%%%% X,Y computation example
for i=0:p-1
    j=i+1;
    X(j) = mod(i^3+a*i+b,p);
    Y(j) = mod(i^2,p);
end

%%%% ASCII 문자 하나에 대해서만!
M = 6; %% ASCII (0~128 중 문자 하나!), 97이면 'a'
if ismember(X(M+1), Y)
    idx = find(Y==X(M+1))
    m = [M, idx(1)-1];
else
    idx = find(Y==X(p-M+1))
    m = [p-M, idx(2)-1];
end
kQ = multiple_dot(k,Q,p,a);
C2 = m + kQ;

dC1 = multiple_dot(d,C1,p,a);
result = C2 - dC1;
if result(2)>p/2
    origin_M = p-result(1)
else
    origin_M = result(1)
end