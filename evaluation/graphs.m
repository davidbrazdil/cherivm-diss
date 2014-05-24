Y =    [ 100.00  99.38  289.96          % get*Size
         100.00  87.82  156.89          % initIDs
         100.00 100.25  100.19          % generateKeys
           4      5       6    ];
       
errY = [   6.94   6.58   32.12          % get*Size
          35.81  31.11   27.95          % initIDs
           7.17   3.91    3.92          % generateKeys
           0.00   0.00    0.00 ];

xlab = { 'getPublicKeySize'
         'initIDs'
         'generateKeys' };

ylab = 'running time diff / %'

figure
colormap('summer');
barwitherr(errY, Y);
set(gca, 'XTickLabel', xlab, 'XTick', 1:numel(xlab))
ylabel(ylab);

% add a horizontal line at 100%
hold on
xlim = get(gca, 'xlim');
plot(xlim, [100 100])