clear; close all; clc;

data = table2array(readtable('S-param_RW.xlsx', 'Sheet',1, 'Range','A5:A506'));
formatSpec = '%f %*f %*f %f %f %*f %*f %*f %*f';
array = nan(length(data),3);
for k = 1:length(data)
    array(k,:) = cell2mat(textscan(data{k,1},formatSpec));
end

fig = figure(1);
fig.Position = [680 558 820 420];
subplot(2,1,1)
plot(array(:,1)/1e6,array(:,2),'LineWidth',1.2);
grid on
axis([1580 1630 -35 0]);
xlabel('f, МГц')
ylabel('H(f), дБ')
ylh = get(gca,'ylabel');                                                        % Object Information
ylp = get(ylh, 'Position');
set(ylh, 'Rotation',0, 'Position',ylp, 'VerticalAlignment','middle', 'HorizontalAlignment','right')
title('Амплитудно-частотная характеристика')

subplot(2,1,2)
plot(array(:,1)/1e6,array(:,3),'LineWidth',1.2);
grid on
xlabel('f, МГц')
ylabel('\phi(f), град.')
ylh = get(gca,'ylabel');
gyl = get(ylh);                                                         % Object Information
ylp = get(ylh, 'Position');
set(ylh, 'Rotation',0, 'Position',ylp, 'VerticalAlignment','middle', 'HorizontalAlignment','right')
title('Фазочастотная характеристика')