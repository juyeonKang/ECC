clc; clear;

%%%% 파라미터 지정 
%%%% p_소수 // a,b_타원곡선 정의 계수 // G_base point // n_order of G
p = 19699; a = 2; b = 0;
find_dot(p,a,b);
load('parameter.mat');
[G n] = generate_G(dot,p,a);

%%%% 개인키 d
d = 5;
%%%% 공개키 Q
Q = multiple_dot(d,G,p,a);

save('public_parameter.mat','a','b','p','Q','G');