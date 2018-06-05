%%% 기본 인자 (필요에 따라 변경)
p = 17; a = 2; b = 1;

%%% x = [0, p-1] 에서 나오는 ( 우변 mod p )의 배열 Right 
%%% y = [0, p-1] 에서 나오는 ( 좌변 mod p )의 배열 Left
for i=0:p-1
    Right(i+1) = mod( i^3 + (a*i) + b , p);
    Left(i+1) = mod(i^2, p);
end

%%% Right와 Left는 유지하고 (x,y좌표를 알아야 하므로!)
%%% Right와 Left의 중복되는 값 찾기 (unique와 intersect 이용)
R = unique(Right);
L = unique(Left);
inter = intersect(R,L)

%%% 중복되는 값의 인덱스 찾아서 좌표점 완성
dot = [0 0];
for i=1:size(inter,2)
   idx_x = find(Right == inter(i));
   idx_y = find(Left == inter(i));
   for j=1:size(idx_x,2)
       for k=1:size(idx_y,2)
           dot = [dot; idx_x(j)-1 idx_y(k)-1];
       end
   end
end

dot = dot(2:end, :);
save('parameter.mat','a','p','dot');