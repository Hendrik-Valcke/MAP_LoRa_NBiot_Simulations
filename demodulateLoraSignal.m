function decodedBits=demodulateLoraSignal(loraSignal,SF,numSym)

    SPS=2^SF;
    %generate base downchirp
    base_down_chirp=zeros(1,SPS);
    k=0;
    for n=1:SPS
        if k>= (2^SF)
            k=k-2^SF;
        end
        k=k+1;
        base_down_chirp(n)=(1/(sqrt(2^SF)))*exp(-1i*2*pi*k*(k/(2^SF*2)));
    end

    dechirpedSymbols=zeros(1,numSym);
    for i=1:numSym
    dechirped=loraSignal(((i-1)*SPS)+1:i*SPS).*base_down_chirp;

    corrs=(abs(fft(dechirped)).^2);
    [~, ind]=max(corrs);
    dechirpedSymbols(i)=ind-1; %-1 because DC is counted in fft so all bins are +1
    end
    dechirpedSymbols;
    decodedBitsMatrix=transpose(decimalToBinaryVector(dechirpedSymbols,SF));
    decodedBits=transpose(reshape(decodedBitsMatrix,[],SF*numSym));
end