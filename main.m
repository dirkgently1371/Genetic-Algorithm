clc;
clear all;
close all;
global nvar;
global sigma;

sigma=0.01;
nvar=10;
xlow=-3;
xuper=5;

pop.pos=[];
pop.fit=[];
popsize=200;

popall=repmat(pop,[popsize 1]);

m_rate=0.8;
c_rate=0.5;

rate_change_mutate=0.9;

num_m=round(m_rate*popsize);
num_c=round(c_rate*popsize);
popallm=repmat(pop,[num_m 1]);
popallc=repmat(pop,[num_c*2 1]);

for p=1:popsize
    popall(p).pos=unifrnd(xlow,xuper,[1 nvar]);
    popall(p).fit=cost(popall(p).pos);
end

max_iter=20;
best=zeros(max_iter,1);

for i=1:max_iter
    for j=1:num_m
        r1=randi(popsize);
        popallm(j).pos=mutate(popall(r1).pos,rate_change_mutate);
        popallm(j).fit=cost(popallm(j).pos);
    end
    
    c=1;
    for j=1:num_c
        r1=randi(popsize);
        r2=randi(popsize);
        temp=crossover(popall(r1).pos,popall(r2).pos);
        
        popallc(c).pos=temp(1,:);
        popallc(c).fit=cost(popallc(c).pos);
        c=c+1;
        popallc(c).pos=temp(2,:);
        popallc(c).fit=cost(popallc(c).pos);
        c=c+1;
    end
    
    
    poptemp=[popall
             popallm
             popallc];
         
    tempfit=[poptemp.fit];
    [a b]=sort(tempfit); 
    popall=poptemp(b(1:popsize));
    best(i)=popall(1).fit;
    bestpos=popall(1).pos;
    figure(1);
    semilogy(best(1:i),'-b')
end
bestpos
r=1;
% global data;
% data=xlsread();
