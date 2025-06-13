close all;
clear all;
clc;
fileFolder=fullfile('./MyDatasets/CT-MRI/test/CT');
dirOutput=dir(fullfile(fileFolder,'*.png')); 
fileNames = {dirOutput.name};
dir ='./MyDatasets/CT-MRI/test/CT';
for numii =1:3
    path = fullfile(dir, fileNames{numii});
    img  = imread(path);
    figure;imshow(img,[]);
    caption = sprintf('MRI Scan:%*d',{numii});
    title(caption, 'FontSize', 14);
end
