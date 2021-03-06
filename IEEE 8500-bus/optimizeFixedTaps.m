function  [Network]=optimizeFixedTaps(Network)
defineCommonOptimizationParameters;
defineCVXSettings;
cvx_begin sdp
%% 1. Define variables
defineCommonVariablesAndExpressions;
% defineSeparationVariables;

%% 2. Define objective;
defineObjective;
subject to:
%% 3. Constraints
defineCommonWConstraints;
defineSgConstraints;
definePowerFlowConstraintsFixedTaps;
% defineWyeIConstraints;
cvx_end

%% 4. Check Constraints
% checkConstraints;

%% 5. Recover taps
% recoverTaps;
% % 
%% 6. Return solution
% defineCommonOptimizationOutputs;



