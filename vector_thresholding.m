function [z] = vector_thresholding(vector, K)
    
    N = max(size(vector));
    magnitude = abs(vector);
    
    sorted_magnitude = sort(magnitude,'descend');
    
    value_K_largest = sorted_magnitude(K); % value of the K-th largest entry of vector

    vector_thresholded = vector;

    for i=1:N
    
        if abs(vector(i)) < value_K_largest;
            
            vector_thresholded(i) = 0;
            
        end
       
    end
    
    z = vector_thresholded;

end