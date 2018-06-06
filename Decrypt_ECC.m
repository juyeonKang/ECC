fpt = fopen('ecc_cipher.txt','rt');
cipher = fread(fpt,'int8=>char');
fclose(fpt);

c1 = [hex2dec(cipher(1:4)'), hex2dec(cipher(5:8)')];
dc1 = multiple_dot(d,c1,p,a);

c2 = [0 0];
idx = 9;
while 1
    idx1 = idx+3;
    idx2 = idx+4;
    idx3 = idx+7;
    x = hex2dec(cipher(idx:idx1)');
    y = hex2dec(cipher(idx2:idx3)');
    c2 = [c2; x y];
    idx = idx+8;
    if idx3 == size(cipher,1)
        break;
    end
end
c2 = c2(2:end,:);

result = c2 - dc1;

for i=1:size(result,1)
    if result(i,2)>p/2
        origin_M(i) = p-result(i,1);
    else
        origin_M(i) = result(i,1);
    end
end

fpt = fopen('ecc_decrypt.txt','w');
fprintf(fpt,'%c',origin_M);
fclose(fpt);
fprintf('Decryption is finished :D\n');