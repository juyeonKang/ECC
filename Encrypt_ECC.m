%%% 공개된 정보(p,a,b,G,Q)를 읽어옴
load('public_parameter.mat');

%%% 암호화 할 텍스트 파일을 읽어와서 문자열을 plain_text에 저장
fpt = fopen('ecc_plain.txt','r');
plain_text = fread(fpt);
fclose(fpt);

%%% plain_text의 각 문자를 ASCII로 인코딩한 후, 이를 곡선위의 점으로 mapping
%%% 문자 하나당 점 하나로 mapping됨
dots = mapping(plain_text, p);

%%%% encrypt dots
%%% [1,n-1]의 난수 k. n은 G와 p,a,b를 알면 구할 수 있음
k = 15; 

C1 = multiple_dot(k,G,p,a);

kQ = multiple_dot(k,Q,p,a);
C2 = dots + kQ;

%%% C1과 C2를 16진수로 바꾸어 텍스트로 저장
fpt = fopen('ecc_cipher.txt','w');
fprintf(fpt,'%04x',C1);
fprintf(fpt,'%04x',C2');
fclose(fpt);

fprintf('Encryption is finished :D\n');