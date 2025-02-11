% ��״ͼ����ģ��
% By�������Ŀ����ճ�

clear

%% ����׼��
% ��ȡ����
load data.mat

% ���� x ��һ���������У����ǽ���ת��Ϊ��Ӧ���ַ���
x = {'MATH500', 'Omni-MATH-500', 'AIME', 'GPQA', 'Etc'};  % ʾ����������5����

%% ��ɫ����
C = TheColor('sci',1691);
C = flipud(C);
C1 = C(3,:);
C2 = C(5,:);
C3 = C(6,:);

%% ͼƬ�ߴ����ã���λ�����ף�
figureUnits = 'centimeters';
figureWidth = 16;  % ������
figureHeight = 10;

%% ��������
figureHandle = figure;
set(gcf, 'Units', figureUnits, 'Position', [0 0 figureWidth figureHeight]);
hold on

%% ��״ͼ����
GO = bar(dataset,1,'EdgeColor','k');
hTitle = title('Bar Plot');
hXLabel = xlabel('XAxis');
hYLabel = ylabel('Accuracy (%)');

%% ϸ�ڵ���
% ��ɫ
GO(1).FaceColor = C1;
GO(2).FaceColor = C2;
GO(3).FaceColor = C3;
% ����������
set(gca, 'Box', 'off', ...                                         % �߿�
         'XGrid', 'off', 'YGrid', 'on', ...                        % ����
         'TickDir', 'out', 'TickLength', [.01 .01], ...            % �̶�
         'XMinorTick', 'off', 'YMinorTick', 'off', ...             % С�̶�
         'XColor', [.1 .1 .1],  'YColor', [.1 .1 .1])              % ��������ɫ

% ������̶ȵ���
set(gca, 'XTick', 1:length(x), 'XTickLabel', x, ...    % X��̶�
         'YTick', 0:0.1:1, 'Ylim', [0 0.5], ...        % Y��̶Ⱥͷ�Χ
         'YTickLabel', {0:0.1:1});                      % Y���ǩ

% ��ת X ��̶ȱ�ǩ�������ص�
% xtickangle(45);  % ���� X ��̶ȱ�ǩ��ת 45 ��

% Legend    
hLegend = legend([GO(1), GO(2), GO(3)], ...
                 'SFT Baseline', 'K=4', 'K=16', ...
                 'Location', 'northeast');

% ������ֺ�
set(gca, 'FontName', 'Arial', 'FontSize', 10)
set([hLegend, hXLabel, hYLabel], 'FontSize', 11, 'FontName', 'Arial', 'FontWeight', 'bold')
set(hTitle, 'FontSize', 12, 'FontWeight', 'bold')

% ѡ���Ƿ������Ŀ
title('');
% ѡ���Ƿ����xlabel
xlabel('')

% ������ɫ
set(gcf,'Color',[1 1 1])

%% ͼƬ���
figW = figureWidth;
figH = figureHeight;
set(figureHandle,'PaperUnits',figureUnits);
set(figureHandle,'PaperPosition',[0 0 figW figH]);
set(figureHandle, 'PaperSize', [figW figH]);           % ����ֽ�Ŵ�С��ͼ��һ��

fileout = 'bar_plot_1';
print(figureHandle,[fileout,'.png'],'-r300','-dpng');
% ��� PDF �ļ�
print(figureHandle, [fileout,'.pdf'],'-dpdf','-bestfit');
