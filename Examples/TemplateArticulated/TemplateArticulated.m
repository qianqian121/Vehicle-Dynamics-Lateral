%% Template Articulated
% This template show how to simulate an articulated vehicle and plot the results.
%
%%
%

clear all                   % Clear workspace
close all                   % Closing figures
clc                         % Clear command window

% only octave
addpath('/home/andre/Repos/Vehicle-Dynamics/Vehicle-Dynamics-Lateral/')
pkg load odepkg

%%
%

% Choosing tire
TireModel = VehicleDynamicsLateral.TirePacejka();
% Choosing vehicle
System = VehicleDynamicsLateral.VehicleArticulatedNonlinear();
System.tire = TireModel;
% Choosing simulation
T = 6;                      % Total simulation time [s]
resol = 50;                 % Resolution
TSPAN = 0:T/resol:T;        % Time span [s]
simulator = VehicleDynamicsLateral.Simulator(System, TSPAN);

% Simulation
simulator.Simulate();

%% Results
%

g = Graphics(simulator);
g.TractorColor = 'c';
g.SemitrailerColor = 'm';
g.Frame('~/Desktop/plot/trajectory');
g.Animation('~/Desktop/animation/animated_trajectory');

%%
%
% <<illustrations/AnimationArticulated.gif>>
%
%% See Also
%
% <index.html Index> | <TemplateSimple.html TemplateSimple>
%
