%display images

clear;
load('yale_data.mat');
number_subjects = 15;
number_faces =11;

subject_faces = [];

for i=1:number_subjects
   
    index_of_subject_face = i; %%%complete this 
    current_face = reshape(faces(:,index_of_subject_face),64,64);
    subject_faces = [subject_faces,current_face];
    
end
figure(1);
imagesc(subject_faces);
axis equal;
axis tight;
colormap(gray);

C = covariance(faces);






[vec,val] = eigs(C,10);
subject_faces2 = [];
for i=1:10
   
    index_of_subject_face = i; %%%complete this 
    current_face = reshape(vec(:,index_of_subject_face),64,64);
    subject_faces2 = [subject_faces2,current_face];
    
end
figure(2);
imagesc(subject_faces2);
axis equal;
axis tight;
colormap(gray);

[vec,val] = eigs(C,20);
subject_faces3 = [];
for i=1:20
   
    index_of_subject_face = i; %%%complete this 
    current_face = reshape(vec(:,index_of_subject_face),64,64);
    subject_faces3 = [subject_faces3,current_face];
    
end
figure(3);
imagesc(subject_faces3);
axis equal;
axis tight;
colormap(gray);

%% Problem 3
a = 15; 
b = 8;
M_a = faces(:,[155:165]);
M_b = faces(:,[78:88]);
C_a = covariance(M_a);
C_b = covariance(M_b);

[vec, val] = eigs(C_a,5);
subject_faces4 = [];
for i=1:5
    index_of_subject_face = i; %%%complete this 
    current_face = reshape(vec(:,index_of_subject_face),64,64);
    subject_faces4 = [subject_faces4,current_face];
end
figure(4);
imagesc(subject_faces4);
axis equal;
axis tight;
colormap(gray);

[vec, val] = eigs(C_b,5);
subject_faces5 = [];
for i=1:5
    index_of_subject_face = i; %%%complete this 
    current_face = reshape(vec(:,index_of_subject_face),64,64);
    subject_faces5 = [subject_faces5,current_face];
end
figure(5);
imagesc(subject_faces5);
axis equal;
axis tight;
colormap(gray);

M_ab = M_a + M_b;
C_ab = covariance(M_ab);
[vec, val] = eigs(C_ab,5);
subject_faces6 = [];
for i=1:5
    index_of_subject_face = i; %%%complete this 
    current_face = reshape(vec(:,index_of_subject_face),64,64);
    subject_faces6 = [subject_faces6,current_face];
end
figure(6);
imagesc(subject_faces6);
axis equal;
axis tight;
colormap(gray);


