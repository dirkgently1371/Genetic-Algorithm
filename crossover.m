function z = crossover(x,y)
%   global nvar;
  nvar=4;
  point_cut=randi(nvar-1);
  z1=[x(1:point_cut) y(point_cut+1:end)];
  z2=[y(1:point_cut) x(point_cut+1:end)];
  z=[z1;z2];
end

