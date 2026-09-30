# 花瓣模激光 · MATLAB 复现代码包

花瓣模式激光是谐振腔内的本征模式，可看作两种相反拓扑荷的拉盖尔-高斯（LG）光束的同轴叠加：

$$
{\rm LG}_{p\pm l}={\rm LG}_{pl}+{\rm LG}_{p-l}
$$

本仓库提供**完整可复现**的 MATLAB 代码：单张花瓣模式图与 p=0~3、l=±1~±6 批量全家福。所有代码逐字取自笔记《花瓣模激光.md》及原始库 `E:\Optic_Simulation`，未做修改。

## 目录结构

```
花瓣模激光复现代码包/
├── petal_mode.m          # 主脚本①：单张花瓣模式图（LG₂,±₂，四片花瓣）
├── batch_petal.m         # 主脚本②：p=0~3、l=±1~±6 批量全家福
├── setup_path.m          # 一键把本仓库全部文件夹加入 MATLAB 路径
├── README.md
└── functions/            # 依赖函数库
    ├── LG_beam.m                 # LG 光束场生成（内嵌 laguerre 子函数）
    ├── laguerre.m                # 拉盖尔多项式递归实现
    ├── producing_normal_grid2D.m # 二维正则网格
    ├── customFigure.m            # 无工具栏、指定分辨率/背景的图窗
    ├── petal_nodal_line.m        # 角向节线
    ├── LG_radial_nodal_line.m    # 径向节线（依赖 laguerre.m）
    ├── displaycolorbar.m         # 颜色条
    ├── nclCM.m                   # NCL 色映射（依赖 nclCM_Data.mat）
    ├── nclCM_Data.mat            # nclCM 色板数据（必需）
    └── layout2.m                 # 子图排版（仅 batch_petal.m 使用）
```

## 快速开始

1. 在 MATLAB 中进入本目录，运行 `setup_path`（把根目录与 `functions` 子目录递归加入路径）；
2. 运行 `petal_mode` → 得到单张花瓣模式图；
3. 运行 `batch_petal` → 得到 p=0~3、l=±1~±6 全家福。

> 提示：`setup_path.m` 内置一行 `savepath;`（默认注释），取消注释可把路径永久写入 MATLAB，每次启动自动生效。

## 依赖关系

```
petal_mode.m / batch_petal.m
 ├─ producing_normal_grid2D.m
 ├─ LG_beam.m（内嵌 laguerre 子函数，自包含）
 ├─ customFigure.m
 ├─ petal_nodal_line.m
 ├─ LG_radial_nodal_line.m → laguerre.m
 ├─ displaycolorbar.m
 ├─ nclCM.m → nclCM_Data.mat
 └─ layout2.m（仅 batch_petal.m 使用）
```

## 复现结果

- `petal_mode.m` → LG₂,±₂ 花瓣模式：四片花瓣，白色角向节线 + 红色径向节线；
- `batch_petal.m` → p=0~3、l=±1~±6 阵列：花瓣数由 l 决定，径向亮环由 p 决定，束宽满足 $\omega=\sqrt{2p+|l|+1}\,\omega_0$。

## 注意事项

- `nclCM.m` 通过 `load('nclCM_Data.mat')` 读取色板数据，两者必须同目录（本仓库已放在 `functions/` 中）；
- `displaycolorbar.m` 使用 `clim`，需要 MATLAB R2022a 及以上；低版本请把 `clim` 改为 `caxis`；
- 图中标注使用 `text(...,'Interpreter','latex',...)`，需要 MATLAB 支持 LaTeX 渲染。

## 来源

- 笔记：`E:\Optics\花瓣模激光.md`
- 原始函数库：`E:\Optic_Simulation`（useful_functions 下 beam_definition / normal_output_kits / self_defined_colormap / app_designers 及根目录 customFigure.m）
