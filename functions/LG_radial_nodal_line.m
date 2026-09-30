function LG_radial_nodal_line(ax,p,l,beam_waist,screen_size,linespec)
% LG光束径向节线
% ax 对象
% p l 径向、角向指数
% beam_waist 束腰半径
% screen_size 屏幕尺寸
% linspec 线型
num_points = 100;            % 采样点数
xi =@(xi) laguerre(p,l,xi);  % 拉盖尔多项式
xi_max = screen_size*3;      % 最大搜索范围
%% 寻找拉盖尔多项式的零点（x_k）
xi_roots = zeros(1, p+1);                    % 存储零点
xi_search = linspace(-xi_max, xi_max, 100);  % 搜索区间采样
f_vals = arrayfun(xi, xi_search);            % 计算函数值
sign_changes = diff(sign(f_vals));           % 找到符号变化点（零点所在区间）
% 提取零点所在区间并求解
root_idx = 1;
for i = 1:length(sign_changes)
    if sign_changes(i) ~= 0 && root_idx <= abs(p+1)
        xi_start = xi_search(i);
        xi_end = xi_search(i+1);
        % 用fzero求解零点
        xi_roots(root_idx) = fzero(xi, [xi_start, xi_end]);
        root_idx = root_idx + 1;
    end
end
%%  绘制节线
hold(ax,'on'); grid(ax,'on'); axis(ax,'equal');
% 绘制每个零点对应的节线
eta = linspace(0, pi*2, num_points);  % 角向参数
for k = 1:length(xi_roots)
    xi_k = xi_roots(k);
    if xi_k == 0
    else 
    x = sqrt(xi_k)*beam_waist/sqrt(2)*cos(eta);
    y = sqrt(xi_k)*beam_waist/sqrt(2)*sin(eta);
    plot(ax,x, y, linespec, 'LineWidth', 1.5);
    end
end
end