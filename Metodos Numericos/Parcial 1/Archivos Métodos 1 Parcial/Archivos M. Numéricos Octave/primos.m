function primos(num)
%primos(76)
if num ==1
    disp('1 es primo');
  else
    while num~=1;
      for c=2:num
        if mod(num,c)==0
            disp(c);
            num=num/c;
            break;
        end
      end
    end
end
end

