% Change default axes fonts.
set(0,'DefaultAxesFontName', 'Arial')
set(0,'DefaultAxesFontSize', 14)

% Change default text fonts.
set(0,'DefaultTextFontname', 'Arial')
set(0,'DefaultTextFontSize', 14)

% Change default plot line colours
set(0,'DefaultAxesColorOrder',[0 153 153; 0 204 0; 255 0 0; 255 116 0] ./ 255);

% MICROBENCHMARKS

Y =    [ 289.96  % 100.00  99.38            % get*Size
         156.89  % 100.00  87.82            % initIDs
         100.19  % 100.00 100.25            % generateKeys
         100.29  % 100.00 100.90            % encryptData
          99.54  % 100.00 100.18            % decryptData
       ];
       
errY = [  32.12  %  6.94   6.58             % get*Size
          27.95  % 35.81  31.11             % initIDs
           3.92  %  7.17   3.91             % generateKeys
           0.44  %  1.29   1.44             % encryptData
           1.29  %  1.47   1.32             % decryptData
       ];

xlab = { 'getPublicKeySize'
         'initIDs'
         'generateKeys' 
         'encryptData'
         'decryptData'
       };

ylab = 'running time diff / %';

% lege = { 'JamVM' 'JamVM (w/o direct buffers)' 'Qishr' };

hfig = figure;
set(hfig, 'Position', [0 0 1024 576]);
colormap('summer');
handle = barwitherr(errY, Y);
grid on
set(gca, 'XTickLabel', xlab, 'XTick', 1:numel(xlab))
ylabel(ylab);
% legend(handle, lege);

% add a horizontal line at 100%
hold on
xlim = get(gca, 'xlim');
plot(xlim, [100 100])


% ACCESS CONTROL OVERHEAD







data1=       [ 1410481.3     424236.32
1114138.6     286276.03
1406415.1     462650.37
1320612.8     369251.74
1326079.3     378359.94
1348473.7        399127 ];
data2 =      [   2531886     690857.32
2231398.1     595630.55
2516387.4     717025.27
2479752.6     648697.21
2460003.6     681044.19
2513757.6     656390.69 ];
data3 =      [ 2791131.8     705229.34
2964179.6     679478.89
3506314.1     697521.17
3606836.4     683634.19
3820618.7      676469.7
4033441.6     628581.24 ];

Y = [ data1(:,1)     (data2(:,1)-data1(:,1))       (data3(:,1)-data2(:,1)) ] .* (10^(-6));
errY = [ data1(:,2) data2(:,2) data3(:,2) ] .* (10^(-6));
absY = [ data1(:,1) data2(:,1) data3(:,1) ] .* (10^(-6));
           
yrange = [6:-1:1];
ylims = [0 5];
       
xlab = { 'null'
         'Always allow'
         '1 comparison' 
         '4 comparisons' 
         '8 comparisons' 
         '16 comparisons' 
       };

ylab = 'invocation time / ms';

lege = { 'Unsandboxed' 'Access control disabled' 'Access control enabled' };

hfig = figure;
set(hfig, 'Position', [0 0 1024 576]);
colormap('summer');
handle = hbarwitherr(errY, absY, absY);
grid on
set(gca, 'XTickLabel', xlab, 'XTick', 1:numel(xlab))
rotateXLabels(gca,0); 
ylabel(ylab);
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