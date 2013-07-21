subfig_index = 0;
figure;
hold on;
% ylabel('Used Time(s)')
% xlabel('Receive Time(s)')
%for name = {'gongsi','lijunfei','dajiang','pengfei','chaocan','qixu','chengkaitao','hao_ap_unconnected'}
subfig_index = subfig_index + 1;
for name = {'hao_ap_unconnected'}
%for num = {'1','2','3','4'}
for num = {'1'}
fid = fopen(strcat('data1\',name{1},'\wpa_receive_',num{1}));
receive = fscanf(fid, '%lf', inf);
fclose(fid);

fid = fopen(strcat('data1\',name{1},'\wpa_start_',num{1}));
start = fscanf(fid, '%lf', inf);
fclose(fid);
%save first 300s data
origin = receive(1);
receive = receive-origin;
receive = receive(find(receive<=300));
usetime=diff(receive);


bigger_than_ten = find(usetime>10);
bigger_than_ten_num = length(bigger_than_ten)
sample_num = length(usetime)

%usetime = usetime(2:length(usetime)*0.75);
%subplot(3,3,subfig_index);
hold on;
plot(receive(3:end),usetime(2:end),'b*-');
%plot(receive/1000.0,mean(usetime),'r-');
mean(usetime)
%title(strcat(name{1},'_',num{1}));
set(gca,'xlim',[0,300],'ylim',[0.8,1]);
%xlabel(char('A'-1+subfig_index));
xlabel('Fingerprint Received Time (s)');
ylabel('Fingerprint Sampling Time(s)');

% plot(rss,'k*-');
% plot(1:length(rss),mean(rss),'r-')

% rss = rss((length(rss)-length(receive)+1):length(rss));
% [haxes,hline1,hline2] = plotyy(receive/1000.0,usetime,receive/1000.0,rss);
% set(hline1,'Marker','o')
% set(hline2,'Marker','*')
% xlabel('Receive Time(s)')
% axes(haxes(1))
% set(haxes(1),'xlim',[0,300]);
% ylabel('Used Time(s)')
% axes(haxes(2))
% set(haxes(2),'xlim',[0,300]);
% ylabel('RSS(dBm)')
%set(gca,'xlim',[0,300]);
%title('Scan - Unconnected to AP');
end
end


