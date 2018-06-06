clc; clear;

%%%% 파라미터 지정 
%%%% p_소수 // a,b_타원곡선 정의 계수 // G_base point // n_order of G
%%%% 발표용 p = 491 / a = 2 / b = 0 // p는 p=(4*i)+1을 만족해야 한다
p = 491; a = 2; b = 0;
find_dot(p,a,b);
load('parameter.mat');
[G n] = generate_G(dot,p,a);

%%%% 개인키 d
d = 29;
%%%% 공개키 Q
Q = multiple_dot(d,G,p,a);

save('public_parameter.mat','a','b','p','Q','G');