load('public_parameter.mat');

fpt = fopen('ecc_plain.txt','r');
plain_text = fread(fpt);
fclose(fpt);

dots = mapping(plain_text, p);

%%%% encrypt dots
k = 15;

C1 = multiple_dot(k,G,p,a);

kQ = multiple_dot(k,Q,p,a);
C2 = dots + kQ;

fpt = fopen('ecc_cipher.txt','w');
fprintf(fpt,'%04x',C1);
fprintf(fpt,'%04x',C2');
fclose(fpt);
fprintf('Encryption is finished :D\n');