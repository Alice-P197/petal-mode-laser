clc;clear; close all;
%% Laguerre Gaussian Beams
L = 2; % screen size
N = 501; % number of pixels
[x,y,X,Y,theta,r,dx,dy] = producing_normal_grid2D(L,N);
w0 = 0.2; % beam waist
lambda = 632.8e-6; % wavelength
z = 0.001; % distance
customFigure([1920 0 1920 1200],'w')
count=1;
for p=0:3
	for l=1:6
		E = LG_beam(r,theta,z,w0,lambda,dx,dy,p,l)...
		+LG_beam(r,theta,z,w0,lambda,dx,dy,p,-l);
		I = E.*conj(E);
		hax=axes();
		imagesc(x,y,I); hold on;
		petal_nodal_line(gca,l,L*0.6,'w--')
		LG_radial_nodal_line(gca,p,l,w0,L*4,'r--')
		displaycolorbar(gca,nclCM(26,238),[0,max(I(:))],2,'','w');
		colorbar off;
		axis equal;axis xy;axis off;
		text(0,L*2/6,['$\rm LG_{',num2str(p),',\pm',num2str(l),'}$'], ...
		'Interpreter','latex', ...
		'FontName','times new roman','FontSize',20,'Color','w');
		layout2(count,0.25,[0.1,0.7,0.11,0.20],6); count=count+1;
	end
end
