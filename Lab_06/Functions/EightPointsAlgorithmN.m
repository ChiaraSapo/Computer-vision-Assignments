%% F = EightPointsAlgorithmN(P1,P2) version 2

% Calculated the Fundamental matrix between two views from the normalized 8
% point algorithm
% inputs: 
%               P1      3xN     homogeneous coordinates of matched points in view 1
%               P2      3xN     homogeneous coordinates of matched points in view 2
% outputs:
%               F       3x3     Fundamental matrix

function F = EightPointsAlgorithmN(P1,P2)
    %nP1, nP2 are the x_tilda1, x_tilda2
    [nP1, T1_prime] = normalise2dpts(P1);
    [nP2, T2_prime] = normalise2dpts(P2);
    
    uno(1:size(nP1,2)) = 1;
    
    A = [(nP2(1,:).*nP1(1,:))', (nP2(1,:).*nP1(2,:))', (nP2(1,:)') ... 
         (nP1(1,:).*nP2(2,:))', (nP1(2,:).*nP2(2,:))', (nP2(2,:)') ... 
                   (nP1(1,:)'),           (nP1(2,:))',       uno'];
  
    [U,D,V] = svd(A);
    
    F_hat = reshape(V(:,end),3,3)';
    
    [Uf,Df,Vf] = svd(F_hat);
    Df(3,3) = 0;
    
    F_norm_prime = Uf*Df*Vf'; % F tilda
    
    %Denormalize:
    F = T2_prime' * F_norm_prime* T1_prime; 

end

