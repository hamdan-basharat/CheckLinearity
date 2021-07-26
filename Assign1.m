%Assignment 1 Tony Fan, Hamdan Basharat
clc;
clear all;
close all;

%% Global variables to use for each check
system = @system5;%function handle to reference system being tested
n = [-5:5];%setting time scale 
inputMag = 2;%magnitude of the input signal

x = zeros(1,length(n));

unit(n,inputMag,system);
checkCausality(n,inputMag,system,x);%takes time scale, magnitude of the input, system, and the zero vector,x
checkLinearity(n,2,system);
checkMemory(n,inputMag,system,x);
checkTimeInvariance(n,inputMag,system,x);
