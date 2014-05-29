% Change default axes fonts.
set(0,'DefaultAxesFontName', 'Arial')
set(0,'DefaultAxesFontSize', 14)

% Change default text fonts.
set(0,'DefaultTextFontname', 'Arial')
set(0,'DefaultTextFontSize', 14)

% Change default plot line colours
set(0,'DefaultAxesColorOrder',[255 116 0; 0 153 153; 0 204 0; 255 0 0] ./ 255);

% MICROBENCHMARKS

Y =    [ 100.00  99.38  289.96          % get*Size
         100.00  87.82  156.89          % initIDs
         100.00 100.25  100.19          % generateKeys
         100.00 100.90  100.29          % encryptData
         100.00 100.18   99.54          % decryptData
       ];
       
errY = [   6.94   6.58   32.12          % get*Size
          35.81  31.11   27.95          % initIDs
           7.17   3.91    3.92          % generateKeys
           1.29   1.44    0.44          % encryptData
           1.47   1.32    1.29          % decryptData
       ];

xlab = { 'getPublicKeySize'
         'initIDs'
         'generateKeys' 
         'encryptData'
         'decryptData'
       };

ylab = 'running time diff / %';

lege = { 'JamVM' 'JamVM (w/o direct buffers)' 'Qishr' };

hfig = figure;
set(hfig, 'Position', [0 0 1024 576]);
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


% ACCESS CONTROL OVERHEAD

Y =    [   1.70   1.05    0.23          % NULL
           1.40   1.06    0.68          % Always grant
           1.71   1.02    0.92          % 1 comparison
           1.62   1.08    1.06          % 4 comparisons
           1.62   1.08    1.26          % 8 comparisons
           1.63   1.11    1.43          % 16 comparisons
       ];
yrange = [6:-1:1];
       
xlab = { '16 comparisons' 
         '8 comparisons' 
         '4 comparisons' 
         '1 comparison' 
         'Always grant'
         'NULL'
       };

ylab = 'invocation time / ms';

lege = { 'JamVM' 'Qishr JNI overhead' 'Security Manager overhead' };

hfig = figure;
set(hfig, 'Position', [0 0 1024 576]);
colormap('summer');
handle = barh(yrange, Y, 'stack');
grid on
set(gca, 'YTickLabel', xlab, 'XTick', 1:numel(xlab))
xlabel(ylab);
legend(handle, lege);

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

xlab = 'matrix size';
ylab = 'time to square / s';

xrange = 1:8;
yrange = [0 2];

hfig = figure;
set(hfig, 'Position', [0 0 1024 576]);
colormap('summer');
handle = plot(xrange, Y, 'LineWidth',2);
colormap('summer');
legend(handle, lege);
ylim(yrange);
xlabel(xlab);
ylabel(ylab);
grid on;
