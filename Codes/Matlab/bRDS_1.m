
clear;clc;close all;

%% get data
tData = readtable('DESCS.xlsx');

% restrict the sample on time periods with at least 1001 observations in
% the cross-section
lInd = tData.NUMCS<1000;
tData(lInd,:)=[];

% dates (as I am used to work with)
vDates=datetime(fCell2CellOfStrings(num2cell(tData.TIME)),'InputFormat','yyyyMM');

%% create figure

dLinEWidth = 3;
iFontSize =18;

hF=figure(1);
set(hF,'Color','white')
% subplot with 3 rows and 1 column

subplot(3,1,1)
plot(vDates,tData.AVGR,'k--','LineWidth',dLinEWidth);
datetick('x','yy-mm','keeplimits')
grid on
recessionplot
title('Entwicklung der mittleren Zinsen fuer Hypothekendarlehen in den USA','FontSize',iFontSize,'FontWeight','bold')
ylabel('Durchschnittlicher Zins in %','FontSize',iFontSize)
xlabel('Zeit','FontSize',iFontSize)

subplot(3,1,2)
plot(vDates,tData.STDR,'k--','LineWidth',dLinEWidth);
datetick('x','yy-mm','keeplimits')
grid on
recessionplot
title('Entwicklung der Zinsvariabilitaet zwischen den Hypothekendarlehen in den USA','FontSize',iFontSize,'FontWeight','bold')
ylabel('STD im Querschnitt in %','FontSize',iFontSize)
xlabel('Zeit','FontSize',iFontSize)

subplot(3,1,3)
bar(vDates,tData.NUMCS./1000,'EdgeColor','black','FaceColor',[.8 .8 .8]);
datetick('x','yy-mm','keeplimits')
grid on
recessionplot
title('Anzahl der Hypothekendarlehen pro Monat in den USA','FontSize',iFontSize,'FontWeight','bold')
ylabel('Anzahl in 1000','FontSize',iFontSize)
xlabel('Zeit','FontSize',iFontSize)

