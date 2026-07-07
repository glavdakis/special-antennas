W_f = 1.5e-3; L_f = 7e-3; W_H = 7e-3; L_H = 10e-3;
L_gnd = 4e-3; W_sub = 12e-3; L_sub = 18e-3; h_sub = 0.8e-3;
W_H1 = 6e-3; L_H1 = 9e-3; W_H2 = 2e-3; L_H2 = 4e-3; W_H3 = 1e-3; L_H3 = 4e-3; W_H4 = 2.25e-3; width = 1e-3;
s = antenna.Rectangle(Length=W_H1+2*W_H2, Width=L_H, Center=[0, L_f-L_H3]);    

feed = antenna.Rectangle(Length=W_f, Width=L_f-L_H3+L_gnd, Center=[0, (-L_f-L_gnd)/2]); 
gnd = antenna.Rectangle(Length=W_sub, Width=L_gnd, Center=[0, (-L_sub+L_gnd)/2]); 
patch = s + feed;

d = dielectric(Name="FR4", EpsilonR=4.4, LossTangent=0.018, Thickness=h_sub); 
delec = antenna.Rectangle(Length=W_sub, Width=L_sub); 
slot = pcbStack;
slot.Name = 'Square monopole antenna';
slot.BoardShape = delec;
slot.BoardThickness = h_sub;
slot.Layers = {patch, d, gnd};
slot.FeedLocations = [0, -L_sub/2, 1, 3];
slot.FeedDiameter = W_f/2;
figure;
show(slot)
figure;
mesh(slot, MaxEdgeLength=W_f/2);

%%
fmin = 1.5e9; 
fmax = 6.5e9; 
Z0 = 50; 
N = 20; 
freq = linspace(fmin, fmax, N); 
s = sparameters(slot, freq, Z0); 
s11Fig = figure; 
rfplot(s,1,1)
hold on
yline(-10, '--')



