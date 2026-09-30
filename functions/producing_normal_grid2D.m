function [x,y,X,Y,theta,r,dx,dy]=producing_normal_grid2D(L,N)
%% 生成二维正则网格
    x = linspace(-L/2, L/2, N);y = x;
    dx = x(2)-x(1); dy=y(2)-y(1);
    [X, Y] = meshgrid(x, y); 
    [theta,r] = cart2pol(X,Y);    % 将直角坐标转化为极坐标
end