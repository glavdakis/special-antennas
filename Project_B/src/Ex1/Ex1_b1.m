clear; clc; close all;

% Simulation parameters  
freq = 1e9;  
c = 3e8; 
lambda = c/freq; 
T = 1/freq; 
omega = 2*pi*freq; 
k = 2*pi/lambda; 
az = 5; % Number of array elements 
  
Ns = 30; % Number of samples per wavelength 
ds = lambda/Ns; % Spatial Discretization  
 
Nt = 35; % Number of time samples per period 
dt = T/Nt; % Temporal discretization  
t = 0:dt:(1*T); % Increase the number of periods here for longer simulations 
 
R = (0*lambda):ds:(8*lambda); 
Ntheta = 240; % Number of angular discretization  
dtheta = 2*pi/Ntheta; 
 
theta = 0:dtheta:(2*pi); 
 
% Select different phase shifts
%deltaAll = 0:dtheta:2*pi; 
deltaAll = pi/3; 
 
% Generate Domain  
x = R.'*cos(theta); 
y = R.'*sin(theta); 
 
% Output properties  
teal = [0 0.5 0.5]; % maps for unconventional coloring 
origBrownColor = [114/256 70/256 43/256]; 

% Update the distance between elements  
d = lambda/2; 
% Update the distances below when adding/removing array elements 
r1y = 0;   r1x = -2*d; 
r2y = 0;   r2x = -d; 
r3y = 0;   r3x = 0; 
r4y = 0;   r4x = d; 
r5y = 0;   r5x = 2*d; 

% Animate 
for ps=1:length(deltaAll) % Sweep through angles 
     
    delta = deltaAll(ps); 

  % -----------------------------------------------------------------

   % for it=1:length(t) % Sweep through time 
    for it=1:1 % For t=0
         
        % Update below when adding/removing array elements
        for ix = 1:length(R)
            for iy = 1:length(theta) 

                R1 = sqrt((x(ix,iy)-r1x)^2 + (y(ix,iy)-r1y)^2); 
                E1(ix,iy) = cos(omega*t(it) - k*R1+delta*-2); 
                 
                R2 = sqrt((x(ix,iy)-r2x)^2 + (y(ix,iy)-r2y)^2); 
                E2(ix,iy) = cos(omega*t(it) - k*R2+delta*-1); 
                 
                R3 = sqrt((x(ix,iy)-r3x)^2 + (y(ix,iy)-r3y)^2); 
                E3(ix,iy) = cos(omega*t(it) - k*R3+delta*0);
                 
                R4 = sqrt((x(ix,iy)-r4x)^2 + (y(ix,iy)-r4y)^2);
                E4(ix,iy) = cos(omega*t(it) - k*R4+delta*1); 
                 
                R5 = sqrt((x(ix,iy)-r5x)^2 + (y(ix,iy)-r5y)^2);
                E5(ix,iy) = cos(omega*t(it) - k*R5+delta*2);

            end 
        end 
         
        E = E1+E2+E3+E4+E5; 
           
  % ----------------------------------------------------------------- 
         
        
       % Array factor 
       f1 = figure (10); clf; set(gcf,'Color',[1 1 1]); Fs=10; 
       sp1 = subplot(1,2,1); set(gca,'FontSize',Fs);  
       A = ones(1,az); % (Relative) Amplitude distribution for each array element
         
       Fa = zeros(1,length(theta)); 
       for i = 0:(length(A)-1) 
          temp = (A(i+1)*exp(-1i*i*delta + 1i*k*(i*d-((length(A)-1)/2)*d)*cos(theta))); 
          Fa = Fa + temp; 
       end 
                
       Fa = abs(Fa); 
       kk = polar(theta,-Fa/max(Fa)); hold on; axis off 
         
       % Remove ticks from graph  
       set(findall(gca,'String','210'),'String',' ') 
       set(findall(gca,'String','240'),'String',' ') 
       set(findall(gca,'String','270'),'String',' ') 
       set(findall(gca,'String','300'),'String',' ') 
       set(findall(gca,'String','330'),'String',' ') 
         
       pcolor(x/max(max(x)),y/max(max(y)),E); shading interp; 
       pbaspect([1 1 1]); % axis off; 
       ylim([0 1]) 
         
       kk = polar(theta,-Fa/max(Fa),'k'); set(kk,'LineWidth',2); hold on; 
       set(sp1,'Position',[0 0 1 1]) 
         
       xlabel('Antenna separation: d=\lambda/2','FontSize',Fs+2,'FontName','Century Gothic') 
           text(-0.85,1.15, ['\bf Relative phase difference: $\delta = ' num2str(floor(delta/pi*180)) '^\circ$'], ...
       'FontSize',Fs+2,'Color',teal,'FontName','Century Gothic', 'Interpreter', 'latex') 
         
       % Array locations (For visualization)  
       % Update the text(...) commands below when adding/removing array elements 
       yoffset = 0.04; 
       xloc = -0.02; yloc=0.067;  
       text(xloc,yloc-yoffset,1,'.','FontSize',Fs+12) 
       text(d/max(max(x))+xloc,yloc-yoffset,1,'.','FontSize',Fs+12) 
       text(2*d/max(max(x))+xloc,yloc-yoffset,1,'.','FontSize',Fs+12) 
       text(-d/max(max(x))+xloc,yloc-yoffset,1,'.','FontSize',Fs+12) 
       text(-2*d/max(max(x))+xloc,yloc-yoffset,1,'.','FontSize',Fs+12) 
                                         
    end   
     
end