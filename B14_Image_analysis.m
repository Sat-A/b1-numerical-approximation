
sigma = 1;
len = 9;

arr = zeros(1,len);
for i = 1:len
    idx = i - ceil(len/2);
    arr(1,i) = 1/sqrt(2*pi*sigma^2)*exp(-(idx^2)/(2*sigma^2));
end
disp(arr)
disp(sum(arr))


f = [0.004 0.054 0.242 0.399 0.242 0.054 0.004];
i = [46 45 45 48 50 53 55 57 77 99 118 130 133 134 133 132 132 132 133];

disp(conv(i,f, 'same'))