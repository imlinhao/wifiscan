origin = 1367030518.134633; % wpa_receive(1)
wpa_start = [1367030518.164482,1367030518.809986,1367030519.030780,1367030519.902080]-origin;
wpa_receive = [1367030518.134633,1367030519.003092,1367030519.873438]-origin;
start = [1367030518163,1367030519029,1367030519899]-origin*1000;
receive = [1367030518153,1367030519024,1367030519895]-origin*1000;
wpa_start = wpa_start * 1000.0;
wpa_receive = wpa_receive * 1000.0;
figure;
hold on;
plot([0,3000],[1.2,1.2],'b--');
plot(start,1.2,'r*');
plot(receive,1.2,'kx');

plot([0,3000],[0.5,0.5],'b--');
plot(wpa_start,0.5,'ro');
plot(wpa_receive,0.5,'kd');
%rectangle('position',[0.35,0.2,0.024,0.297]);
rectangle('Position',[830,0.3,100,1.1],'linestyle','--')
annotation('arrow',[0.41 0.5],[0.48 0.55],'LineStyle','-');
set(gca,'xlim',[0,3000],'ylim',[0,3],'ytick',[0.5,1.2],'yticklabel',{'wpa_supplicant','SDK API'});
xlabel('Fingerprint Received Time (ms)');


small_axes = axes('position',[0.52,0.52,0.34,0.39]);
hold on;
plot([860,900],[1.2,1.2],'b--');
plot(start(2),1.2,'r*');
plot(receive(2),1.2,'kx');

plot([860,900],[0.5,0.5],'b--');
plot(wpa_start(3),0.5,'ro');
plot(wpa_receive(2),0.5,'kd');
set(gca,'xlim',[860,900],'ylim',[0,1.5],'ytick',[0.5,1.2],'yticklabel',{'wpa_supplicant','SDK API'});

