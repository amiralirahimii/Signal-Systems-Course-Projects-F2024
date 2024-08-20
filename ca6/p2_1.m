noteNames = {'c', 'c#', 'd', 'd#', 'e', 'f', 'f#', 'g', 'g#', 'a', 'a#', 'b'};
frequencies = [523.25, 554.37, 587.33, 622.25, 659.25, 698.46, 739.99, 783.99, 830.61, 880.00, 932.33, 987.77];
notes = [noteNames; num2cell(frequencies)];

fs = 8000;
T = 0.5;
tau = 0.025;

music_data = {{'d', T/2}, {'d', T/2}, {'g', T}, {'f#', T}, {'d', T},...
    {'d', T/2}, {'e', T/2}, {'e', T/2}, {'d', T/2}, {'f#', T/2}, {'d', T/2}, {'e', T/2}, {'d', T/2}, {'e', T/2}, {'f#', T/2}, {'e', T/2},...
    {'d', T}, {'e', T}, {'f#', T}, {'e', T}, ...
    {'d', T/2}, {'e', T/2}, {'e', T/2}, {'d', T/2}, {'f#', T/2}, {'d', T/2}, {'e', T},...
    {'d', T}, {'e', T/2}, {'d', T/2}, {'f#', T}, {'e', T}, ...
    {'d', T}, {'e', T/2}, {'d', T/2}, {'f#', T}, {'e', T}, ...
    {'d', T/2}, {'d', T/2}, {'e', T}, {'f#', T/2}, {'e', T/2}, {'f#', T}, ...
    {'f#', T/2}, {'e', T/2}, {'f#', T}, {'f#', T}, {'d', T}
};

musicNotes = cell(1, length(music_data));
times = zeros(1, length(music_data));

for i = 1:length(music_data)
    musicNotes{i} = music_data{i}{1};
    times(i) = music_data{i}{2};
end

musicLength = (sum(times) + length(times) * tau) * fs;
music = zeros(1, musicLength);

for i = 1:length(musicNotes)
    startIndex = round((sum(times(1:i-1)) + (i-1) * tau) * fs) + 1;
    endIndex = round((sum(times(1:i-1)) + times(i) + (i-1) * tau) * fs);
    index = find(strcmp(notes(1, :), musicNotes{i}));
    frequency = frequencies(index);
    t = (startIndex-1)/fs:1/fs:(endIndex-1)/fs;
    music(startIndex:endIndex) = sin(2 * pi * frequency * t);
end

zeroParts = zeros(1, round(tau * fs));
for i = 1:length(musicNotes)
    endIndex = round((sum(times(1:i)) + i * tau) * fs);
    music(endIndex + 1 : endIndex + length(zeroParts)) = zeroParts;
end

sound(music, fs);