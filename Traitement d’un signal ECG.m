clear all
close all 
clc


load ("ecg.mat")




fe = 500 ; 
te = 1/fe;
N = 4170;
load('ecg.mat')
t=0:te:(N-1)*te;

subplot(2,2,1)
plot(t,ecg);
xlabel("temps");
ylabel("amplitude");

subplot(2,2,2)
fshift = (-N/2:N/2-1)*(fe/N);
spectre_ecg = fft(ecg);
plot(fshift,fftshift(2*abs(spectre_ecg)/N));
xlabel("frequence");
ylabel("amplitude"); 

subplot(2,2,3)
pass_haut_ideal = ones(size(ecg));
fc = 0.5; 
indexe_fc = ceil((fc*N)/fe);
pass_haut_ideal(1:indexe_fc)=0;
pass_haut_ideal(N-indexe_fc+1:N)=0;
f=(0:N-1)*(fe/N);


spectre_ecg_filtree = pass_haut_ideal .* spectre_ecg;

tmp_ecg_filre = ifft(spectre_ecg_filtree,'symmetric');
plot(t,tmp_ecg_filre);
title("ECG1")
xlabel("temps");
ylabel("amplitude");


%% Elimination bruit 50hz

pass_notch_ideal = ones(size(ecg));
fc = 50; 
indexe_fc = ceil((fc*N)/fe)+1;
pass_notch_ideal(indexe_fc)=0;
pass_notch_ideal(N-indexe_fc+1)=0;

spectre_ecg2_filtree = pass_notch_ideal .* fft(tmp_ecg_filre);

tmp_ecg2_filre = ifft(spectre_ecg2_filtree,'symmetric');
subplot(311)
plot(t,ecg);
title("ecg")

subplot(312)
plot(t,tmp_ecg2_filre);
title("tmp ecg2 filtre")

subplot(313)
plot(t,ecg-tmp_ecg2_filre);
title("ecg-tmp ecg2 filtre")

%% Elimination bruit hautes frequences 

pass_bas_ideal = zeros(size(ecg));
fc3 = 20; 
indexe_fc3 = ceil((fc3*N)/fe);
pass_bas_ideal(1:indexe_fc3)=1;
pass_bas_ideal(N-indexe_fc3+1:N)=1;


spectre_ecg3_filtree = pass_bas_ideal .* fft(tmp_ecg2_filre);

tmp_ecg3_filre = ifft(spectre_ecg3_filtree,'symmetric');

subplot(311)
plot(t,ecg);
title("ecg")

subplot(312)
plot(t,tmp_ecg2_filre)
title("tmp ecg2 filtre")

subplot(313)

plot(t,tmp_ecg3_filre)
title("tmp ecg3 filtre")

[c,lags] = xcorr(tmp_ecg3_filre,tmp_ecg3_filre);
stem(lags/fe,c)









