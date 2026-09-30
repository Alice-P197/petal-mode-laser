function petal_nodal_line(ax,l,screen_width,linespec)
% 绘制拉盖尔高斯光束的角向节线
% ax 对象
% l 角向指数
% screen_width 屏幕宽度
% linspec 线型 
num_points = 100;                         % 采样点数
eta =@(eta) exp(-1i*l*eta)+exp(1i*l*eta); % 角向参数
%% 寻找零点（θ_k）
% 原理：Ince_p^m(ξ;q)是p次多项式，有p个实根
eta_roots = zeros(1, l*2);            % 存储零点
eta_search = linspace(0, 2*pi, 100);  % 搜索区间采样
f_vals = arrayfun(eta, eta_search);   % 计算函数值
sign_changes = diff(sign(f_vals));    % 找到符号变化点（零点所在区间）
% 提取零点所在区间并求解
root_idx = 1;
for i = 1:length(sign_changes)
    if sign_changes(i) ~= 0 && root_idx <= 2*l
        eta_start = eta_search(i);
        eta_end = eta_search(i+1);
        % 用fzero求解零点
        eta_roots(root_idx) = fzero(eta, [eta_start, eta_end]);
        root_idx = root_idx + 1;
    end
end
%% 绘制节线
hold(ax,'on'); grid(ax,'on');
xi = linspace(-screen_width/2, screen_width/2, num_points);  % 角向参数
for k = 1:length(eta_roots)
    eta_k = eta_roots(k);
    if eta_k == 0
    else 
    x = xi*cos(eta_k);
    y = xi*sin(eta_k);
    plot(ax,x, y, linespec, 'LineWidth', 1.5);
    end
end
axis(ax,'equal','xy');
end