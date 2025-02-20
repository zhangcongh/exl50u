shotnum=1092;
chns='mir026';
datatime='0:5:1e-5';
Fs=1e5;
y=downloaddata(shotnum,chns,'-1:7:1e-5',0,0);
[y,time]=downloaddata(shotnum,chns,datatime,0,0);
window = hamming(256); % 窗函数
noverlap = 128; % 重叠样本数
nfft = 2048; % FFT点数

% 进行STFT并绘制时频图
[s, f, t, p] = spectrogram(y, window, noverlap, nfft, Fs, 'yaxis');
p_db = 10*log10(abs(p)); % 计算分贝值
figure('Color',[1,1,1]);pcolor(t, f/1000, p_db ); shading interp;
cb = colorbar;
ylabel(cb, '功率(dB)');
clim([max(p_db(:))-30, max(p_db(:))-10]);
axis xy; axis tight; colormap(jet); 
xlabel('Time (s)');
ylabel('Frequency (kHz)');
title('Time-Frequency Analysis');
set(gca, 'FontWeight', 'bold', 'FontSize', 16, 'LineWidth', 3.5, 'XMinorTick', 'on', 'YMinorTick', 'on','ticklength',[0.02 0.02],'Xgrid','on','Ygrid','on','Box','on')
%%
shotnum=1093;
chn='mir013';
Fs=1e5;
data_start=-1;
data_end=5;
window=1024*20;
overlap=0.5;
flat_start=1-data_start;
flat_end=5-data_start;
datatime=[num2str(data_start),':',num2str(data_end),':',num2str(1/Fs)];

[data,time]=downloaddata(shotnum,chn,datatime,1,0);

autoSpectrum(data,Fs,window,flat_start, flat_end,1);
figure('Color',[1 1 1]);autoSpectroscopy(data,Fs,overlap,window,flat_start,flat_end,1);

%%
ylabel('Mirnov(V)')
ylabel('ICS(kA)')

















