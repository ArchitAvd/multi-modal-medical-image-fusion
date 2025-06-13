function pyr = laplacian_pyramid(I,nlev)

r = size(I,1);
c = size(I,2);

if ~exist('nlev')
    % compute the highest possible pyramid    
    nlev = floor(log(min(r,c)) / log(2));
end

% recursively build pyramid
pyr = cell(nlev,1);
filter = pyramid_filter;
J = I;
for l = 1:nlev - 1
    % apply low pass filter, and downsample
    I = downsample(J,filter);
    odd = 2*size(I) - size(J);  
    pyr{l} = J - upsample(I,odd,filter);
    J = I; % continue with low pass image
end
pyr{nlev} = J; 

  


