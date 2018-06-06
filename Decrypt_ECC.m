%%% 암호화된 메시지를 읽어옴
fpt = fopen('ecc_cipher.txt','rt');
cipher = fread(fpt,'int8=>char');
fclose(fpt);

%%% 저장된 형식에 따라 C1과 C2를 읽어옴
%%% C1의 x좌표는 처음 4개문자(숫자) C1의 y좌표는 그 다음 4개문자(숫자)
c1 = [hex2dec(cipher(1:4)'), hex2dec(cipher(5:8)')];

%%% C2의 각 x,y좌표들은 4개문자(숫자)가 번갈아가면서 나옴 
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

%%% c1, c2를 이용한 복호화
dc1 = multiple_dot(d,c1,p,a);
result = c2 - dc1;

%%% result는 c2에서 얻어낸 매핑된 점의 집합
%%% result(1)은 x좌표, result(2)는 y좌표
%%% y좌표가 p/2 보다 작으면 result(1)이 원문의 ASCII값
%%% y좌표가 p/2 보다 크면 p-result(1)이 원문의 ASCII값
for i=1:size(result,1)
    if result(i,2)>p/2
        origin_M(i) = p-result(i,1);
    else
        origin_M(i) = result(i,1);
    end
end

%%% 복호화한 텍스트를 저장
fpt = fopen('ecc_decrypt.txt','w');
fprintf(fpt,'%c',origin_M);
fclose(fpt);

fprintf('Decryption is finished :D\n');