%for name = {'chaocan','chengkaitao','dajiang','gongsi','hao','lijunfei','pengfei','qixu'}
for name = {'hao'}
for num = {'1','2','3','4'}
%fid = fopen('chaocan\receive_3');
fid = fopen(strcat(name{1},'\receive_',num{1}));
receive = fscanf(fid, '%lf', inf);
fclose(fid);
%fid = fopen('chaocan\start_3');
fid = fopen(strcat(name{1},'\start_',num{1}));
start = fscanf(fid, '%lf', inf);
fclose(fid);

origin = start(1);
start=start-origin;
receive=receive-origin;
usetime=(receive-start)/1000.0;
%usetime = usetime(2:length(usetime)*0.75);
figure;
hold on;
plot(usetime,'b*-');
plot(1:length(usetime),mean(usetime),'r-')
xlabel('Times')
ylabel('Used Time(s)')
set(gca,'xlim',[0,length(usetime)]);
%title('Scan - Unconnected to AP');
title(strcat(name{1},'_',num{1}));
end
end
