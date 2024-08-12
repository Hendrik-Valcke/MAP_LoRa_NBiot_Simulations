function loraSignal=generateLoraSignal(messageBits,SF,numSym)
    % % input:
    % % messageBits is a 1xn binary vector
    % % SF is the spreading factor and the amount of samples per symbol
    % % numSym is the number of symbols to generate SF*numSym should equal
    % %  the number of bits
    % % output:
    % % loraSignal is a complex vector of samples of (multiple) lora symbols
    SPS=2^SF;%samples per symbol
    if length(messageBits)/SF~=numSym
        error('there need to be SF databits per symbol')
    else
        %group SF bits together per symbol
        symbolBits=reshape(messageBits,[],numSym);%first column is the bits of the first symbol
        decimalSymbols=transpose(binaryVectorToDecimal(transpose(symbolBits)))%to check the value
        loraSignal=[];
        for i=1:numSym
            loraSignal=[loraSignal generateLoraSymbol(decimalSymbols(1,i),SF)];
        end
    end
     
end