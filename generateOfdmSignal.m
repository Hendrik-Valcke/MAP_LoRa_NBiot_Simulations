function ofdmTimeSignal=generateOfdmSignal(inputSignal,numSC,SCS,cpLen)
    % %input:
    % % complex signal
    % % number of subcarriers
    % % subcarrier spacing
    % % cyclic prefix length

    % % the signal is divided across n carriers, those carriers are added
    % together (ifft)
    numSym=length(inputSignal)/numSC;
    SPS=numSC;%samples per symbol
    ofdmMatrix = zeros(numSC,numSym);
    % %every column represents 12 carriers for 1 ofdm symbol
    % %the entire column/symbol is transmitted at once at different freq
    for symbolIdx =1:numSym
        ofdmMatrix(:,symbolIdx)=inputSignal((symbolIdx-1)*numSC+1:numSC*symbolIdx);
    end
    timeDomainSymbolMatrix = ifft(ofdmMatrix, numSC);%time domain frame, 12 samples per symbol
    % %every colum contains the sample of the symbol over time, the column
    % %elements are transmitted one by one
    cp=timeDomainSymbolMatrix(end-(cpLen-1):end,:);
    timeDomainSymbolMatrix=[cp; timeDomainSymbolMatrix];%add cp

    ofdmTimeSignal=reshape (timeDomainSymbolMatrix,[],1);
end