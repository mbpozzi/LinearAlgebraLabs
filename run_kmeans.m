clear;
rng(0);
load('mnist_train.mat')
%% Problem 1 
imshow(reshape(data(1,:),28,28));
imshow(reshape(data(3,:),28,28)); 
imshow(reshape(data(7,:),28, 28));

%% Problem 2
%1
[idx, C] = kmeans(data,3,'replicates',5);
figure(2)
imshow(reshape(C(1,:),28,28));
figure(3)
imshow(reshape(C(2,:),28,28));
figure(4)
imshow(reshape(C(3,:),28,28));
%2 
counter1 = 0;
counter2 = 0;
counter3 = 0;
for i = 1:1892
    if idx(i, 1) == 1
        if labels(i, 1) == 7
            counter1 = counter1 + 1;
        end
    end
    if idx(i, 1) == 2
        if labels(i, 1) == 6
            counter2 = counter2 + 1;
        end
    end
    if idx(i, 1) == 3
        if labels(i, 1) == 1
            counter3 = counter3 + 1;
        end
    end
    
end
%3 
for i = 1:1892
    if idx(i,1) == 1
        if labels(i,1) ~= 7
            a = i;
        end 
    end
    if idx(i,1) == 2
        if labels(i,1) ~= 6
            b = i;
        end 
    end
    if idx(i,1) == 3
        if labels(i,1) ~= 1
            c = i;
        end 
    end
end
%% Problem 3 
load('mnist_test.mat')
min_dist = zeros(312, 1);
vectors = zeros(312, 3);
[idxtest, Ctest] = kmeans(data_test, 3, 'replicates', 5);
Ctest1 = reshape(Ctest(1,:), 28, 28);
figure(5);
imshow(Ctest1);
Ctest2 = reshape(Ctest(2,:), 28, 28);
figure(6);
imshow(Ctest2);
Ctest3 = reshape(Ctest(3,:), 28, 28);
figure(7);
imshow(Ctest3);
for i = 1:312
     R = reshape(data_test(i,:), 28, 28);
     vector = [norm(R - Ctest1), norm(R - Ctest2), norm(R - Ctest3)];
     vectors(i,:) = vector;
     min_dist(i) = min(vector);
end

counter13 = 0;
counter23 = 0;
counter33 = 0;
for i = 1:312
    if idxtest(i, 1) == 3
        if labels_test(i, 1) == 7
            counter13 = counter13 + 1;
        end
    end
    if idxtest(i, 1) == 2
        if labels_test(i, 1) == 1
            counter23 = counter23 + 1;
        end
    end
    if idxtest(i, 1) == 1
        if labels_test(i, 1) == 6
            counter33 = counter33 + 1;
        end
    end
    
end

