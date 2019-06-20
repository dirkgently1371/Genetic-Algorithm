function z = mutate(x,s)
  global nvar;
  global sigma;
  num_select=round(nvar*s);
  e=randperm(nvar);
  r=e(1:num_select);
  x(r)=x(r)+sigma*randn(1,num_select); 
  z=x;
end

