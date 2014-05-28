% MICROBENCHMARKS

Y =    [ 100.00  99.38  289.96          % get*Size
         100.00  87.82  156.89          % initIDs
         100.00 100.25  100.19          % generateKeys
         100.00 100.12  116.61          % static webpage
         100.00 100.31  117.64          % file server
       ];
       
errY = [   6.94   6.58   32.12          % get*Size
          35.81  31.11   27.95          % initIDs
           7.17   3.91    3.92          % generateKeys
           9.33   8.34   10.18          % static webpage
           1.85   2.03    2.26          % file server
       ];

xlab = { 'getPublicKeySize'
         'initIDs'
         'generateKeys' 
         'static webpage'
         'file server'
       };

ylab = 'running time diff / %';

lege = { 'JNI with direct buffers' 'JNI without direct buffers' 'Qishr' };

figure
colormap('summer');
handle = barwitherr(errY, Y);
grid on
set(gca, 'XTickLabel', xlab, 'XTick', 1:numel(xlab))
ylabel(ylab);
legend(handle, lege);

% add a horizontal line at 100%
hold on
xlim = get(gca, 'xlim');
% plot(xlim, [100 100])



% MATRIX SQUARING

Y = [   20051730	  22965120	 29275540	 132895680
        72656810	  70843000	 34017630	 194965030
       140426670	 114612880	 55014020	 175708740
       386452090	 377327140	 82494170	 208948370
       628455040	 586391480	160151800	 353531910
      1039968580	1027729730	216342450	 399069880
      1194118440	1557415040	254537120	 673941470
      2011892140	2260884640	277579100	 861017460
%     2859364800	2875618930	485017540	1063850370
%     3851731310	4030639070	743922920	1350992150
    ] * (10^(-9));

lege = { 'JamVM Java' 'Qishr Java' 'JamVM JNI' 'Qishr JNI' };

xrange = 1:8;
yrange = [0 2];

figure;
handle = plot(xrange, Y, 'LineSmoothing', 'on');
legend(handle, lege);
ylim(yrange);
grid on;
