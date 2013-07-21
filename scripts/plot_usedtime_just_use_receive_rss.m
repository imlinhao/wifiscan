subfig_index = 0;
figure;
hold on;
% ylabel('Used Time(s)')
% xlabel('Receive Time(s)')
for name = {'gongsi','lijunfei','dajiang','pengfei','chaocan','qixu','chengkaitao','hao_ap_unconnected'}
%for name = {'lijunfei'}
subfig_index = subfig_index + 1;
%for num = {'1','2','3','4'}
for num = {'1'}
fid = fopen(strcat('data1\',name{1},'\receive_',num{1}));
receive = fscanf(fid, '%lf', inf);
fclose(fid);
%save first 300s data
origin = receive(1);
receive = sort(receive); % I think there exist print race problem, if want see this comment this line
receive=receive-origin;
receive = receive(find(receive<=300*1000));
usetime=diff(receive)/1000.0;

bigger_than_ten = find(usetime>10);
bigger_than_ten_num = length(bigger_than_ten)
sample_num = length(usetime)

%usetime = usetime(2:length(usetime)*0.75);
subplot(3,3,subfig_index);
hold on;
plot(receive(2:end)/1000.0,usetime,'b*-');
%plot(receive/1000.0,mean(usetime),'r-');
mean(usetime)
%title(strcat(name{1},'_',num{1}));
set(gca,'xlim',[0,300]);
xlabel(char('A'-1+subfig_index));

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


for name = {'chengkaitao'}
for num = {'1'}
fid = fopen(strcat('data1\',name{1},'\receive_',num{1}));
receive = fscanf(fid, '%lf', inf);
fclose(fid);

fid = fopen(strcat('data2\',name{1},'\scan_results_',num{1}));
rss = fscanf(fid, '%lf', inf);
fclose(fid);

origin = receive(1);
receive=receive-origin;
receive = receive(find(receive<=300*1000));
usetime=diff(receive)/1000.0;
subplot(3,3,9);

rss = rss((length(rss)-length(receive)+1):length(rss));
[haxes,hline1,hline2] = plotyy(receive(2:end)/1000.0,usetime,receive/1000.0,rss);
set(hline1,'Marker','*')
set(hline2,'Marker','o')
axes(haxes(1))
xlabel(char('G'));
set(haxes(1),'xlim',[0.5,2.5], 'ylim', [0,0.8],'xtick', [0.5:0.5:2.5], 'ytick', [0:0.2:0.8]);
axes(haxes(2))
set(haxes(2),'xlim',[0.5,2.5], 'ylim', [-26,-18], 'ytick', [-26:2:-18]);
ylabel('RSS(dBm)')

end
end
ma = axes();
%ylabel('Fingerprint Sampling Used Time(s)')
%xlabel('Fingerprint Received Time(s)')
set(ma,'Visible','off');
text(-0.07966616084977239, 0.2904967602591795,'Fingerprint Sampling Used Time (s)','Rotation',90);
text(0.3694992412746586, -0.10259179265658736,'Fingerprint Received Time (s)');