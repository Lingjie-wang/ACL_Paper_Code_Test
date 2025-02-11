% 柱状图绘制模板
% By：阿昆的科研日常

clear

%% 数据准备
% 读取数据
load data.mat

% 假设 x 是一个数字序列，我们将其转换为对应的字符串
x = {'MATH500', 'Omni-MATH-500', 'AIME', 'GPQA', 'Etc'};  % 示例，假设有5个点

%% 颜色定义
C = TheColor('sci',1691);
C = flipud(C);
C1 = C(3,:);
C2 = C(5,:);
C3 = C(6,:);

%% 图片尺寸设置（单位：厘米）
figureUnits = 'centimeters';
figureWidth = 16;  % 增大宽度
figureHeight = 10;

%% 窗口设置
figureHandle = figure;
set(gcf, 'Units', figureUnits, 'Position', [0 0 figureWidth figureHeight]);
hold on

%% 柱状图绘制
GO = bar(dataset,1,'EdgeColor','k');
hTitle = title('Bar Plot');
hXLabel = xlabel('XAxis');
hYLabel = ylabel('Accuracy (%)');

%% 细节调整
% 赋色
GO(1).FaceColor = C1;
GO(2).FaceColor = C2;
GO(3).FaceColor = C3;
% 坐标区调整
set(gca, 'Box', 'off', ...                                         % 边框
         'XGrid', 'off', 'YGrid', 'on', ...                        % 网格
         'TickDir', 'out', 'TickLength', [.01 .01], ...            % 刻度
         'XMinorTick', 'off', 'YMinorTick', 'off', ...             % 小刻度
         'XColor', [.1 .1 .1],  'YColor', [.1 .1 .1])              % 坐标轴颜色

% 坐标轴刻度调整
set(gca, 'XTick', 1:length(x), 'XTickLabel', x, ...    % X轴刻度
         'YTick', 0:0.1:1, 'Ylim', [0 0.5], ...        % Y轴刻度和范围
         'YTickLabel', {0:0.1:1});                      % Y轴标签

% 旋转 X 轴刻度标签，避免重叠
% xtickangle(45);  % 设置 X 轴刻度标签旋转 45 度

% Legend    
hLegend = legend([GO(1), GO(2), GO(3)], ...
                 'SFT Baseline', 'K=4', 'K=16', ...
                 'Location', 'northeast');

% 字体和字号
set(gca, 'FontName', 'Arial', 'FontSize', 10)
set([hLegend, hXLabel, hYLabel], 'FontSize', 11, 'FontName', 'Arial', 'FontWeight', 'bold')
set(hTitle, 'FontSize', 12, 'FontWeight', 'bold')

% 选择是否输出题目
title('');
% 选择是否输出xlabel
xlabel('')

% 背景颜色
set(gcf,'Color',[1 1 1])

%% 图片输出
figW = figureWidth;
figH = figureHeight;
set(figureHandle,'PaperUnits',figureUnits);
set(figureHandle,'PaperPosition',[0 0 figW figH]);
set(figureHandle, 'PaperSize', [figW figH]);           % 设置纸张大小与图形一致

fileout = 'bar_plot_1';
print(figureHandle,[fileout,'.png'],'-r300','-dpng');
% 输出 PDF 文件
print(figureHandle, [fileout,'.pdf'],'-dpdf','-bestfit');
