clc;
clearvars -except npac* natl* spac* sind* satl artic ecco*
% pat='/net/alpha/exports/sciences/data/LPO_ISAS/ANA_ISAS15_ARGO/field';
% pat='/net/alpha/exports/sciences/data/REFERENCE_DATA/OCEAN_REP/EN4/DATA/G10/ANALYSIS'
% pat='/net/alpha/exports/sciences/data/REFERENCE_DATA/OCEAN_REP/ECCOV4/DATA/Release3/interp_monthly/EVEL
pat='/net/alpha/exports/sciences/data/REFERENCE_DATA/OCEAN_REP/ECCOV4/DATA/Release3/interp_monthly';
% p = genpath('../../lib');
addpath (pat);
fold=dir(pat);
fold=fold(6:end);
% fold=dir([pat,'/*nc']);

for k=1:length(fold)
    name=['/',fold(k).name];
    if k==1
        u=[];
        list=dir([pat,name,'/*.nc']);list=list(15:24);% 2006-2015
        for i=1:length(list)
            if i==1
                la=ncread ([pat,name,'/',list(i).name],'lat');
                lo=ncread ([pat,name,'/',list(i).name],'lon');
%                 lo(lo<0)=lo(lo<0)+360;                
%                 ilo=find(lo(:,1)>=293);
                ilo=find(lo(:,1)>=-10 & lo(:,1)<= 15);
%                 ilo1=find(lo(:,1)<=20);
%                 ilo=unique([ilo;ilo1]);                             
                ila=find(la(1,:)>=-15 & la(1,:)<=10);
                lo=lo(ilo,ila);la=la(ilo,ila);
                X=lo;Y=la;la=la(1,:);lo=lo(:,1);
            end
            uvel=ncread ([pat,name,'/',list(i).name],'EVEL');uvel=uvel(ilo,ila,:,:);%'lon lat dep tim'
            u=cat(4,u,uvel);
        end
    elseif k==2
        ued=[];
        list=dir([pat,name,'/*.nc']);list=list(15:24);% 2006-2015
        for i=1:length(list)
            ueddy=ncread ([pat,name,'/',list(i).name],'EVELSTAR');ueddy=ueddy(ilo,ila,:,:);%'lon lat dep tim'
            ued=cat(4,ued,ueddy);
        end
    elseif k==4
        v=[];
        list=dir([pat,name,'/*.nc']);list=list(15:24);% 2006-2015
        for i=1:length(list)
            
            vvel=ncread ([pat,name,'/',list(i).name],'NVEL');vvel=vvel(ilo,ila,:,:);
            v=cat(4,v,vvel);
        end   
    elseif k==5
        ved=[];
        list=dir([pat,name,'/*.nc']);list=list(15:24);% 2006-2015
        for i=1:length(list)
            veddy=ncread ([pat,name,'/',list(i).name],'NVELSTAR');veddy=veddy(ilo,ila,:,:);%'lon lat dep tim'
            ved=cat(4,ved,veddy);
        end        
    elseif k==3
        mld=[];
        list=dir([pat,name,'/*.nc']);list=list(15:24);% 2006-2015
        for i=1:length(list)
            
            m=ncread ([pat,name,'/',list(i).name],'MXLDEPTH');m=m(ilo,ila,:);
            mld=cat(3,mld,m);
            % % %                         t=datenum(ncread ([pat,name,'/',list(i).name],'tim'))+datenum([1992 01 01 0 0 0]);           
        end
    elseif k==7
        sal=[];
        list=dir([pat,name,'/*.nc']);list=list(15:24);% 2006-2015
        for i=1:length(list)
            %             ncdisp ([pat,name,'/',list(i).name])
            z=ncread ([pat,name,'/',list(i).name],'dep');
            for j=1:length(la)
                p = gsw_p_from_z(-z,la(j));
                for ii=1:length(lo)
                    pres(ii,j,:)=p;
                end
            end
            s=ncread ([pat,name,'/',list(i).name],'SALT');s=s(ilo,ila,:,:);%'lon lat dep tim'
            sal=cat(4,sal,s);
        end
    elseif k==8
        
        temp=[];
        list=dir([pat,name,'/*.nc']);list=list(15:24);% 2006-2015
        for i=1:length(list)
            %             ncdisp ([pat,name,'/',list(i).name])
            t=ncread ([pat,name,'/',list(i).name],'THETA');t=t(ilo,ila,:,:);%'pot temp
            temp=cat(4,temp,t);
        end
%         for jj=1:120
%             for ii=1:length(z)
%                 [SA(:,:,ii,jj), ~] = gsw_SA_from_SP(squeeze(sal(:,:,ii,jj)),p(ii),lo,la);
%             end
%         end
    elseif k==9
        w=[];
        list=dir([pat,name,'/*.nc']);list=list(15:24);% 2006-2015
        for i=1:length(list)
            
            wvel=ncread ([pat,name,'/',list(i).name],'WVELMASS');wvel=wvel(ilo,ila,:,:);
            w=cat(4,w,wvel);
        end
    elseif k==10
        wed=[];
        list=dir([pat,name,'/*.nc']);list=list(15:24);% 2006-2015
        for i=1:length(list)
            
            wveled=ncread ([pat,name,'/',list(i).name],'WVELSTAR');wveled=wveled(ilo,ila,:,:);
            wed=cat(4,wed,wveled);
        end
    end
end
% CT=nan(size(SA,1),size(SA,2),size(SA,3),size(SA,4));
% ro=CT;sp=ro;
% for k=1:120
% % CT(:,:,:,k)= gsw_CT_from_pt(SA(:,:,:,k),temp(:,:,:,k));
% ro(:,:,:,k)=gsw_rho(SA(:,:,:,k),CT(:,:,:,k),0);
% % sp(:,:,:,k)=gsw_spiciness0(SA(:,:,:,k),CT(:,:,:,k));
% end

eccosa.lat=la;
eccosa.lon=lo;
eccosa.ro=ro;
% eccosa.sp=sp;
eccosa.sal=sal;l
eccosa.temp=temp;
eccosa.mld=mld;
eccosa.z=z;
eccosa.uvel=u;
eccosa.vvel=v;
eccosa.wvel=w;
eccosa.weddy=wed;

eccosa.ueddy=ued;
eccosa.veddy=ved;
save('eccosa.mat','eccosa','-v7.3');

