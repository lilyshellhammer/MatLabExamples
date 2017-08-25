%Lily Shellhammer
%This program prints a surface, shows different views, interpolates it, and
%prints views iwth the interpolated surface.
clear
clc
%Declare x and y values
xN = linspace(-0.5, 0.5, 25);
yN = linspace(-0.5, 0.5, 25);
k = 0.77;
%create a mesh grid of the x,y values
[XN, YN] = meshgrid (xN,yN);
%calculate Z points
Z = k*(XN.^2-YN.^2);

%Array of degrees to shift the view of the graph for each subplot
degr = [0 90; 30 30; 0 0; 90 200; 0 90; 30 20; 0 0; 90 200];
titles = {'Top view (original)', 'Perspective (original)', 'Front view (original)','Side view (original)', 'Top view (reconstructed)', 'Perspective (reconstructed)', 'Front view (reconstructed)', 'Side view (reconstructed)'};
for i = 1:4
    subplot(4,2, i);
    mesh(XN, YN, Z);
    view(degr(i,1), degr(i,2));
    title(titles(i));
    xlabel('x (m)');
    ylabel('y (m)');
end

%new x,y points (only a few)
x = linspace(-0.5, 0.5, 3);
y = linspace(-0.5, 0.5, 4);
for i = 5:8
    subplot(4,2, i);
    %create mesh of new x, y points
    [X, Y] = meshgrid(x,y);
    %new Z calculations
    Z = k*(X.^2-Y.^2);
    Z = interp2(X, Y, Z, XN, YN, 'linear');
    mesh(XN, YN, Z);
    view(degr(i,1), degr(i,2));
    title(titles(i));
    xlabel('x (m)');
    ylabel('y (m)');
end
colorbar
colormap spring