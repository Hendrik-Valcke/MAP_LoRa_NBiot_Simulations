function demodulatedBits=demodQPSK(qpskSignal)
    %qpsk
    %rxQPSKSymbols = qpskSignal(:);
    demodulatedBits = zeros(length(qpskSignal)*2, 1);
    symbolMap=[1+1i, -1+1i, 1-1i, -1-1i] / sqrt(2); %normalized QPSK constellation points

    % Demodulate QPSK symbols to bits
    for k = 1:length(qpskSignal)
        [~, idx] = min(abs(qpskSignal(k) - symbolMap));
        demodulatedBits(2*k-1:2*k) = de2bi(idx-1, 2, 'left-msb');
    end
end