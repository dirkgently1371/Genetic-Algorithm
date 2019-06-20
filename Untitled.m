clc;
clear all;
close all;
global nvar;
global sigma;
sigma=0.801;
nvar=10;

A=randi([-3,5],1,10)
B=randi([-3,5],1,10)
z = cross(A,B)
