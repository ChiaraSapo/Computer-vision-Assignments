%% F = EightPointsAlgorithm(P1,P2) version 1

% Calculated the Fundamental matrix between two views from the normalized 8
% point algorithm
% inputs: 
%               P1      3xN     homogeneous coordinates of matched points in view 1
%               P2      3xN     homogeneous coordinates of matched points in view 2
% outputs:
%               F       3x3     Fundamental matrix

function F_prime = EightPointsAlgorithm(P1,P2)

    uno(1:size(P1,2)) = 1;
    
    % in the slide 17: n=15
    A = [(P2(1,:).*P1(1,:))', (P2(1,:).*P1(2,:))', (P2(1,:)'), (P1(1,:).*P2(2,:))', (P1(2,:).*P2(2,:))', (P2(2,:)'), (P1(1,:)'), (P1(2,:))', uno'];
    
    %size(A): 15x9 (9: elements of F)
    [U,D,V] = svd(A);
    F_hat = reshape(V(:,end),3,3);
    
    % force rank of F to be 2 and compute F
    [U_prime,D_prime,V_prime] = svd(F_hat);
    
    D_prime(3,3) = 0; %set sigma3 = 0
    F_prime = U_prime*D_prime*V_prime';
    
end
