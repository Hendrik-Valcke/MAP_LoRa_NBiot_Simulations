function   plotSpectrogram(s,f,t,centerfreq)

spectrogram_dB = 10 * log10(abs(s));
figure;
imagesc(t, (f +centerfreq)./1e6, spectrogram_dB);
axis xy;  % Flip the y-axis to align with the conventional spectrogram orientation
xlabel('Time (s)');
ylabel('Frequency (MHz)');
title('Spectrogram');
min=75;
max=125;
clim([min, max]);
% Add a label to the colorbar
h = colorbar;
h.Label.String = "Power (dB)";
h.Label.Rotation = 90;
h.Label.Position(1) = 3;
h.Label.VerticalAlignment = "bottom";
%colorbar;  % Add a color bar for the magnitude scale
colormap;
%uicontrol('Visible','off')
end