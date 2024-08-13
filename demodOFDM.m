function demodulatedSignal=demodOFDM(ofdmSignal,numSC,SCS,cpLen)
    
    %cp
    numSym=length(ofdmSignal)/(numSC+cpLen);
    rxSymbolsWithCP = reshape(ofdmSignal, [], numSym);
    %rxSymbolsWithCP
    rxSymbols = rxSymbolsWithCP(cpLen+1:end, :);%remove cp from top of matrix (cplen +2 because matlab takes from the next sample to the end)
    %fft
    rxSymbolsFreq = fft(rxSymbols, numSC);% fft to freq domain
    demodulatedSignal=rxSymbolsFreq;

end