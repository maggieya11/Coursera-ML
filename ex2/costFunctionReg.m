function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta



% h(theta)
h = sigmoid(X*theta);

% Find indices of positive and negative examples
pos = find( y==1 );
neg = find( y==0 );

% Classifier is discrete for y>=0 and y<0
sum1 = sum(log(h(pos,1)));
sum2 = sum(log(1-h(neg,1)));

theta_lambda = theta;
theta_lambda(1,1) = 0; 

J = -(sum1+sum2)/m + sum(theta_lambda.^2)*lambda/2/m;   % regularization
grad = (X'*(h-y))/m + theta_lambda*(lambda/m); 

% =============================================================

end