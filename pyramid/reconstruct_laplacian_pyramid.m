function R = reconstruct_laplacian_pyramid(pyr)

r = size(pyr{1},1);
c = size(pyr{1},2);
nlev = length(pyr);

% start with low pass residual
R = pyr{nlev};
filter = pyramid_filter;
for l = nlev - 1 : -1 : 1
    % upsample, and add to current level
    odd = 2*size(R) - size(pyr{l});
    R = pyr{l} + upsample(R,odd,filter);
end
