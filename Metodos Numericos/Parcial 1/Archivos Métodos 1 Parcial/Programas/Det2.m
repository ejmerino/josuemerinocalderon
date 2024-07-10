function [D2]=Det2(A)
 %[D2]=Det2([3 -8;4 4])
  D2=A(1,1)*A(2,2)-A(1,2)*A(2,1);
endfunction