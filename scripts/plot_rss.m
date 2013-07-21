%for name = {'chaocan','chengkaitao','dajiang','gongsi','hao','lijunfei','pengfei','qixu'}
for name = {'hao'}
for num = {'1','2','3','4'}
fid = fopen(strcat(name{1},'\scan_results_',num{1}));
rss = fscanf(fid, '%lf', inf);
fclose(fid);

figure;
hold on;
plot(rss,'b*-');
plot(1:length(rss),mean(rss),'r-')
xlabel('Times')
ylabel('RSS (-dBm)')
set(gca,'xlim',[0,length(usetime)]);
%title('Scan - Unconnected to AP');
title(strcat(name{1},'_',num{1}));
end
end
