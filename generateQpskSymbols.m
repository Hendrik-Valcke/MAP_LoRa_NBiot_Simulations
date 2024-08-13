function qpskSymbols = generateQpskSymbols(messageBits)
    
    %map bits to qpsk symbols
    messageInts=bit2int(messageBits,2)% grouped by 2 bits, converted to dec
    symbolMap=[1+1i, -1+1i, 1-1i, -1-1i] / sqrt(2); %normalized QPSK constellation points
    messageSymbols = zeros(size(messageInts, 1), 1);
    for k = 1:size(messageInts, 1)
        idx = messageInts(k) + 1; %map index
        messageSymbols(k) = symbolMap(idx); %symbolmap
    end
    qpskSymbols=messageSymbols;
end