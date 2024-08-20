noteNames = {'c', 'c#', 'd', 'd#', 'e', 'f', 'f#', 'g', 'g#', 'a', 'a#', 'b'};
frequencies = [523.25, 554.37, 587.33, 622.25, 659.25, 698.46, 739.99, 783.99, 830.61, 880.00, 932.33, 987.77];
notes = [noteNames; num2cell(frequencies)];

fs = 8000;
T = 0.5;
tau = 0.025;

myMusicData = {
    {'e', T}, {'d', T}, {'c', T}, {'d', T}, ...
    {'e', T}, {'e', T}, {'d', T*2}, ...
    {'e', T}, {'d', T}, {'c', T}, {'d', T}, ...
    {'e', T}, {'e', T}, {'d', T*2},
};

musicNotes = cell(1, length(myMusicData));
times = zeros(1, length(myMusicData));

for i = 1:length(myMusicData)
    musicNotes{i} = myMusicData{i}{1};
    times(i) = myMusicData{i}{2};
end

musicLength = (sum(times) + length(times) * tau) * fs;
music = zeros(1, musicLength);

for i = 1:length(musicNotes)
    startIndex = round((sum(times(1:i-1)) + (i-1) * tau) * fs) + 1;
    endIndex = round((sum(times(1:i-1)) + times(i) + (i-1) * tau) * fs);
    noteIndex = find(strcmp(notes(1, :), musicNotes{i}));
    frequency = frequencies(noteIndex);
    t = (startIndex-1)/fs:1/fs:(endIndex-1)/fs;
    music(startIndex:endIndex) = sin(2 * pi * frequency * t);
end

zeroParts = zeros(1, round(tau * fs));
for i = 1:length(musicNotes)
    endIndex = round((sum(times(1:i)) + i * tau) * fs);
    music(endIndex + 1 : endIndex + length(zeroParts)) = zeroParts;
end

audiowrite('mysong.wav', music, fs);

% part 2_3

for i = 1:length(musicNotes)
    startIndex = round((sum(times(1:i-1)) + (i-1) * tau) * fs) + 1;
    endIndex = round((sum(times(1:i-1)) + times(i) + (i-1) * tau) * fs);
    segment = music(startIndex:endIndex);
    fourier = fftshift(fft(segment));
    magnitude = abs(fourier);
    phase = angle(fourier);
    f = (-fs/2):(fs/length(segment)):(fs/2)-(fs/length(segment));
    [~, peakIndex] = max(magnitude);
    peakFrequency = abs(peakIndex * fs / length(segment) - fs / 2 - 1);
    frequencyDifferences = abs(frequencies - peakFrequency);
    [~, noteIndex] = min(frequencyDifferences);
    identifiedNote = noteNames{noteIndex};
    fprintf("Note: %s\n", identifiedNote);
end