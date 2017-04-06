% Linear Reggression.
% Y1 = θ1 + θ2 * X
clear ; 
close all; 
clc;
graphics_toolkit ("gnuplot");
% Simple Linear reggression
  theta_num = 2;
  
% Initialisation of Theta values. Y = Theta0 + ( Theta1 * X )
% form Theta as the vector of 2 * 1 matrix . 
 theta = ones(theta_num, 1);

% Data Intialisation %
Data = [ 2.0, 100, 0.001, 5.1, 102.1, 4.1;
         2.5, 200, 0.002, 6.1, 202.4, 6.0;
         3.0, 300, 0.003, 6.9, 303,   9.2;
         3.5, 400, 0.004, 7.8, 403.4, 12.0;
         4.0, 500, 0.005, 9.2, 504.2, 17;
         4.5, 600, 0.006, 9.9, 604.8, 20;
         5.0, 700, 0.007, 11.5,704.8, 25.5;
         5.5, 800, 0.008, 12.0,805.7, 31;
         6.0, 900, 0.009, 12.8,905.7, 36.4];
         
% Y1 Dependent variable  
 Y = Data(:,4);
 % n  number of the Data sets
 n  = length(Y) ;
 % X matrix of independent variable.  
 X = Data(:,1); 

% Plotting the data "y" 
figure(1); % open a new figure window
plot(X,Y,'rx','MarkerSize', 10);
title ("Plot of Data ");
xlabel ("X");
ylabel ("Y");

% Finding the alpha and no of iteration values. 
 alpha =0.01;
 iterations = 1000;
 
 % computing J for Theta1 = 0 and Theta2 = 0;
  theta = gradientDescent(X, Y, theta, alpha, iterations,n);
  fprintf('The theta values are %f  %f \n', theta(1,1), theta(2,1));  

 % Prediction of y values for x1 = 4.1 and x1 = 6.5.
x1 = 4.10;
y1 = theta(1,1) + x1* theta(2,1);

x2 =  6.5;
y2 = theta(1,1) + x2* theta(2,1);

fprintf('The prediction values for x1 %f  is %f \n', x1, y1);  
fprintf('The prediction values for x1 %f  is %f \n', x2, y2); 
 

% Plot the linear reggression model.
figure(2)
plot(X,Y,'rx','MarkerSize', 10);
title ("Plot of Data ");
xlabel ("X");
ylabel ("Y");
hold on; % keep previous plot visible
plot(X, theta(1,1) + X*theta(2,1))
legend('Data set', 'Linear regression Model')
hold
X = [ones(n,1), X];
X*theta

