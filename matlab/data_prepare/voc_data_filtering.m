trainval=importdata('/home/ai/data/VOCdevkit/VOCMY/ImageSets/Main/train.txt','0',36000);
tv=fopen('te.txt','w');
tval=fopen('test.txt','w');
for i=1:size(trainval,1)
  i
  xmlpath=strcat('/home/ai/data/Annotations/',strcat(trainval{i},'.xml'));
  info=xml_read(xmlpath);
  for j=1:size(info.object,1)
    if (strcmp(info.object(j).name,'person')==1 || strcmp(info.object(j).name,'dog')==1)
      fprintf(tv, '%s %s %g %g %g %g\n', info.filename,info.object(j).name,...
        info.object(j).bndbox.xmin,info.object(j).bndbox.ymin,info.object(j).bndbox.xmax,info.object(j).bndbox.ymax);
      fprintf(tval,'%s\n',info.filename(1:length(info.filename)-4));
    end
  end
end
