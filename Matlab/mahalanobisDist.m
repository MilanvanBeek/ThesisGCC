%Use Data, Fin as input

numGoats = height(DataS5);
numFeatures = width(DataS5);

%%
data = DataS5{:,:}; 

%%
covMatrix = cov(data);

%%

invCov = inv(covMatrix); % the inverse of the covariance matrix

distanceMatrix = zeros(numGoats); % create a numGoats x numGoats empty matrix

%%

for i= 1:numGoats
  for j = i+1: numGoats
     distanceMatrix(i,j) = ((data(i,:)-data(j,:)) * invCov) *(data(i,:)-data(j,:))' ;
%check the formula here: https://en.wikipedia.org/wiki/Mahalanobis_distance
% we don't use the squareroot, as MDS will use a squared distance matrix
     distanceMatrix(j,i) = distanceMatrix(i,j); % they are symmetrical
  end
end

%%
xlswrite('distMat.xlsx', distanceMatrix);
