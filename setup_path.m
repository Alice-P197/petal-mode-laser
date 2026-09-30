% setup_path.m
% 将本仓库的所有文件夹（含 functions 子目录）递归添加到 MATLAB 路径，
% 之后即可直接运行根目录下的主脚本：
%   >> setup_path      % 先运行本脚本
%   >> petal_mode      % 单张花瓣模式图（LG_{2,±2}）
%   >> batch_petal     % p=0~3, l=±1~±6 批量全家福
%
% 说明：
%   - 采用 genpath 递归添加，functions 子目录中的函数均可被调用；
%   - 若希望以后每次启动 MATLAB 自动生效，取消下方 savepath 的注释
%     （会写入 MATLAB 的 pathdef.m，永久保存路径）。

repoRoot = fileparts(mfilename('fullpath'));
addpath(genpath(repoRoot));
fprintf('已将以下目录及其子目录添加到 MATLAB 路径：\n  %s\n', repoRoot);
% savepath;   % 如需永久保存，取消本行注释
