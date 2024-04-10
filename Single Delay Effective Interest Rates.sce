
function [q, r, info] = gye_delays(d, N, r_f)
    // input: d is where the delay happened; it can be a scalar
    // N is the number of settlements
    // r_f is the flat rate
    // output: q is the solution of q(d) in the GYE
    // r = -N * log(q)
    // info displays whether if fsolve converges properly

    // Define the gye function for fsolve
    function N_0 = gye(Q)
        // Generate a sequence of Q raised to different powers up to N.
        Q_seq = Q .^ (1:N);
        
        // Calculate N_0 considering a single delay
        Q_del = Q ^ d;
        N_0 = N - (1 + r_f) * (sum(Q_seq) - Q_del);
    endfunction

    // Use fsolve to find the solution
    [q, v, info] = fsolve(1, gye);

    // Calculate a related value r using the solution q
    r = -N * log(q);
endfunction


