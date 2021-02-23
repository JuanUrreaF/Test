clc, clearvars, close all
load DataBase
load Plataforma
con=0;
for i=1:2:length(plataforma)
   con=con+1;
    Pos(:,con)=find(ProteinID==plataforma(i,1) | ProteinID==plataforma(i+1,1));
end

 Data=Data';
X=[];
for i=1:length(plataforma)/2
     A(i,:)=corr(Data(:,Pos(1,i)),Data(:,Pos(2,i)));
     if A(i,:) >= 0.95
        X=[X,(Data(1:end-1,Pos(1,i))+Data(1:end-1,Pos(2,i)))/2];
     end
end

Proteinas=plataforma(Pos(1,:),2);
ProteinasSelec=Proteinas(A>0.95);
[clases,~,Y]=unique(Diagnostico(1,1:end-1));