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


z=X*theta;
h=sigmoid(z) ;%hypothesis
tempTheta=theta;
tempTheta(1)=0;

%J=(1/m).*[sum(-y.*log(X*theta)-(1-y).*log(1-X*theta))]
%J=(1/m).*[sum(-y.*log(sigmoid(z))-(1-y).*log(1-sigmoid(z)))]


J=(1/m).*[sum(-y.*log(h)-(1-y).*log(1-h))]+(lambda/(2*m))*[sum(theta(2:size(theta,1)).^2)];

%J=(1/m).*[sum(-y.*log(h)-(1-y).*log(1-h))]+(lambda/(2*m))*[sum(tempTheta.^2)];
 error = h - y; 

grad=  ( 1 /m ) * (X'*error) +(lambda/m).*tempTheta;
  
 

%J = (-1 / m) * sum(y.*log(sigmoid(X * theta)) + (1 - y).*log(1 - sigmoid(X * theta))) + (lambda / (2 * m))*sum(tempTheta.^2);
%temp = sigmoid (X * theta);
%error = temp - y;
%grad = (1 / m) * (X' * error) + (lambda/m)*tempTheta;

% =============================================================

end
