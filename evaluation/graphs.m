% Change default axes fonts.
set(0,'DefaultAxesFontName', 'Arial')
set(0,'DefaultAxesFontSize', 14)

% Change default text fonts.
set(0,'DefaultTextFontname', 'Arial')
set(0,'DefaultTextFontSize', 14)

% Change default plot line colours
set(0,'DefaultAxesColorOrder',[0 153 153; 0 204 0; 255 0 0; 255 116 0] ./ 255);

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
           1.40   1.06    0.68          % Always allow
           1.71   1.02    0.92          % 1 comparison
           1.62   1.08    1.06          % 4 comparisons
           1.62   1.08    1.26          % 8 comparisons
           1.63   1.11    1.43          % 16 comparisons
       ];
yrange = [6:-1:1];
ylims = [0 5];
       
xlab = { '16 comparisons' 
         '8 comparisons' 
         '4 comparisons' 
         '1 comparison' 
         'Always allow'
         'null'
       };

ylab = 'invocation time / ms';

lege = { 'Unsandboxed' 'Qishr overhead' 'Security Manager overhead' };

hfig = figure;
set(hfig, 'Position', [0 0 1024 576]);
colormap('summer');
handle = barh(yrange, Y, 'stack');
grid on
set(gca, 'YTickLabel', xlab, 'XTick', 1:numel(xlab))
xlabel(ylab);
legend(handle, lege);

% MATRIX SQUARING

Y = [    12573600   19999590    89583520
         31470750   23040920   103769760
         98105560   35092020   131222840
        223445990   41620980   161358930
        426942360   75217960   235046250
        758072290  113915650   326598270
       1078028040  157863730   444756020
       1729112580  230473620   633423460
    ] .* (10^(-9));

errY = [   21138      36513      462207
           42027      10541      542089
          516295     265726      664564
          760899     160689      624300
          759452     491690      762400
         1568900     666282      710645
          766451     662646      557524
         5933980     774123      880832
       ] .* (10^(-9));

lege = { 'JamVM Java' 'JamVM JNI' 'Qishr JNI' };

xlab = 'matrix size';
ylab = 'time to square / s';

xrange = 1:8;
xlims = [1 8];
ylims = [0 1];

hfig = figure;
set(hfig, 'Position', [0 0 1024 576]);
colormap('summer');
% errorbar(Y, errY);
handle = plot(xrange, Y, 'LineWidth',2);
colormap('summer');
legend(handle, lege);
xlabel(xlab);
ylabel(ylab);
grid on;
% axes1 = axes('Parent', hfig);
% xlim(axes1, xlims);
ylim(ylims);




% MATRIX SQUARING - OVERHEAD COMPARISON

Y =     [ 347.93
          350.37
          273.94
          287.69
          212.49
          186.70
          181.73
          174.84
          141.19
          124.75
          164.68
          146.77
          138.31
          142.77
          139.06
          114.59
          125.21
          125.36
          125.09
          121.22
        ];

errY = [    2.49
            2.40
            2.65
            1.89
            1.67
            1.21
            0.77
            0.72
            0.38
            1.24
            1.22
            0.87
            1.23
            1.18
            1.11
            1.00
            0.90
            0.82
            0.71
            0.59 
       ];

xrange = 1:20;
xlims = [1 8];
ylims = [0 400];

xlab = 'matrix size';
ylab = 'Qishr overhead / %';

hfig = figure;
set(hfig, 'Position', [0 0 1024 576]);
handle = plot(xrange, Y, 'LineWidth',2);
hold on
errorbar(xrange, Y, errY);
xlabel(xlab);
ylabel(ylab);
grid on;
ylim(ylims);