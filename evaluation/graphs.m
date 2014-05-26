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
