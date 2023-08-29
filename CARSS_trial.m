clc
close all;
clear;

load('grid.mat');
load('K.mat');
load('elec.mat');

%%
[Ds] = find_Ds(grid);
%%
r = 85; % in mm
fprintf('Stage-0');
fprintf('\n');
[locs,peak_indxs_max,peak_indxs_min,Ds,Delec] = Stage_0(K,elec.chanpos,grid.dipos,r,Ds);
% [~,locs] = find_locs(Delec,elec,db);
%%
close all;
clc
aa = [45];  % Ideally 1161 sources so source will be of index floor(aa/3)
% 1345, 345, 45
gd = 20;

phi = sum(K(:,aa),2);

J_problem = zeros(size(K,2),1);
J_problem(aa,1) = 1;

fprintf('CARSS');
fprintf('\n');

[J_CARSS,peaks,pos_sources_all,J_sLOR]...
    = CARSS(K,phi,gd,locs,peak_indxs_max,peak_indxs_min,Ds);

phians = K*J_sLOR;
% % % plot_elec(phi,elec);
% % fprintf('Error = %f',100*abs(round(sum(phi - phians)/sum(phi),3)));  %
% scale error!!!
% fprintf('\n');
disp(J_CARSS(aa,1));

% load vol
% figure;plot_source(J321(J_problem),vol,grid,[0.5,0.5,0],.1);
% figure;plot_source(J321(J_sLOR),vol,grid,[0.5,0.5,0],.1);
