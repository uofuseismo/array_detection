function   [y,header]=my_loadfiles(mydata)
%list all sac files in mydata directory
%and loop through to read sac files

data_path=sprintf('%s/*.sac',mydata);
listing=dir(data_path);

%Preallocate memory
y=cell(1,length(listing));
%--------------------------------------------------
parfor i=1:length(listing)
filename=sprintf('%s/%s',mydata,listing(i).name);
[D,~,H]=rdsac(filename);    
%------- add waveforms to a single cell -----------
y{1,i}=D;
%------- add headers to a single structure --------
header(i)=H;
end
%--------------------------------------------------
end