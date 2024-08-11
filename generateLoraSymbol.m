function loraSymbol = generateLoraSymbol(symbolValue,SF)
    if symbolValue>=2^SF %symbolValue is too big for SF bits, e.g. a symbol with SF= 7 can only have a symbolvalue from 0-127
        error('symbolValue is too big for SF bits')
    else
        SPS=2^SF; %samples per symbol
        k=symbolValue;
        loraSymbol=zeros(1,SPS);

        for n=1:SPS
            if k >= (2^SF)
                k=k-2^SF;
            end 
            k = k+1;
            loraSymbol(n)=(1/(sqrt(2^SF)))*exp(1i*2*pi*k*(k/((2^SF)*2)));
        end

    end
end