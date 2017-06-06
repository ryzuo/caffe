%%
%
%%
% Change the 4 variables below if needed
xmlfilepath='/home/ai/data/VOCdevkit/VOCMY/Annotations/';
txtsavepath='/home/ai/data/VOCdevkit/VOCMY/ImageSets/Main/';
trainval_percent=0.8;% Percentage of trainval data in the entire data collection, the rests are for test data
train_percent=0.5;% Percentage of train data in the trainval collection, the rests are for val

xmlfile=dir(xmlfilepath);
numOfxml=length(xmlfile)-2;% Amount entire data collection, except . and ..


trainval=sort(randperm(numOfxml,floor(numOfxml*trainval_percent)));
test=sort(setdiff(1:numOfxml,trainval));


trainvalsize=length(trainval);% amount of trainval
train=sort(trainval(randperm(trainvalsize,floor(trainvalsize*train_percent))));
val=sort(setdiff(trainval,train));


ftrainval=fopen([txtsavepath 'trainval.txt'],'w');
ftest=fopen([txtsavepath 'test.txt'],'w');
ftrain=fopen([txtsavepath 'train.txt'],'w');
fval=fopen([txtsavepath 'val.txt'],'w');


for i=1:numOfxml
      if ismember(i,trainval)
            fprintf(ftrainval,'%s\n',xmlfile(i+2).name(1:end-4));
            if ismember(i,train)
                fprintf(ftrain,'%s\n',xmlfile(i+2).name(1:end-4));
            else
                fprintf(fval,'%s\n',xmlfile(i+2).name(1:end-4));
            end
      else
             fprintf(ftest,'%s\n',xmlfile(i+2).name(1:end-4));
      end
end
fclose(ftrainval);
fclose(ftrain);
fclose(fval);
fclose(ftest);
