% Input the initial data
first_age_class = input ("The number of people in the first age class(less than or equal to 20 years old): ");
second_age_class = input ("The number of people in the seconde age class(between 20 and 40 years old): ");
third_age_class = input ("The number of people in the third age class(more than 40 years old): ");
% Survival percentages
percentage_1 = input("Survival rate of first age class after 20 years: ");
percentage_2 = input("Survival rate of second age class after 20 years: ");
percentage_3 = input("Survival rate of third age class after 20 years: "); 
% Average birth rate of each age class during the period of 20 years
birth_rate_1 = input("The average birth rate of people in the first age class during the period of 20 years: ");
birth_rate_2 = input("The average birth rate of people in the second age class during the period of 20 years: ");
birth_rate_3 = input("The average birth rate of people in the third age class during the period of 20 years: ");
% Logic check
if first_age_class < 0 || second_age_class < 0 || third_age_class < 0
    error("Population numbers must be non-negative.");
elseif percentage_1 > 1 || percentage_1 < 0 || percentage_2 > 1 || percentage_2 < 0 || percentage_3 > 1 || percentage_3 < 0
    error("Survival rate must be less than 1 and greater than 0");
elseif birth_rate_1 < 0 || birth_rate_2 < 0 || birth_rate_3 < 0
    error("The average birth rate must be non-negative");
end

% Transition matrix
X = [birth_rate_1   birth_rate_2   birth_rate_3
     percentage_1   0              0
     0              percentage_2   percentage_3 ]; %transition matrix
fprintf("The transition matrix is: \n");
disp(X); %print the transition matrix

% The number of people there will be in the third age class after 40 years
Y = [first_age_class  second_age_class  third_age_class];
Z = X * X * Y'; 
fprintf("The number of people there will be in the third age class after 40 years: %d\n",Z(3,1));
% The number of people there were in the third age class 20 years ago
M = pinv(X) * Y';
fprintf("The number of people there were in the third age class 20 years ago: %d\n",M(3,1));



